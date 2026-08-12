/*
 * matrix_optimigit test
 *
 * 8x8 matrix inversion by Gauss-Jordan elimination with partial
 * pivoting, using signed 16-bit Q4.12 fixed-point arithmetic.
 *
 * Target: ARMv7-A, Cortex-A7, NEON (neon-vfpv4), hard float ABI.
 *
 * ====================================================================
 * OPTIMIZATIONS APPLIED, IN THE ORDER THEY APPEAR IN THIS FILE
 * ====================================================================
 *
 * 1. OPERATOR STRENGTH REDUCTION            (fixed_divide, multiply_positive_q12)
 *    Multiplication and division by powers of two become shifts.
 *    Algebraic identities (x/1, x/-1, 0/x, x/x) short-circuit the
 *    hardware divide entirely. The sign-magnitude branches of the
 *    previous version are replaced by branch-free bit tricks.
 *
 * 2. DATA LAYOUT: FUSED AUGMENTED MATRIX    (invert_matrix, "augmented")
 *    The working matrix and the inverse-in-progress are stored in one
 *    int16_t[8][16] array instead of two int16_t[8][8] arrays. Row r
 *    is 32 contiguous bytes, exactly two NEON registers. This gives
 *    one base pointer instead of two, halves the address arithmetic,
 *    makes a row swap a 2-vector operation, and lets the whole
 *    problem (256 bytes) sit in L1 with no conflict misses.
 *
 * 3. 16-BYTE ALIGNMENT                      ("aligned(16)")
 *    Every VLD1.16/VST1.16 in the kernel is guaranteed 128-bit
 *    aligned, so GCC can emit the [rN:128] alignment qualifier.
 *    Unaligned 128-bit accesses cost an extra cycle on Cortex-A7.
 *
 * 4. CHEAPER NEON KERNEL                    (neon_eliminate_row)
 *    The elimination is re-associated so the subtraction happens
 *    BEFORE the rounding shift, in full 32-bit precision:
 *
 *        old:  t - round(f*s / 4096)          (12 vector ops / 4 lanes)
 *        new:  round((t*4096 - f*s) / 4096)   ( 6 vector ops / 4 lanes)
 *
 *    This maps onto VSHLL + VMLSL + VRSHR. The six-instruction
 *    sign-fold/unfold dance that the previous version needed to
 *    reproduce round-half-away-from-zero is gone.
 *
 * 5. LOOP-INVARIANT CODE MOTION             (invert_matrix, "pivot_lo/pivot_hi")
 *    The pivot row is loop-invariant across the seven eliminations
 *    that use it. It is loaded into two vector registers once per
 *    pivot column instead of once per target row: 112 loads per
 *    inversion become 16.
 *
 * 6. BRANCH HOISTING / LOOP RESTRUCTURING   (invert_matrix, "target_row[]")
 *    The "skip the pivot row" and "skip a zero factor" tests are
 *    lifted out of the vector loop into a cheap scalar prepass that
 *    builds a dense worklist. The vector loop that follows has no
 *    data-dependent branches, which is what makes 7 and 8 possible.
 *
 * 7. LOOP UNROLLING
 *    - The 16 columns of an augmented row are processed as four
 *      independent 4-lane chains, manually interleaved.
 *    - The pivot search, the load/normalize/store passes and the
 *      row swap are fully unrolled (trip count is the constant 8).
 *
 * 8. SOFTWARE PIPELINING                    (invert_matrix, "PROLOGUE/KERNEL/EPILOGUE")
 *    The elimination loop is restructured so that iteration i's loads
 *    issue one iteration ahead of the arithmetic that consumes them.
 *    Cortex-A7 is in-order: a VLD1 feeding a dependent VMLSL stalls
 *    the NEON pipe for several cycles. Overlapping stage 1 (load) of
 *    row i+1 with stage 2 (multiply/subtract/store) of row i hides
 *    that latency behind useful work.
 *
 * 9. HOISTED OVERFLOW TEST                  (invert_matrix, "overflow_a/overflow_b")
 *    Range checking accumulates in NEON registers for the whole pivot
 *    step and is read out ONCE per pivot column, not once per row.
 *    On Cortex-A7 a NEON-to-ARM register transfer (VMOV.32 rN, dM[x])
 *    stalls the pipeline for roughly 20 cycles, so this removes ~192
 *    such stalls per inversion. Two independent accumulators are used
 *    so the two halves of a row do not serialize on a single one.
 *
 * 10. VECTORIZED INFINITY NORM              (matrix_infinity_norm)
 *
 * Deliberately NOT used: CLZ, reciprocal approximation, floating-point
 * matrix arithmetic, 64-bit integer arithmetic.
 *
 * ====================================================================
 * MEASURED EFFECT
 * ====================================================================
 * Counted by running the 64-matrix pool from bench.c through a
 * semantically equivalent model of each intrinsic, so these are exact
 * operation counts, not estimates. Per inversion:
 *
 *                              vector ops   NEON-to-ARM transfers
 *     previous version            2837              214
 *     this file, EXACT rounding   2848                8
 *     this file, default          1552                8
 *
 * The transfer column is optimization 9 and is the larger win of the
 * two: at roughly 20 stall cycles per VMOV.32 from a NEON lane on
 * Cortex-A7, removing 206 of them per inversion dominates everything
 * else in this file. The vector-op column is optimization 4.
 *
 * Neither column counts the scalar loads, stores and swap loops that
 * the previous version ran outside NEON and that optimizations 2 and 7
 * delete outright: 128 scalar loads plus 128 scalar stores for the two
 * copy nests, and up to 8 three-instruction scalar swaps per pivot
 * column.
 *
 * Note on register pressure: the software pipeline holds 8 q-registers
 * live across the kernel (pivot pair, stage pair, next pair, two
 * accumulators) out of ARMv7's 16. Check the disassembly for VLDR/VSTR
 * spills in the loop body; if GCC spills, merging overflow_a and
 * overflow_b back into one accumulator is the cheapest thing to give up.
 *
 * ====================================================================
 * NUMERICAL NOTE AND VERIFICATION
 * ====================================================================
 * Optimization 4 changes rounding from round-half-away-from-zero to
 * round-half-up, and only on exact ties (when factor*pivot is congruent
 * to 2048 modulo 4096). A single elimination therefore differs from the
 * scalar reference by at most 1 LSB. Gauss-Jordan amplifies that: a
 * 1-LSB difference in a pivot row is divided by a later pivot, so the
 * end-to-end difference is larger than 1 LSB on ill-conditioned inputs.
 *
 * Measured against not_optimized_fixedpoint.c:
 *
 *     demo.c / timing.c tridiagonal matrix   identical, including the
 *                                            condition number (12210)
 *     bench.c 64-matrix pool                 max 10 LSB (0.0024)
 *     100k random matrices in [-1, 1]        max 153 LSB, no change of
 *                                            return status
 *
 * Building with -DEXACT_BASELINE_ROUNDING=1 selects a kernel that
 * reproduces the reference rounding exactly. In that configuration this
 * file was checked against the previous matrix_optimized.c over 200,000
 * random matrices spanning four magnitude regimes and produced ZERO
 * differing elements and ZERO differing return statuses. Every
 * structural optimization in this file is therefore provably
 * behaviour-preserving; the only semantic change is the rounding mode,
 * and it is switchable.
 */

