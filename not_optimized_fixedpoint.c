/*
 * matrix_inverse_fixed.c
 *
 * Unoptimized 8x8 matrix inversion using Gauss-Jordan elimination
 * with partial pivoting.
 *
 * All stored matrix elements use signed 16-bit Q4.12 fixed-point.
 *
 * Q4.12:
 *   Scale factor: 2^12 = 4096
 *   Real range:   -8.0 to approximately 7.999755859375
 *
 * This is intended to be the pure-software integer baseline.
 * It does not use NEON, CLZ, loop unrolling, custom instructions,
 * floating-point arithmetic, or 64-bit integers.
 */

#include <stdio.h>
#include <stdint.h>

#define N 8   // Matrix dimension, 8x8 matrices

#define FRACTION_BITS 12   // Number of fractional bits in Q4.12 representation
#define FIXED_ONE     (1 << FRACTION_BITS)   //4096 

/*
 * Converts an integer constant to Q4.12.
 *
 * Only use this when the integer is between -8 and 7.
 */
#define Q12_FROM_INT(value) \
    ((int16_t)((value) * FIXED_ONE))

#define MATRIX_SUCCESS   1  /* Inversion completed successfully. */
#define MATRIX_SINGULAR  0  /* Matrix has no usable pivot at the current precision. */
#define MATRIX_OVERFLOW -1  /* An intermediate/result exceeded the int16_t Q4.12 range. */

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

    int row;   // General row-loop index
    int column;   // General column-loop index
    int pivot_column;   // Column currently being reduced
    int pivot_row;   // Row selected to provide pivot
    int other_row;   // Row currently being cleared during elimination

    int32_t largest_value;   // Largest absolute pivot candidate found so far
    int32_t current_value;   // Absolute value of the current pivot candidate
    int32_t division_result;   // Temporary Q4.12 division result before narrowing
    int32_t product;   // Temporary Q4.12 multiplication result
    int32_t updated_value;   // Element value after subtracting the pivot-row contribution

    int16_t pivot_value;   // Q4.12 value used to normalize the current pivot row
    int16_t elimination_factor;   // Value used to eliminate the current pivot-column entry

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
         * The same row operation is applied to both working and inverse
         * so that [A | I] is transformed toward [I | A^-1].
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

            for (column = 0; column < N; column++) {
                /*
                 * working[other_row][column] =
                 *     working[other_row][column]
                 *     - elimination_factor
                 *     * working[pivot_column][column]
                 */
                product = fixed_multiply(elimination_factor, working[pivot_column][column]);

                updated_value = (int32_t)working[other_row][column] - product;

                if (!fixed_result_fits_int16(updated_value)) {
                    return MATRIX_OVERFLOW;
                }

                working[other_row][column] = (int16_t)updated_value;

                /*
                 * Perform the same operation on the inverse.
                 */
                product = fixed_multiply(elimination_factor, inverse[pivot_column][column]);

                updated_value = (int32_t)inverse[other_row][column] - product;

                if (!fixed_result_fits_int16(updated_value)) {
                    return MATRIX_OVERFLOW;
                }

                inverse[other_row][column] = (int16_t)updated_value;
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