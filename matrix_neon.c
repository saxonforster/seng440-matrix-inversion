/*
 * matrix_neon.c
 *
 * 8x8 matrix inversion by Gauss-Jordan elimination with partial
 * pivoting, in signed 16-bit Q4.12 fixed-point.
 *
 * OPTIMIZATION STAGE: NEON SIMD
 *
 * This is not_optimized_fixedpoint.c with exactly two changes. It is
 * otherwise line-for-line the baseline, so a diff shows the whole
 * optimization and any measured difference is attributable to NEON.
 *
 *   CHANGE A  The per-element overflow test is hoisted out of the
 *             elimination inner loop and replaced by one test per row.
 *             This is a PREREQUISITE, not an optimization in its own
 *             right: the baseline can 'return MATRIX_OVERFLOW' from
 *             the middle of an iteration, and a loop with a
 *             data-dependent exit in the middle cannot be vectorized.
 *             There is no way to un-execute lanes that already ran.
 *
 *   CHANGE B  The elimination inner loop becomes two NEON row
 *             operations. A row is 8 int16 values, which is exactly
 *             one 128-bit NEON register, so eight scalar iterations
 *             collapse into a single vector pass.
 *
 * Everything else -- fixed_multiply, fixed_divide, the pivot search,
 * the condition-number code -- is untouched baseline.
 *
 * This file is self-contained. It needs no project headers.
 *
 * ARM ONLY. arm_neon.h exists only for ARM targets, so this must be
 * built inside the VM (or cross-compiled). Build:
 *
 *   gcc -O2 -march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 \
 *       -mfloat-abi=hard matrix_neon.c -o matrix_neon
 *
 * Verify by diffing its output against the baseline's -- for any
 * matrix that does not overflow, the two produce bit-identical
 * inverses.
 *
 * Q4.12:
 *   Scale factor: 2^12 = 4096
 *   Real range:   -8.0 to approximately 7.999755859375
 *
 * No CLZ, no reciprocal, no loop unrolling, no floating point, no
 * 64-bit integers.
 */

#include <stdio.h>
#include <stdint.h>
#include <limits.h>
#include <arm_neon.h>

#define N 8

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
 */
int32_t fixed_absolute(int16_t value)
{
    int32_t widened_value;

    widened_value = value;

    if (widened_value < 0) {
        widened_value = -widened_value;
    }

    return widened_value;
}

/*
 * Checks whether a Q4.12 result can be stored in int16_t.
 */
int fixed_result_fits_int16(int32_t value)
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
 */
int32_t fixed_multiply(int16_t first, int16_t second)
{
    int32_t product;

    /*
     * int16_t operands are promoted to int32_t.
     *
     * The largest possible magnitude is approximately:
     *
     *     32768 * 32768 = 1,073,741,824
     *
     * which fits in signed 32-bit storage.
     */
    product = (int32_t)first * (int32_t)second;

    /*
     * Apply simple rounding before removing the extra scale factor.
     */
    if (product >= 0) {
        product = product + (FIXED_ONE / 2);
    } else {
        product = product - (FIXED_ONE / 2);
    }

    return product / FIXED_ONE;
}

/*
 * Divides one Q4.12 value by another Q4.12 value.
 *
 * To preserve the Q4.12 scale:
 *
 *     result = (numerator * 2^12) / denominator
 *
 * Returns the result through result.
 *
 * Returns:
 *     1 when successful
 *     0 when the denominator is zero
 */
int fixed_divide(int16_t numerator, int16_t denominator, int32_t *result)
{
    int32_t scaled_numerator;
    int32_t denominator_32;
    int32_t half_denominator;

    if (denominator == 0) {
        return 0;
    }

    /*
     * Multiplication is used instead of left-shifting because
     * left-shifting a negative signed value is undefined in C.
     */
    scaled_numerator = (int32_t)numerator * FIXED_ONE;

    denominator_32 = denominator;

    /*
     * Apply rounding before integer division.
     */
    if (denominator_32 < 0) {
        half_denominator = -denominator_32 / 2;
    } else {
        half_denominator = denominator_32 / 2;
    }

    if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
        scaled_numerator += half_denominator;
    } else {
        scaled_numerator -= half_denominator;
    }

    *result = scaled_numerator / denominator_32;

    return 1;
}

/*
 * Creates an 8x8 Q4.12 identity matrix.
 *
 * The fixed-point representation of 1.0 is 4096.
 */
void create_identity(int16_t matrix[N][N])
{
    int row;
    int column;

    for (row = 0; row < N; row++) {
        for (column = 0; column < N; column++) {
            if (row == column) {
                matrix[row][column] = FIXED_ONE;
            } else {
                matrix[row][column] = 0;
            }
        }
    }
}

/*
 * Swaps two rows in an int16_t matrix.
 */
void swap_rows(int16_t matrix[N][N], int row1, int row2)
{
    int column;
    int16_t temporary;

    for (column = 0; column < N; column++) {
        temporary = matrix[row1][column];
        matrix[row1][column] = matrix[row2][column];
        matrix[row2][column] = temporary;
    }
}

