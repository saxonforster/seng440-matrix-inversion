/*
 * matrix_optimized.c
 *
 * 8x8 matrix inversion by Gauss-Jordan elimination with partial pivoting,
 * in signed 16-bit Q4.12 fixed point. Optimized for ARMv7-A / Cortex-A7
 * with NEON (neon-vfpv4, hard float ABI).
 *
 * Build switches:
 *   -DEXACT_BASELINE_ROUNDING=1  bit-identical rounding to the scalar
 *                                baseline, six extra vector ops per 4 lanes
 *   -DCLZ_INLINE_ASM=1           hand-written CLZ instead of __builtin_clz
 *
 * "OPT n" tags below refer to the optimizations by the same number in the
 * final report; the report explains why, these comments explain what.
 */


#include <stdio.h>
#include <stdint.h>
#include <limits.h>
#include <arm_neon.h>

#define N 8   // Matrix dimension, 8x8 matrices

#define AUGMENTED_N (2 * N)   //Columns in the fused augmented matrix: [ working | inverse ]


#define FRACTION_BITS 12   // Number of fractional bits in Q4.12 representation
#define FIXED_ONE     (1 << FRACTION_BITS)   // 4096

/* Scales an integer literal into Q4.12. Valid only for -8 .. 7. */
#define Q12_FROM_INT(value) \
    ((int16_t)((value) * FIXED_ONE))

#define MATRIX_SUCCESS   1   // Inversion successful
#define MATRIX_SINGULAR  0   // Matrix has no usable pivot at the current precision
#define MATRIX_OVERFLOW -1   // A result exceeded the int16_t Q4.12 range

/*
 * Absolute value of a Q4.12 element, returned 32-bit because abs(-32768)
 * does not fit in int16_t.
 *
 * OPT 1: branch-free, so the pivot search has nothing to mispredict.
 */
static inline int32_t fixed_absolute(int16_t value)
{
    int32_t widened_value = value;              /* sign-extend to 32 bits */
    int32_t sign_mask     = widened_value >> 31; /* 0 if >= 0, all ones if < 0 */

    /* XOR by the mask flips the bits of a negative, the subtract adds the +1 */
    return (widened_value ^ sign_mask) - sign_mask;
}

/* True when a 32-bit intermediate can be narrowed back to int16_t storage. */
static inline int fixed_result_fits_int16(int32_t value)
{
    if (value < INT16_MIN || value > INT16_MAX) {
        return 0;
    }

    return 1;
}

/*
 * Q4.12 multiply. Each operand carries a 2^12 scale factor, so the product
 * carries 2^24 and must be shifted back down by 12 to return to Q4.12.
 * Returns int32_t so the caller can range-check before storing.
 *
 * Only reached from multiply_matrices(), which is off the timed path.
 */
static inline int32_t fixed_multiply(int16_t first, int16_t second)
{
    int32_t product;
    int32_t magnitude;

    product = (int32_t)first * (int32_t)second;   /* full 32-bit, no truncation */

    if (product >= 0) {
        /* add half an LSB before truncating: round half up */
        return (product + (1 << (FRACTION_BITS - 1)))
            >> FRACTION_BITS;
    }

    /* negative: round the magnitude, then re-apply the sign, so halves */
    /* go away from zero rather than toward negative infinity */
    magnitude = -product;

    return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
}