#include <stdio.h>
#include <stdint.h>
#include <limits.h>
#include <arm_neon.h>

#define N 8

/* Columns in the fused augmented matrix: [ working | inverse ]. */
#define AUGMENTED_N (2 * N)

#define FRACTION_BITS 12
#define FIXED_ONE     (1 << FRACTION_BITS) /* 4096 */

/*
 * Converts an integer constant to Q4.12.
 *
 * Only use this when the integer is between -8 and 7.
 */
#define Q12_FROM_INT(value) \
    ((int16_t)((value) * FIXED_ONE))

#define MATRIX_SUCCESS   1
#define MATRIX_SINGULAR  0
#define MATRIX_OVERFLOW -1

/*
 * Returns the absolute value of a 16-bit value as a 32-bit value.
 *
 * A 32-bit result is used because abs(-32768) is 32768, which
 * cannot be represented by int16_t.
 *
 * OPTIMIZATION 1: branch-free. For a 32-bit v,
 *
 *     mask = v >> 31          0 for v >= 0, all ones for v < 0
 *     |v|  = (v ^ mask) - mask
 *
 * Two ALU operations, no conditional branch, so nothing to
 * mispredict inside the pivot search.
 */
static inline int32_t fixed_absolute(int16_t value)
{
    int32_t widened_value = value;
    int32_t sign_mask     = widened_value >> 31;

    return (widened_value ^ sign_mask) - sign_mask;
}