/*
 * ===================== CHANGE B: NEON kernels =====================
 *
 * The elimination step for one row is, for c = 0..7:
 *
 *     target[c] = target[c] - (factor * source[c] + 2048) / 4096
 *
 * Eight independent lanes of 16-bit data. One NEON register is 128
 * bits, so the whole row is one vector pass.
 *
 * Intrinsics used and the Cortex-A7 instructions they generate:
 *
 *   vld1q_s16     VLD1.16    load 8 int16 lanes
 *   vst1q_s16     VST1.16    store 8 int16 lanes
 *   vmull_n_s16   VMULL.S16  widening multiply by a scalar, 4x 16->32
 *   vmovl_s16     VMOVL.S16  widen 16 -> 32
 *   vmovn_s32     VMOVN.I32  narrow 32 -> 16
 *   vsubq_s32     VSUB.I32   subtract
 *   veorq_s32     VEOR       exclusive or
 *   vshrq_n_s32   VSHR.S32   arithmetic shift right
 *   vrshrq_n_s32  VRSHR.S32  ROUNDING shift right
 *   vorrq_u32     VORR       bitwise or
 *
 * Note vrshrq_n_s32. The baseline's '+ 2048 then divide by 4096' is a
 * rounding shift, and NEON does the rounding inside the shift
 * instruction, so that whole add disappears in the vector version.
 */

/*
 * (product + 2048) / 4096 with round-half-away-from-zero, four lanes
 * at a time. This must match the baseline fixed_multiply() exactly.
 *
 * VRSHR rounds by adding half and shifting arithmetically, which for a
 * negative value rounds toward positive infinity rather than away from
 * zero. So the sign is stripped, the rounding shift applied to the
 * magnitude, and the sign put back:
 *
 *     sign = p >> 31            0 for positive, all-ones for negative
 *     |p|  = (p ^ sign) - sign  branch-free absolute value
 *
 * The four extra instructions buy output that is bit-identical to the
 * baseline, which makes verification a plain diff against it.
 */
static inline int32x4_t neon_q12_round_shift(int32x4_t product)
{
    int32x4_t sign      = vshrq_n_s32(product, 31);
    int32x4_t magnitude = vsubq_s32(veorq_s32(product, sign), sign);
    int32x4_t shifted   = vrshrq_n_s32(magnitude, FRACTION_BITS);

    return vsubq_s32(veorq_s32(shifted, sign), sign);
}

/*
 * One row of elimination:
 *
 *     target[0..7] -= (factor * source[0..7]) / 4096
 *
 * Each result is folded to its magnitude and ORed into the
 * accumulator, so the caller can range-check all eight lanes with one
 * comparison after the row instead of one per element.
 */