/*
 * Q4.12 divide: result = (numerator * 2^12) / denominator.
 *
 * OPT 1 throughout. Returns 1 on success, 0 when the denominator is zero.
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
        return 0;                       /* caller treats this as singular */
    }

    /*
     * Three algebraic exits that skip the hardware divider. The zero test
     * carries most of the traffic: the inverse half starts as the identity,
     * so it is mostly zeros during the early pivot columns.
     */
    if (numerator == 0) {
        *result = 0;
        return 1;
    }

    if (denominator == FIXED_ONE) {     /* x / 1.0 */
        *result = numerator;
        return 1;
    }

    if (denominator == -FIXED_ONE) {    /* x / -1.0 */
        *result = -(int32_t)numerator;
        return 1;
    }

    /*
     * x/x -> 1.0 is deliberately NOT added here. The baseline's rounding
     * pushes a negative same-sign quotient toward zero and yields 4095, not
     * 4096, and that divergence compounds through later pivot steps.
     */

    denominator_32 = denominator;

    /*
     * Pre-scale the numerator by 2^12. Shifting a negative signed int is
     * undefined in C, so the shift is done as uint32_t; reinterpreting the
     * result back is exact two's complement and costs no instructions.
     */
    scaled_numerator =
        (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);

    /* |denominator| / 2, built from the same mask trick, no divide */
    denominator_mask = denominator_32 >> 31;
    half_denominator =
        ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;

    /*
     * Round half away from zero: nudge the numerator by half a denominator
     * in the direction of the quotient's sign before truncating. The
     * quotient is negative exactly when the two operand signs differ, which
     * is the XOR of their sign masks; that mask then selects add or subtract
     * without a branch.
     */
    quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
    rounding_term =
        (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;

    *result = (scaled_numerator + rounding_term) / denominator_32;

    return 1;
}

/*
 * Q4.12 identity as a constant table, so seeding the inverse half is eight
 * vector loads from .rodata instead of a 64-iteration scalar nest.
 * OPT 3: 16-byte aligned so the loads take the [rN:128] fast path.
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

/* Fills a matrix with the Q4.12 identity: one 128-bit copy per row. */
/* invert_matrix() reads the table directly. */
void create_identity(int16_t matrix[N][N])
{
    int row;

    for (row = 0; row < N; row++) {
        vst1q_s16(matrix[row], vld1q_s16(identity_q12[row]));
    }
}

/* Exchanges two rows: one 128-bit load pair, one 128-bit store pair. */
/* invert_matrix() swaps augmented rows inline. */
void swap_rows(int16_t matrix[N][N], int row1, int row2)
{
    int16x8_t first  = vld1q_s16(matrix[row1]);   /* read both rows before */
    int16x8_t second = vld1q_s16(matrix[row2]);   /* either store lands */

    vst1q_s16(matrix[row1], second);
    vst1q_s16(matrix[row2], first);
}

/*
 * ====================================================================
 * OPT 4 / OPT 9: the NEON elimination kernel
 * ====================================================================
 *
 * Per lane c:  target[c] -= (factor * pivot[c]) / 4096
 *
 * The default kernel re-associates that so the subtraction happens before
 * the rounding shift, in 32-bit:
 *
 *     (t*4096 - f*p + 2048) >> 12  ==  t + ((2048 - f*p) >> 12)
 *
 * which is VSHLL -> VMLSL -> VRSHR, six vector ops per four lanes instead
 * of twelve. Range: |t*4096| <= 2^27 and |f*p| <= 2^30, so the 32-bit
 * accumulator cannot overflow.
 */

/*
 * OPT 9: folds a value to a width that is monotone in magnitude, so many
 * results can be ORed into one accumulator and range-checked together.
 * Yields |v| for v >= 0 and |v|-1 for v < 0; either fits in int16_t exactly
 * when the folded value is <= INT16_MAX.
 */
static inline int32x4_t fold_to_magnitude(int32x4_t value)
{
    return veorq_s32(value, vshrq_n_s32(value, 31));
}

#ifndef EXACT_BASELINE_ROUNDING
#define EXACT_BASELINE_ROUNDING 0
#endif

#if EXACT_BASELINE_ROUNDING