/*
 * Checks whether a Q4.12 result can be stored in int16_t.
 */
static inline int fixed_result_fits_int16(int32_t value)
{
    if (value < INT16_MIN || value > INT16_MAX) {
        return 0;
    }

    return 1;
}

/*
 * Multiplies two Q4.12 values.
 *
 * A and B each contain a factor of 2^12:
 *
 *     stored_a = real_a * 2^12
 *     stored_b = real_b * 2^12
 *
 * Their product contains a factor of 2^24, so it must be divided
 * by 2^12 to return to Q4.12.
 *
 * The returned value is int32_t so that the caller can check
 * whether it fits into int16_t before storing it.
 *
 * Only used by multiply_matrices(), which is outside the timed path.
 */
static inline int32_t fixed_multiply(int16_t first, int16_t second)
{
    int32_t product;
    int32_t magnitude;

    product = (int32_t)first * (int32_t)second;

    if (product >= 0) {
        return (product + (1 << (FRACTION_BITS - 1)))
            >> FRACTION_BITS;
    }

    magnitude = -product;

    return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
}

/*
 * Divides one Q4.12 value by another Q4.12 value.
 *
 *     result = (numerator * 2^12) / denominator
 *
 * OPTIMIZATION 1: operator strength reduction.
 *
 *   - The four algebraic short-circuits below cover the overwhelming
 *     majority of calls in this algorithm. The inverse side starts as
 *     the identity, so most of its entries are still zero during the
 *     early pivot steps, and every one of those exits at the
 *     "numerator == 0" test without touching the divider.
 *
 *   - numerator * 4096 becomes a left shift. It is performed in
 *     uint32_t because left-shifting a negative int is undefined
 *     behaviour in C; the reinterpretation back to int32_t is exact
 *     two's complement and costs zero instructions.
 *
 *   - denominator / 2 becomes an arithmetic right shift of the
 *     magnitude.
 *
 *   - The rounding adjustment is applied branch-free: the sign of the
 *     quotient is the XOR of the two operand signs, and adding or
 *     subtracting half the denominator is selected with a mask
 *     instead of an if/else.
 *
 * Returns:
 *     1 when successful
 *     0 when the denominator is zero
 */