static inline void neon_eliminate_row(int16_t *target, const int16_t *source,
                                      int16_t factor, uint32x4_t *accumulator)
{
    int16x8_t source_vector = vld1q_s16(source);
    int16x8_t target_vector = vld1q_s16(target);

    int32x4_t product_low  = vmull_n_s16(vget_low_s16(source_vector),  factor);
    int32x4_t product_high = vmull_n_s16(vget_high_s16(source_vector), factor);

    int32x4_t difference_low;
    int32x4_t difference_high;

    product_low  = neon_q12_round_shift(product_low);
    product_high = neon_q12_round_shift(product_high);

    difference_low  = vsubq_s32(vmovl_s16(vget_low_s16(target_vector)),
                                product_low);
    difference_high = vsubq_s32(vmovl_s16(vget_high_s16(target_vector)),
                                product_high);

    *accumulator = vorrq_u32(*accumulator,
        vreinterpretq_u32_s32(veorq_s32(difference_low,
                                        vshrq_n_s32(difference_low, 31))));
    *accumulator = vorrq_u32(*accumulator,
        vreinterpretq_u32_s32(veorq_s32(difference_high,
                                        vshrq_n_s32(difference_high, 31))));

    vst1q_s16(target, vcombine_s16(vmovn_s32(difference_low),
                                   vmovn_s32(difference_high)));
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
    int16_t working[N][N];

    int row;
    int column;
    int pivot_column;
    int pivot_row;
    int other_row;

    int32_t largest_value;
    int32_t current_value;
    int32_t division_result;

    int16_t pivot_value;
    int16_t elimination_factor;

    /*
     * CHANGE A: OR of the folded magnitudes of every result in a row.
     *
     * For any value v, (v ^ (v >> 31)) is v's magnitude for positive v
     * and |v| - 1 for negative v, and v fits in int16_t exactly when
     * that is <= 32767. ORing them means the widest element sets the
     * highest bit, so if the OR fits then every element that produced
     * it fits. One comparison per row replaces 2N of them.
     */
    uint32_t range_accumulator;

    /*
     * Copy the input matrix so that the original is preserved.
     */
    for (row = 0; row < N; row++) {
        for (column = 0; column < N; column++) {
            working[row][column] = input[row][column];
        }
    }

    create_identity(inverse);

    /*
     * Process one pivot column at a time.
     */
    for (pivot_column = 0; pivot_column < N; pivot_column++) {
        /*
         * Partial pivoting:
         *
         * Find the row containing the largest absolute value
         * in the current pivot column.
         */
        pivot_row = pivot_column;

        largest_value = fixed_absolute(working[pivot_column][pivot_column]);

        for (row = pivot_column + 1; row < N; row++) {
            current_value = fixed_absolute(working[row][pivot_column]);

            if (current_value > largest_value) {
                largest_value = current_value;
                pivot_row = row;
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
         * Move the selected pivot row into position.
         */
        if (pivot_row != pivot_column) {
            swap_rows(working, pivot_row, pivot_column);

            swap_rows(inverse, pivot_row, pivot_column);
        }

        /*
         * Normalize the pivot row.
         */
        pivot_value = working[pivot_column][pivot_column];

        for (column = 0; column < N; column++) {

            /*
             * Normalize the working-matrix element.
             */
            if (!fixed_divide(working[pivot_column][column], pivot_value, &division_result)) {
                return MATRIX_SINGULAR;
            }

            if (!fixed_result_fits_int16(division_result)) {
                return MATRIX_OVERFLOW;
            }

            working[pivot_column][column] = (int16_t)division_result;

            /*
             * Apply the same division to the inverse side.
             */
            if (!fixed_divide(inverse[pivot_column][column], pivot_value, &division_result)) {
                return MATRIX_SINGULAR;
            }

            if (!fixed_result_fits_int16(division_result)) {
                return MATRIX_OVERFLOW;
            }

            inverse[pivot_column][column] = (int16_t)division_result;
        }

        /*
         * Force the pivot to exactly 1.0 in Q4.12.
         *
         * The division above should already produce 4096, but
         * explicitly setting it avoids retaining a possible
         * one-unit rounding difference.
         */
        working[pivot_column][pivot_column] = FIXED_ONE;

        /*
         * Eliminate the pivot-column value from every other row.
         */
        for (other_row = 0; other_row < N; other_row++) {

            if (other_row == pivot_column) {
                continue;
            }

            elimination_factor = working[other_row][pivot_column];

            /*
             * Skip the row if this column is already zero.
             *
             * This is only a correctness-preserving check, not a
             * performance optimization.
             */
            if (elimination_factor == 0) {
                continue;
            }

            {
                /*
                 * CHANGE B: two vector row operations replace the
                 * 2 * N scalar iterations of the baseline.
                 */
                uint32x4_t vector_accumulator = vdupq_n_u32(0);

                neon_eliminate_row(working[other_row],
                                   working[pivot_column],
                                   elimination_factor,
                                   &vector_accumulator);

                neon_eliminate_row(inverse[other_row],
                                   inverse[pivot_column],
                                   elimination_factor,
                                   &vector_accumulator);

                range_accumulator =
                      vgetq_lane_u32(vector_accumulator, 0)
                    | vgetq_lane_u32(vector_accumulator, 1)
                    | vgetq_lane_u32(vector_accumulator, 2)
                    | vgetq_lane_u32(vector_accumulator, 3);
            }

            /*
             * CHANGE A: one range test for the whole row.
             *
             * No CLZ needed -- a plain comparison against INT16_MAX is
             * enough, because the accumulator already holds folded
             * magnitudes.
             */
            if (range_accumulator > (uint32_t)INT16_MAX) {
                return MATRIX_OVERFLOW;
            }

            /*
             * Force the eliminated element to exactly zero.
             */
            working[other_row][pivot_column] = 0;
        }
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
 */
void multiply_matrices(const int16_t first[N][N], const int16_t second[N][N], int32_t result[N][N])
{
    int row;
    int column;
    int k;

    int32_t sum;
    int32_t product;

    for (row = 0; row < N; row++) {
        for (column = 0; column < N; column++) {

            sum = 0;

            for (k = 0; k < N; k++) {
                product = fixed_multiply(first[row][k], second[k][column]);
                sum += product;
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
 * The returned value is Q4.12 stored in int32_t.
 */
int32_t matrix_infinity_norm(const int16_t matrix[N][N])
{
    int row;
    int column;

    int32_t row_sum;
    int32_t maximum_row_sum;

    maximum_row_sum = 0;

    for (row = 0; row < N; row++) {
        row_sum = 0;

        for (column = 0; column < N; column++) {
            row_sum += fixed_absolute(matrix[row][column]);
        }

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

    /*
     * Both operands are Q4.12, so remove one scale factor.
     */
    *result = product / FIXED_ONE;

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
int calculate_condition_number(const int16_t matrix[N][N], const int16_t inverse[N][N], int32_t *condition_number)
{
    int32_t matrix_norm;
    int32_t inverse_norm;

    matrix_norm = matrix_infinity_norm(matrix);

    inverse_norm = matrix_infinity_norm(inverse);

    return multiply_positive_q12(matrix_norm, inverse_norm, condition_number);
}