/* Literal evaluation order: matches the scalar baseline bit for bit. */
static inline int16x8_t neon_eliminate_row(int16x8_t target,
                                           int16x8_t pivot,
                                           int16_t factor,
                                           int32x4_t *overflow)
{
    /* widening multiply by a scalar: 8 lanes of int16 -> 2 x 4 lanes int32 */
    int32x4_t product_low  = vmull_n_s16(vget_low_s16(pivot),  factor);
    int32x4_t product_high = vmull_n_s16(vget_high_s16(pivot), factor);

    int32x4_t sign_low  = vshrq_n_s32(product_low,  31);   /* save the signs */
    int32x4_t sign_high = vshrq_n_s32(product_high, 31);

    int32x4_t low;
    int32x4_t high;

    /* strip sign, rounding-shift the magnitude (VRSHR rounds up on ties) */
    product_low  = vrshrq_n_s32(vsubq_s32(veorq_s32(product_low, sign_low),
                                          sign_low), FRACTION_BITS);
    product_high = vrshrq_n_s32(vsubq_s32(veorq_s32(product_high, sign_high),
                                          sign_high), FRACTION_BITS);

    /* restore sign: net effect is round half away from zero */
    product_low  = vsubq_s32(veorq_s32(product_low,  sign_low),  sign_low);
    product_high = vsubq_s32(veorq_s32(product_high, sign_high), sign_high);

    /* widen the target and subtract in 32 bits */
    low  = vsubq_s32(vmovl_s16(vget_low_s16(target)),  product_low);
    high = vsubq_s32(vmovl_s16(vget_high_s16(target)), product_high);

    *overflow = vorrq_s32(*overflow,
                          vorrq_s32(fold_to_magnitude(low),
                                    fold_to_magnitude(high)));

    /* narrow back to eight int16 lanes for storage */
    return vcombine_s16(vmovn_s32(low), vmovn_s32(high));
}

#else

/* Re-associated kernel: rounds half up, differs from baseline by <= 1 LSB. */
static inline int16x8_t neon_eliminate_row(int16x8_t target,
                                           int16x8_t pivot,
                                           int16_t factor,
                                           int32x4_t *overflow)
{
    /*
     * OPT 7: low and high are independent dependency chains, written
     * interleaved so the in-order core always has a ready instruction while
     * the other chain's multiply is still in flight.
     */

    /* widen target to 32 bits and scale by 2^12 in one instruction */
    int32x4_t low  = vshll_n_s16(vget_low_s16(target),  FRACTION_BITS);
    int32x4_t high = vshll_n_s16(vget_high_s16(target), FRACTION_BITS);

    /* widening multiply-subtract: acc -= pivot * factor, still 32-bit exact */
    low  = vmlsl_n_s16(low,  vget_low_s16(pivot),  factor);
    high = vmlsl_n_s16(high, vget_high_s16(pivot), factor);

    /* single rounding shift back to Q4.12 */
    low  = vrshrq_n_s32(low,  FRACTION_BITS);
    high = vrshrq_n_s32(high, FRACTION_BITS);

    /* OPT 9: accumulate widths instead of testing each lane here */
    *overflow = vorrq_s32(*overflow,
                          vorrq_s32(fold_to_magnitude(low),
                                    fold_to_magnitude(high)));

    return vcombine_s16(vmovn_s32(low), vmovn_s32(high));
}

#endif /* EXACT_BASELINE_ROUNDING */

/*
 * Collapses the four accumulator lanes to one scalar via OR, then one
 * NEON-to-ARM transfer. OPT 9: called once per pivot column, not per row.
 */
static inline uint32_t reduce_overflow(int32x4_t first, int32x4_t second)
{
    uint32x4_t merged = vreinterpretq_u32_s32(vorrq_s32(first, second));
    uint32x2_t pair   = vorr_u32(vget_low_u32(merged),    /* 4 lanes -> 2 */
                                 vget_high_u32(merged));

    pair = vpmax_u32(pair, pair);   /* 2 lanes -> 1; OR-equivalent here */

    return vget_lane_u32(pair, 0);  /* the one transfer off the NEON side */
}

/*
 * OPT 11: CLZ for overflow prediction and precision measurement. This does
 * not speed anything up; it reports headroom the baseline could not.
 */
#ifndef CLZ_INLINE_ASM
#define CLZ_INLINE_ASM 0
#endif

/* Magnitude bits in signed Q4.12, excluding the sign. */
#define MATRIX_MAGNITUDE_BITS 15

/* Spec says |a[i][j]| <= 1.0, so no input exceeds 4096: 13 magnitude bits. */
/* The identity half contributes exactly the same 4096. */
#define MATRIX_INPUT_BITS 13

/*
 * Instrumentation written by invert_matrix(). Non-static so the demo and
 * timing drivers can pick them up with `extern int ...;`.
 *
 *   matrix_peak_magnitude_bits  widest result actually produced
 *   matrix_predicted_bits       widest result CLZ predicted beforehand
 */