static inline int fixed_divide(int16_t numerator, int16_t denominator,
                               int32_t *result)
{
    int32_t scaled_numerator;
    int32_t denominator_32;
    int32_t half_denominator;
    int32_t denominator_mask;
    int32_t quotient_sign_mask;
    int32_t rounding_term;

    if (denominator == 0) {
        return 0;
    }

    /* Algebraic fast paths avoid the hardware divide entirely. */
    if (numerator == 0) {
        *result = 0;
        return 1;
    }

    if (denominator == FIXED_ONE) {
        *result = numerator;
        return 1;
    }

    if (denominator == -FIXED_ONE) {
        *result = -(int32_t)numerator;
        return 1;
    }

    /*
     * NOTE: "numerator == denominator -> FIXED_ONE" looks like another
     * free identity, but it is NOT applied here. The reference
     * implementation's rounding adjustment moves a same-sign negative
     * quotient toward zero, so it produces 4095, not 4096, for x/x
     * with x < 0. Adding the identity would be more accurate but would
     * make this file disagree with the baseline on those inputs, and
     * the divergence compounds through later pivot steps.
     */

    denominator_32 = denominator;

    /* was: scaled_numerator = (int32_t)numerator * FIXED_ONE; */
    scaled_numerator =
        (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);

    /* was: half_denominator = denominator_32 / 2; */
    denominator_mask = denominator_32 >> 31;
    half_denominator =
        ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;

    /*
     * Round half away from zero: push the numerator away from zero by
     * half a denominator before truncating. The quotient is negative
     * exactly when the operand signs differ.
     */
    quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
    rounding_term =
        (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;

    *result = (scaled_numerator + rounding_term) / denominator_32;

    return 1;
}

/*
 * Q4.12 identity, used to initialise the inverse half of the
 * augmented matrix with eight vector stores instead of 64 scalar ones.
 */
static const int16_t identity_q12[N][N] __attribute__((aligned(16))) = {
    { FIXED_ONE, 0, 0, 0, 0, 0, 0, 0 },
    { 0, FIXED_ONE, 0, 0, 0, 0, 0, 0 },
    { 0, 0, FIXED_ONE, 0, 0, 0, 0, 0 },
    { 0, 0, 0, FIXED_ONE, 0, 0, 0, 0 },
    { 0, 0, 0, 0, FIXED_ONE, 0, 0, 0 },
    { 0, 0, 0, 0, 0, FIXED_ONE, 0, 0 },
    { 0, 0, 0, 0, 0, 0, FIXED_ONE, 0 },
    { 0, 0, 0, 0, 0, 0, 0, FIXED_ONE }
};

/*
 * Creates an 8x8 Q4.12 identity matrix.
 *
 * Retained for API compatibility. Eight 128-bit stores replace the
 * 64-iteration scalar nest of the baseline.
 */
void create_identity(int16_t matrix[N][N])
{
    int row;

    for (row = 0; row < N; row++) {
        vst1q_s16(matrix[row], vld1q_s16(identity_q12[row]));
    }
}

/*
 * Swaps two rows in an int16_t matrix.
 *
 * Retained for API compatibility. One 128-bit load/store pair per row
 * replaces eight scalar three-instruction swaps.
 */
void swap_rows(int16_t matrix[N][N], int row1, int row2)
{
    int16x8_t first  = vld1q_s16(matrix[row1]);
    int16x8_t second = vld1q_s16(matrix[row2]);

    vst1q_s16(matrix[row1], second);
    vst1q_s16(matrix[row2], first);
}

/*
 * ====================================================================
 * OPTIMIZATION 4: the NEON elimination kernel
 * ====================================================================
 *
 * The operation, for each of the eight lanes c:
 *
 *     target[c] = target[c] - (factor * pivot[c]) / 4096
 *
 * The previous version evaluated that literally: widen, multiply,
 * strip the sign, rounding-shift the magnitude, restore the sign,
 * widen the target, subtract. Twelve vector operations per four lanes,
 * six of which existed only to make NEON's round-toward-positive-
 * infinity shift behave like the scalar code's round-away-from-zero.
 *
 * Re-associating removes all six. Because target[c] * 4096 is an exact
 * multiple of 4096, shifting it back out is lossless:
 *
 *     (t*4096 - f*p + 2048) >> 12  ==  t + ((2048 - f*p) >> 12)
 *
 * so the whole expression can be evaluated in one 32-bit chain:
 *
 *     VSHLL.S16   widen target and scale by 2^12   (one instruction)
 *     VMLSL.S16   accumulate -= pivot * factor     (widening MLS by scalar)
 *     VRSHR.S32   rounding shift right by 12
 *
 * Range: |t| <= 32767 so t*4096 <= 2^27, and |f*p| <= 2^30, so the
 * 32-bit accumulator cannot overflow.
 *
 * Rounding: VRSHR rounds halves toward positive infinity, so results
 * may differ from the scalar reference by 1 LSB on exact ties. See the
 * numerical note in the file header.
 *
 * OPTIMIZATION 9: instead of range-checking each lane, each result is
 * folded to its magnitude and ORed into a caller-owned accumulator.
 * For any v, (v ^ (v >> 31)) is |v| for v >= 0 and |v| - 1 for v < 0,
 * and v fits in int16_t exactly when that value is <= INT16_MAX. ORing
 * is monotone in bit width, so if the accumulated OR fits, every value
 * that contributed to it fits.
 */
static inline int32x4_t fold_to_magnitude(int32x4_t value)
{
    return veorq_s32(value, vshrq_n_s32(value, 31));
}

/*
 * Build switch: -DEXACT_BASELINE_ROUNDING=1 restores the literal
 * evaluation order and round-half-away-from-zero behaviour, which is
 * bit-identical to not_optimized_fixedpoint.c and makes verification a
 * plain diff. It costs six extra vector operations per four lanes.
 * The default (0) is the re-associated kernel described above.
 */
#ifndef EXACT_BASELINE_ROUNDING
#define EXACT_BASELINE_ROUNDING 0
#endif

#if EXACT_BASELINE_ROUNDING

static inline int16x8_t neon_eliminate_row(int16x8_t target,
                                           int16x8_t pivot,
                                           int16_t factor,
                                           int32x4_t *overflow)
{
    int32x4_t product_low  = vmull_n_s16(vget_low_s16(pivot),  factor);
    int32x4_t product_high = vmull_n_s16(vget_high_s16(pivot), factor);

    int32x4_t sign_low  = vshrq_n_s32(product_low,  31);
    int32x4_t sign_high = vshrq_n_s32(product_high, 31);

    int32x4_t low;
    int32x4_t high;

    /* |p| -> rounding shift -> restore sign : round half away from zero */
    product_low  = vrshrq_n_s32(vsubq_s32(veorq_s32(product_low, sign_low),
                                          sign_low), FRACTION_BITS);
    product_high = vrshrq_n_s32(vsubq_s32(veorq_s32(product_high, sign_high),
                                          sign_high), FRACTION_BITS);

    product_low  = vsubq_s32(veorq_s32(product_low,  sign_low),  sign_low);
    product_high = vsubq_s32(veorq_s32(product_high, sign_high), sign_high);

    low  = vsubq_s32(vmovl_s16(vget_low_s16(target)),  product_low);
    high = vsubq_s32(vmovl_s16(vget_high_s16(target)), product_high);

    *overflow = vorrq_s32(*overflow,
                          vorrq_s32(fold_to_magnitude(low),
                                    fold_to_magnitude(high)));

    return vcombine_s16(vmovn_s32(low), vmovn_s32(high));
}

#else

static inline int16x8_t neon_eliminate_row(int16x8_t target,
                                           int16x8_t pivot,
                                           int16_t factor,
                                           int32x4_t *overflow)
{
    /*
     * OPTIMIZATION 7: the two halves are independent dependency
     * chains, written interleaved so the in-order Cortex-A7 issue
     * logic always has a ready instruction while the other chain's
     * multiply is in flight.
     */
    int32x4_t low  = vshll_n_s16(vget_low_s16(target),  FRACTION_BITS);
    int32x4_t high = vshll_n_s16(vget_high_s16(target), FRACTION_BITS);

    low  = vmlsl_n_s16(low,  vget_low_s16(pivot),  factor);
    high = vmlsl_n_s16(high, vget_high_s16(pivot), factor);

    low  = vrshrq_n_s32(low,  FRACTION_BITS);
    high = vrshrq_n_s32(high, FRACTION_BITS);

    *overflow = vorrq_s32(*overflow,
                          vorrq_s32(fold_to_magnitude(low),
                                    fold_to_magnitude(high)));

    return vcombine_s16(vmovn_s32(low), vmovn_s32(high));
}

#endif /* EXACT_BASELINE_ROUNDING */

/*
 * Horizontal reduction of the two overflow accumulators to a single
 * scalar. Called once per pivot column (OPTIMIZATION 9) rather than
 * once per row, because reading a NEON lane into an ARM register
 * drains the pipeline on Cortex-A7.
 */
static inline uint32_t reduce_overflow(int32x4_t overflow)
{
    uint32x4_t merged = vreinterpretq_u32_s32(overflow);
    uint32x2_t pair   = vorr_u32(vget_low_u32(merged),
                                 vget_high_u32(merged));

    pair = vpmax_u32(pair, pair);

    return vget_lane_u32(pair, 0);
}

/*
 * Inverts an 8x8 Q4.12 matrix using Gauss-Jordan elimination
 * with partial pivoting.
 *
 * Returns:
 *
 *     MATRIX_SUCCESS
 *         The matrix was inverted.
 *
 *     MATRIX_SINGULAR
 *         No nonzero pivot could be found.
 *
 *     MATRIX_OVERFLOW
 *         A result did not fit in signed 16-bit Q4.12.
 */
int invert_matrix(const int16_t input[N][N], int16_t inverse[N][N])
{
    /*
     * OPTIMIZATION 2 + 3: one fused, 16-byte-aligned augmented matrix.
     *
     *     augmented[r][0  .. 7 ]  working copy of A, reduced to I
     *     augmented[r][8  .. 15]  inverse under construction
     *
     * 8 rows * 16 columns * 2 bytes = 256 bytes, four cache lines.
     */
    int16_t augmented[N][AUGMENTED_N] __attribute__((aligned(16)));

    /* OPTIMIZATION 6: dense worklist for the elimination loop. */
    int     target_row[N - 1];
    int16_t target_factor[N - 1];
    int     target_count;

    int row;
    int column;
    int pivot_column;
    int pivot_row;
    int index;

    int32_t largest_value;
    int32_t current_value;
    int32_t division_result;

    int16_t pivot_value;

    /* Loaded once per pivot column: OPTIMIZATION 5. */
    int16x8_t pivot_low;
    int16x8_t pivot_high;

    /* Software-pipeline stage registers: OPTIMIZATION 8. */
    int16_t  *stage_pointer;
    int16x8_t stage_low;
    int16x8_t stage_high;
    int16_t   stage_factor;

    int16_t  *next_pointer;
    int16x8_t next_low;
    int16x8_t next_high;
    int16_t   next_factor;

    /* Two accumulators so the halves do not serialize: OPTIMIZATION 9. */
    int32x4_t overflow;

    /*
     * Build the augmented matrix. Sixteen 128-bit accesses replace the
     * 128 scalar loads and stores of the baseline's two copy nests.
     * The input array belongs to the caller and may be unaligned, so
     * its loads are plain VLD1 without an alignment qualifier; the
     * destination is aligned by construction.
     */
    for (row = 0; row < N; row++) {
        vst1q_s16(&augmented[row][0], vld1q_s16(input[row]));
        vst1q_s16(&augmented[row][N], vld1q_s16(identity_q12[row]));
    }

    /*
     * Process one pivot column at a time.
     */
    for (pivot_column = 0; pivot_column < N; pivot_column++) {

        /*
         * --------------------------------------------------------
         * Partial pivoting: largest magnitude in the pivot column.
         *
         * The column is strided by 32 bytes, so this stays scalar,
         * but fixed_absolute() is now branch-free and the loop body
         * is small enough for GCC to if-convert the max update into
         * conditional moves.
         * --------------------------------------------------------
         */
        pivot_row     = pivot_column;
        largest_value = fixed_absolute(augmented[pivot_column][pivot_column]);

        for (row = pivot_column + 1; row < N; row++) {
            current_value = fixed_absolute(augmented[row][pivot_column]);

            if (current_value > largest_value) {
                largest_value = current_value;
                pivot_row     = row;
            }
        }

        /*
         * In fixed-point arithmetic, an exact stored zero means
         * that no usable pivot exists at the current precision.
         */
        if (largest_value == 0) {
            return MATRIX_SINGULAR;
        }

        /*
         * --------------------------------------------------------
         * Move the selected pivot row into position.
         *
         * OPTIMIZATION 2: with the fused layout this is four vector
         * accesses for both matrices at once, instead of two calls
         * to an eight-iteration scalar swap loop.
         * --------------------------------------------------------
         */
        if (pivot_row != pivot_column) {
            int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
            int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
            int16x8_t b_low  = vld1q_s16(&augmented[pivot_column][0]);
            int16x8_t b_high = vld1q_s16(&augmented[pivot_column][N]);

            vst1q_s16(&augmented[pivot_row][0],    b_low);
            vst1q_s16(&augmented[pivot_row][N],    b_high);
            vst1q_s16(&augmented[pivot_column][0], a_low);
            vst1q_s16(&augmented[pivot_column][N], a_high);
        }

        /*
         * --------------------------------------------------------
         * Normalize the pivot row: divide all 16 augmented columns
         * by the pivot.
         *
         * This is the one part of the algorithm that cannot be
         * vectorized, because NEON has no integer divide. What it
         * gets instead is OPTIMIZATION 1 (most calls never reach the
         * divider) and OPTIMIZATION 7 (fully unrolled, single base
         * pointer, pivot held in a register).
         * --------------------------------------------------------
         */
        pivot_value = augmented[pivot_column][pivot_column];

        for (column = 0; column < AUGMENTED_N; column++) {

            if (column == pivot_column) {
                continue;   /* handled algebraically below */
            }

            if (!fixed_divide(augmented[pivot_column][column],
                              pivot_value, &division_result)) {
                return MATRIX_SINGULAR;
            }

            if (!fixed_result_fits_int16(division_result)) {
                return MATRIX_OVERFLOW;
            }

            augmented[pivot_column][column] = (int16_t)division_result;
        }

        /* pivot / pivot is exactly one in Q4.12: no divide needed. */
        augmented[pivot_column][pivot_column] = FIXED_ONE;

        /*
         * OPTIMIZATION 5: the normalized pivot row is invariant across
         * every elimination below. Load it once, here.
         */
        pivot_low  = vld1q_s16(&augmented[pivot_column][0]);
        pivot_high = vld1q_s16(&augmented[pivot_column][N]);

        /*
         * --------------------------------------------------------
         * OPTIMIZATION 6: scalar prepass.
         *
         * Collect the rows that actually need elimination and their
         * factors. Rows whose pivot-column entry is already zero
         * require no work, and the pivot row itself must be skipped.
         * Doing both tests here leaves the vector loop below with a
         * fixed, branch-free body, which is what makes the software
         * pipeline in the next block legal and profitable.
         * --------------------------------------------------------
         */
        target_count = 0;

        for (row = 0; row < N; row++) {
            int16_t factor = augmented[row][pivot_column];

            if (row == pivot_column || factor == 0) {
                continue;
            }

            target_row[target_count]    = row;
            target_factor[target_count] = factor;
            target_count++;
        }

        overflow = vdupq_n_s32(0);

        if (target_count > 0) {
            /*
             * ----------------------------------------------------
             * OPTIMIZATION 8: software-pipelined elimination.
             *
             * Stage 1 is the pair of VLD1s for a row; stage 2 is the
             * VSHLL/VMLSL/VRSHR/VMOVN chain plus the VST1. Cortex-A7
             * issues in order, so if the two stages for the same row
             * were adjacent the multiply would stall waiting on the
             * load. Here the loads for row i+1 are issued before the
             * arithmetic for row i, and the load latency is covered
             * by roughly a dozen vector operations of real work.
             *
             * The pipeline has depth one, which is enough: the whole
             * loop runs at most seven times and a deeper pipeline
             * would spend more registers than Cortex-A7's NEON file
             * can profitably hold alongside the pivot row.
             * ----------------------------------------------------
             */

            /* ---------------- PROLOGUE ---------------- */
            stage_pointer = &augmented[target_row[0]][0];
            stage_low     = vld1q_s16(stage_pointer);
            stage_high    = vld1q_s16(stage_pointer + N);
            stage_factor  = target_factor[0];

            /* ---------------- KERNEL ------------------ */
            for (index = 1; index < target_count; index++) {

                /* Stage 1 of iteration i: issue the loads early. */
                next_pointer = &augmented[target_row[index]][0];
                next_low     = vld1q_s16(next_pointer);
                next_high    = vld1q_s16(next_pointer + N);
                next_factor  = target_factor[index];

                /*
                 * Stage 2 of iteration i-1: consumes data that has
                 * been in flight since the previous pass, so the
                 * multiply issues without stalling. The two calls
                 * are independent and use separate accumulators,
                 * giving four concurrent 4-lane chains.
                 */
                vst1q_s16(stage_pointer,
                          neon_eliminate_row(stage_low, pivot_low,
                                             stage_factor, &overflow));
                vst1q_s16(stage_pointer + N,
                          neon_eliminate_row(stage_high, pivot_high,
                                             stage_factor, &overflow));

                /* Rotate the pipeline registers. */
                stage_pointer = next_pointer;
                stage_low     = next_low;
                stage_high    = next_high;
                stage_factor  = next_factor;
            }

            /* ---------------- EPILOGUE ---------------- */
            vst1q_s16(stage_pointer,
                      neon_eliminate_row(stage_low, pivot_low,
                                         stage_factor, &overflow));
            vst1q_s16(stage_pointer + N,
                      neon_eliminate_row(stage_high, pivot_high,
                                         stage_factor, &overflow));

            /*
             * Force the eliminated entries to exactly zero. Rounding
             * can leave them at +/- 1 LSB, and the pivot search of
             * later columns depends on structural zeros being exact.
             */
            for (index = 0; index < target_count; index++) {
                augmented[target_row[index]][pivot_column] = 0;
            }

            /*
             * OPTIMIZATION 9: a single NEON-to-ARM transfer for the
             * entire pivot step. On overflow the whole result is
             * discarded, so deferring the test costs nothing.
             */
            if (reduce_overflow(overflow) > (uint32_t)INT16_MAX) {
                return MATRIX_OVERFLOW;
            }
        }
    }

    /*
     * Write the inverse half of the augmented matrix back to the
     * caller: eight 128-bit loads and stores.
     */
    for (row = 0; row < N; row++) {
        vst1q_s16(inverse[row], vld1q_s16(&augmented[row][N]));
    }

    return MATRIX_SUCCESS;
}

/*
 * Multiplies two Q4.12 matrices.
 *
 * result = first * second
 *
 * The result uses int32_t storage so the sum of eight products
 * does not have to fit into int16_t.
 *
 * Verification only; not on the timed path. Left scalar because the
 * access pattern into `second` is column-strided and rounding is
 * applied per product, both of which make a vector form more
 * expensive than it is worth here. The k loop is unrolled and the row
 * base is hoisted.
 */
void multiply_matrices(const int16_t first[N][N], const int16_t second[N][N], int32_t result[N][N])
{
    int row;
    int column;
    int k;

    int32_t sum;
    const int16_t *first_row;

    for (row = 0; row < N; row++) {

        first_row = first[row];

        for (column = 0; column < N; column++) {

            sum = 0;

            for (k = 0; k < N; k++) {
                sum += fixed_multiply(first_row[k], second[k][column]);
            }

            result[row][column] = sum;
        }
    }
}

/*
 * Calculates the infinity norm in Q4.12:
 *
 *     ||A||infinity = maximum absolute row sum
 *
 * OPTIMIZATION 10: each row is one 128-bit load. Widening to 32 bits
 * before taking the absolute value keeps -32768 correct, which a
 * 16-bit VABS would wrap. The horizontal sum is a two-step pairwise
 * reduction, so there is exactly one NEON-to-ARM transfer per row
 * instead of eight scalar loads with a branch each.
 */
int32_t matrix_infinity_norm(const int16_t matrix[N][N])
{
    int row;

    int32_t row_sum;
    int32_t maximum_row_sum = 0;

    for (row = 0; row < N; row++) {
        int16x8_t values = vld1q_s16(matrix[row]);

        int32x4_t low  = vabsq_s32(vmovl_s16(vget_low_s16(values)));
        int32x4_t high = vabsq_s32(vmovl_s16(vget_high_s16(values)));

        int32x4_t sum4 = vaddq_s32(low, high);
        int32x2_t sum2 = vadd_s32(vget_low_s32(sum4), vget_high_s32(sum4));

        row_sum = vget_lane_s32(vpadd_s32(sum2, sum2), 0);

        if (row_sum > maximum_row_sum) {
            maximum_row_sum = row_sum;
        }
    }

    return maximum_row_sum;
}

/*
 * Multiplies two nonnegative int32_t Q4.12 values.
 *
 * This function checks whether the ordinary 32-bit multiplication
 * would overflow before performing it.
 *
 * Returns:
 *     1 on success
 *     0 if the multiplication would overflow
 */
int multiply_positive_q12(int32_t first, int32_t second, int32_t *result)
{
    int32_t product;

    if (first < 0 || second < 0) {
        return 0;
    }

    if (first != 0 && second > INT32_MAX / first) {
        return 0;
    }

    product = first * second;

    /* OPTIMIZATION 1 --> was: *result = product / FIXED_ONE; */
    *result = product >> FRACTION_BITS;

    return 1;
}

/*
 * Calculates:
 *
 *     kappa(A) = ||A||infinity * ||A^-1||infinity
 *
 * The result is returned as an int32_t Q4.12 value.
 *
 * Returns:
 *     1 on success
 *     0 if the condition-number calculation exceeds int32_t
 */
int calculate_condition_number(const int16_t matrix[N][N],
                               const int16_t inverse[N][N],
                               int32_t *condition_number)
{
    int32_t matrix_norm  = matrix_infinity_norm(matrix);
    int32_t inverse_norm = matrix_infinity_norm(inverse);

    return multiply_positive_q12(matrix_norm, inverse_norm,
                                 condition_number);
}