int matrix_peak_magnitude_bits = 0;
int matrix_predicted_bits      = 0;

static inline int count_leading_zeros(uint32_t value)
{
#if CLZ_INLINE_ASM
    uint32_t result;

    __asm__ __volatile__ (
        "clz\t%0, %1\n"
        : "=r" (result)
        : "r"  (value)
    );

    return (int)result;
#else
    return __builtin_clz(value);   // one CLZ on Cortex-A7
#endif
}

/* Position of the highest set bit, plus one. Zero for zero. */
static inline int magnitude_bits(uint32_t folded)
{
    return folded ? 32 - count_leading_zeros(folded) : 0;
}

/*
 * Inverts an 8x8 Q4.12 matrix by Gauss-Jordan elimination with partial
 * pivoting.
 *
 * Returns MATRIX_SUCCESS, MATRIX_SINGULAR (no nonzero pivot available at
 * this precision), or MATRIX_OVERFLOW (a result left signed 16-bit Q4.12).
 */
int invert_matrix(const int16_t input[N][N], int16_t inverse[N][N])
{
    /*
     * OPT 2 + OPT 3: one fused, 16-byte-aligned augmented matrix.
     *   [r][0..7]   working copy of A, driven to I
     *   [r][8..15]  the inverse being built
     * 8 x 16 x 2 bytes = 256 bytes, four cache lines, one base pointer.
     */
    int16_t augmented[N][AUGMENTED_N] __attribute__((aligned(16)));

    /* OPT 6: rows that actually need elimination, and their factors. */
    int     target_row[N - 1];
    int16_t target_factor[N - 1];
    int     target_count;

    int row;   // General row-loop index
    int column;   // General column-loop index
    int pivot_column;   // Column currently being reduced
    int pivot_row;   // Row selected to provide pivot
    int index;

    int32_t largest_value;   // Largest absolute pivot candidate found so far
    int32_t current_value;   // Absolute value of the current pivot candidate
    int32_t division_result;   // Temporary Q4.12 division result before narrowing

    int16_t pivot_value;   // Q4.12 value used to normalize the current pivot row

    /* OPT 5: normalized pivot row, loaded once per pivot column. */
    int16x8_t pivot_low;    // Its columns 0..7
    int16x8_t pivot_high;   // Its columns 8..15

    /* OPT 8: the row currently being multiplied, subtracted and stored. */
    int16_t  *stage_pointer;   // Start of the current augmented row
    int16x8_t stage_low;   // Columns 0..7 of the current row
    int16x8_t stage_high;   // Columns 8..15 of the current row
    int16_t   stage_factor;   // Elimination factor for the current row

    /* OPT 8: the row already in flight, loaded one iteration early. */
    int16_t  *next_pointer;
    int16x8_t next_low;
    int16x8_t next_high;
    int16_t   next_factor;

    /* OPT 9: ORed magnitudes for every result in this pivot step. */
    int32x4_t overflow_a;
    int32x4_t overflow_b;

    int peak_bits;   // Largest magnitude bit-width observed so far
    int step_bits;   // Largest magnitude bit-width produced in this pivot step
    int growth_bits;   // CLZ-based estimate of extra bits caused by normalization

    peak_bits = MATRIX_INPUT_BITS;
    matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
    matrix_predicted_bits = MATRIX_INPUT_BITS;

    /*
     * Build [A | I] in sixteen 128-bit accesses. The caller's input may be
     * unaligned, so those loads carry no alignment qualifier; the
     * destination is aligned by declaration.
     */
    for (row = 0; row < N; row++) {
        vst1q_s16(&augmented[row][0], vld1q_s16(input[row]));
        vst1q_s16(&augmented[row][N], vld1q_s16(identity_q12[row]));
    }

    /* One pass per pivot column: select, swap, normalize, eliminate. */
    for (pivot_column = 0; pivot_column < N; pivot_column++) {

        /*
         * Partial pivoting: find the largest magnitude at or below the
         * diagonal in this column. Stays scalar because the column is
         * strided by 32 bytes, but the body is small enough for GCC to
         * if-convert the max update into conditional moves.
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

        /* An exact stored zero means no usable pivot exists at Q4.12. */
        if (largest_value == 0) {
            return MATRIX_SINGULAR;
        }

        /*
         * OPT 11, normalizing scales every magnitude by
         * 4096/|pivot|, adding log2(4096/|p|) = CLZ(|p|) - 19 bits.
         * largest_value is |pivot| after the swap and is known nonzero,
         * so this costs one CLZ.
         *
         * Recorded, not enforced: over 200k random matrices it catches
         * 97.9% of real overflows but false-alarms on 31% of successes.
         * The exact post-elimination test decides the return status.
         */
        growth_bits = count_leading_zeros((uint32_t)largest_value) - 19;

        if (growth_bits < 0) {
            growth_bits = 0;        /* pivot >= 1.0 shrinks, never grows */
        }

        if (peak_bits + growth_bits > matrix_predicted_bits) {
            matrix_predicted_bits = peak_bits + growth_bits;
        }

        /*
         * Move the chosen pivot row onto the diagonal. OPT 2: the fused
         * layout makes this four vector accesses covering both matrices,
         * replacing two calls to an eight-iteration scalar swap.
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
         * Normalize the pivot row so its pivot entry becomes 1.0. This is
         * the one part of the algorithm NEON cannot take, because NEON has
         * no integer divide. OPT 1 carries it instead: most of these calls
         * exit on an algebraic fast path without reaching the divider.
         * Fixed trip count of 16.
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

        /* OPT 5: hoisted out of the elimination loop below, 112 loads -> 16. */
        pivot_low  = vld1q_s16(&augmented[pivot_column][0]);
        pivot_high = vld1q_s16(&augmented[pivot_column][N]);

        /*
         * OPT 6: scalar prepass. Both data-dependent tests, skip the pivot
         * row and skip an already-zero factor, are evaluated here and their
         * survivors written to a dense worklist. That leaves the vector
         * loop with a fixed, branch-free body, which is what makes the
         * software pipeline below legal.
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

        overflow_a = vdupq_n_s32(0);   /* fresh accumulator for this step */
        overflow_b = vdupq_n_s32(0);   /* fresh accumulator for this step */

        if (target_count > 0) {
            /*
             * OPT 8: software-pipelined elimination, depth one.
             * Stage 1 is a row's two VLD1s; stage 2 is the
             * VSHLL/VMLSL/VRSHR/VMOVN chain and the stores. On an in-order
             * core, adjacent stages for the same row stall the multiply on
             * the load, so row i+1's loads are issued before row i's
             * arithmetic. Depth one suffices: the loop runs at most seven
             * times and deeper would spill the NEON register file.
             */

            /* ---------------- PROLOGUE ---------------- */
            /* Load the first row so the kernel always has data in hand. */
            stage_pointer = &augmented[target_row[0]][0];
            stage_low     = vld1q_s16(stage_pointer);
            stage_high    = vld1q_s16(stage_pointer + N);
            stage_factor  = target_factor[0];

            /* ---------------- KERNEL ------------------ */
            for (index = 1; index < target_count; index++) {

                /* Stage 1 of iteration i: start the loads now. */
                next_pointer = &augmented[target_row[index]][0];
                next_low     = vld1q_s16(next_pointer);
                next_high    = vld1q_s16(next_pointer + N);
                next_factor  = target_factor[index];

                /*
                 * Stage 2 of iteration i-1: its data has been in flight
                 * since the previous pass, so the multiply issues without
                 * stalling. The two calls are independent and use separate
                 * accumulators, giving four concurrent 4-lane chains.
                 */
                vst1q_s16(stage_pointer,
                          neon_eliminate_row(stage_low, pivot_low,
                                             stage_factor, &overflow_a));
                vst1q_s16(stage_pointer + N,
                          neon_eliminate_row(stage_high, pivot_high,
                                             stage_factor, &overflow_b));

                /* Rotate: what was next becomes current. */
                stage_pointer = next_pointer;
                stage_low     = next_low;
                stage_high    = next_high;
                stage_factor  = next_factor;
            }

            /* ---------------- EPILOGUE ---------------- */
            /* Drain the last row, whose loads had no successor to overlap. */
            vst1q_s16(stage_pointer,
                      neon_eliminate_row(stage_low, pivot_low,
                                         stage_factor, &overflow_a));
            vst1q_s16(stage_pointer + N,
                      neon_eliminate_row(stage_high, pivot_high,
                                         stage_factor, &overflow_b));

            /*
             * Force the eliminated entries to exact zero. Rounding can
             * leave them at +/- 1 LSB, and later pivot searches rely on
             * structural zeros being exactly zero.
             */
            for (index = 0; index < target_count; index++) {
                augmented[target_row[index]][pivot_column] = 0;
            }

            /*
             * OPT 9: one NEON-to-ARM transfer for the whole pivot step.
             * Deferring costs nothing, since an overflow discards the
             * entire result anyway.
             */
            step_bits = magnitude_bits(reduce_overflow(overflow_a, overflow_b));

            if (step_bits > peak_bits) {
                peak_bits                  = step_bits;
                matrix_peak_magnitude_bits = step_bits;
            }

            if (step_bits > MATRIX_MAGNITUDE_BITS) {
                return MATRIX_OVERFLOW;   /* did not fit signed Q4.12 */
            }
        }
    }

    /* Copy the inverse half back to the caller: eight 128-bit load/stores. */
    for (row = 0; row < N; row++) {
        vst1q_s16(inverse[row], vld1q_s16(&augmented[row][N]));
    }

    return MATRIX_SUCCESS;
}

/*
 * Q4.12 matrix multiply, result = first * second, used to verify that
 * A * A^-1 approximates the identity. int32_t storage so a sum of eight
 * products need not fit in int16_t.
 *
 * Verification only, off the timed path. Left scalar because the access
 * into `second` is column-strided and rounding is applied per product,
 * both of which make a vector form cost more than it saves.
 */
void multiply_matrices(const int16_t first[N][N], const int16_t second[N][N], int32_t result[N][N])
{
    int row;
    int column;
    int k;

    int32_t sum;
    const int16_t *first_row;

    for (row = 0; row < N; row++) {

        first_row = first[row];   /* invariant across the column loop */

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
 * Infinity norm in Q4.12: the maximum absolute row sum, ||A||inf.
 *
 * OPT 10: one 128-bit load per row. Widening to 32 bits before VABS keeps
 * -32768 correct. The horizontal sum is a two-step pairwise reduction, so there is exactly one NEON-to-ARM
 * transfer per row rather than eight scalar loads with a branch each.
 */
int32_t matrix_infinity_norm(const int16_t matrix[N][N])
{
    int row;

    int32_t row_sum;
    int32_t maximum_row_sum = 0;

    for (row = 0; row < N; row++) {
        int16x8_t values = vld1q_s16(matrix[row]);   /* whole row at once */

        /* widen each half to 32 bits, then take magnitudes */
        int32x4_t low  = vabsq_s32(vmovl_s16(vget_low_s16(values)));
        int32x4_t high = vabsq_s32(vmovl_s16(vget_high_s16(values)));

        int32x4_t sum4 = vaddq_s32(low, high);                    /* 8 -> 4 */
        int32x2_t sum2 = vadd_s32(vget_low_s32(sum4), vget_high_s32(sum4));

        row_sum = vget_lane_s32(vpadd_s32(sum2, sum2), 0);        /* 2 -> 1 */

        if (row_sum > maximum_row_sum) {
            maximum_row_sum = row_sum;
        }
    }

    return maximum_row_sum;
}

/*
 * Multiplies two nonnegative int32_t Q4.12 values, checking first that the
 * 32-bit product will not overflow. Returns 1 on success, 0 if it would.
 */
int multiply_positive_q12(int32_t first, int32_t second, int32_t *result)
{
    int32_t product;

    if (first < 0 || second < 0) {
        return 0;                              /* contract violation */
    }

    if (first != 0 && second > INT32_MAX / first) {
        return 0;                              /* would overflow int32_t */
    }

    product = first * second;

    /* OPT 1: rescale by 2^12 with a shift instead of a divide */
    *result = product >> FRACTION_BITS;

    return 1;
}

/*
 * Condition number k(A) = ||A||inf * ||A^-1||inf, returned as int32_t
 * Q4.12. Returns 1 on success, 0 if the product exceeds int32_t.
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