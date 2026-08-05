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

#define _POSIX_C_SOURCE 199309L

#include <stdio.h>
#include <stdint.h>
#include <limits.h>
#include <time.h>

#define BENCHMARK_ITERATIONS 100000
#define WARMUP_ITERATIONS 1000

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
    int32_t magnitude;

    /*
     * int16_t operands are promoted to int32_t.
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
        return (product + (1 << (FRACTION_BITS - 1)))
            >> FRACTION_BITS;
    }

    magnitude = -product;

    return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
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
    int32_t denominator_magnitude;
    int32_t numerator_magnitude;

    if (denominator == 0) {
        return 0;
    }

    /* Algebraic fast paths avoid an integer divide entirely. */
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

    denominator_32 = denominator;

    // Operator strength reduction --> was: scaled_numerator = (int32_t)numerator * FIXED_ONE;
    if (numerator < 0) {
        numerator_magnitude = -(int32_t)numerator;
        scaled_numerator = -(numerator_magnitude << FRACTION_BITS);
    } else {
        scaled_numerator = (int32_t)numerator << FRACTION_BITS;
    }

    // Operator strength reduction --> was: half_denominator = denominator_32 / 2;
    if (denominator_32 < 0) {
        denominator_magnitude = -denominator_32;
    } else {
        denominator_magnitude = denominator_32;
    }

    half_denominator = denominator_magnitude >> 1;

    if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
        scaled_numerator += half_denominator;
    } else {
        scaled_numerator -= half_denominator;
    }

    *result = scaled_numerator / denominator_32;

    return 1;
}

/*
 * Prints one Q4.12 value without float, double, or int64_t.
 *
 * Decimal digits are generated one at a time to avoid overflowing
 * int32_t when converting the fractional part.
 */
void print_fixed_value(int32_t value)
{
    int32_t magnitude;  
    int32_t whole_part;
    int32_t remainder;
    int digit;
    int position;

    // Print the sign first.
    if (value < 0) {
        magnitude = -value;
    } else {
        magnitude = value;
    }

    // Extract the whole-number portion.
    whole_part = magnitude / FIXED_ONE;

    // Keep the remaining Q4.12 fractional portion.
    remainder = magnitude % FIXED_ONE;

    // Print the sign and whole part together 
    if (value < 0) {
        printf("-%ld.", (long)whole_part);
    } else {
        printf(" %ld.", (long)whole_part);
    }                                 

    // Generate six decimal digits.
    // The remainder is always less than 4096, so multiplying it by 10 stays safely within int32_t.
    for (position = 0; position < 6; position++) {
        remainder = remainder * 10;
        digit = (int)(remainder / FIXED_ONE);
        printf("%d", digit);
        remainder = remainder % FIXED_ONE;
    }
}


/*
 * Prints an 8x8 int16_t Q4.12 matrix.
 */
void print_matrix(const int16_t matrix[N][N])
{
    int row;
    int column;

    for (row = 0; row < N; row++) {
        for (column = 0; column < N; column++) {
            print_fixed_value(matrix[row][column]);
            printf(" ");
        }

        printf("\n");
    }
}

/*
 * Prints an 8x8 int32_t Q4.12 matrix.
 *
 * This is used for the verification result because a sum of eight
 * products may temporarily require more than 16 bits.
 */
void print_wide_matrix(const int32_t matrix[N][N])
{
    int row;
    int column;

    for (row = 0; row < N; row++) {
        for (column = 0; column < N; column++) {
            print_fixed_value(matrix[row][column]);
            printf(" ");
        }

        printf("\n");
    }
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

    int row;
    int column;
    int pivot_column;
    int pivot_row;
    int other_row;

    int32_t largest_value;
    int32_t current_value;
    int32_t division_result;
    int32_t product;
    int32_t updated_value;

    int16_t pivot_value;
    int16_t elimination_factor;

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
            if (column == pivot_column) {
                working[pivot_column][column] = FIXED_ONE;
            } else {
                if (!fixed_divide(working[pivot_column][column], pivot_value, &division_result)) {
                    return MATRIX_SINGULAR;
                }

                if (!fixed_result_fits_int16(division_result)) {
                    return MATRIX_OVERFLOW;
                }

                working[pivot_column][column] = (int16_t)division_result;
            }

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

    // Operator strength reduction --> was: *result = product / FIXED_ONE;
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
int calculate_condition_number(const int16_t matrix[N][N], const int16_t inverse[N][N], int32_t *condition_number)
{
    int32_t matrix_norm;
    int32_t inverse_norm;

    matrix_norm = matrix_infinity_norm(matrix);

    inverse_norm = matrix_infinity_norm(inverse);

    return multiply_positive_q12(matrix_norm, inverse_norm, condition_number);
}


/*
 * Returns elapsed wall-clock time in seconds.
 *
 * Floating point is used only by the benchmark harness. The matrix
 * inversion itself remains entirely fixed-point.
 */
static double elapsed_seconds(
    const struct timespec *start,
    const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec)
         + (double)(end->tv_nsec - start->tv_nsec)
           / 1000000000.0;
}


int main(void)
{
    /*
     * Example Q4.12 8x8 matrix.
     *
     * This matrix uses 4 on the diagonal and 1 beside the
     * diagonal. Every value is representable in Q4.12.
     *
     * The previous floating-point example used 10 on the
     * diagonal, but 10 is outside the Q4.12 range.
     */
    int16_t matrix[N][N] = {
        {
            Q12_FROM_INT(4), Q12_FROM_INT(1),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0)
        },
        {
            Q12_FROM_INT(1), Q12_FROM_INT(4),
            Q12_FROM_INT(1), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0)
        },
        {
            Q12_FROM_INT(0), Q12_FROM_INT(1),
            Q12_FROM_INT(4), Q12_FROM_INT(1),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0)
        },
        {
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(1), Q12_FROM_INT(4),
            Q12_FROM_INT(1), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0)
        },
        {
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(1),
            Q12_FROM_INT(4), Q12_FROM_INT(1),
            Q12_FROM_INT(0), Q12_FROM_INT(0)
        },
        {
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(1), Q12_FROM_INT(4),
            Q12_FROM_INT(1), Q12_FROM_INT(0)
        },
        {
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(1),
            Q12_FROM_INT(4), Q12_FROM_INT(1)
        },
        {
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(0), Q12_FROM_INT(0),
            Q12_FROM_INT(1), Q12_FROM_INT(4)
        }
    };

    int16_t inverse[N][N];
    int32_t verification[N][N];

    int32_t condition_number;
    int inversion_status;

    struct timespec start_time;
    struct timespec end_time;

    double total_seconds;
    double average_nanoseconds;
    int iteration;

     /*
     * Correctness check before benchmarking.
     *
     * This is outside the timed region.
     */
    inversion_status =
        invert_matrix(matrix, inverse);

    if (inversion_status == MATRIX_SINGULAR) {
        printf(
            "The matrix is singular, or no usable pivot "
            "exists at Q4.12 precision.\n"
        );

        return 1;
    }

    if (inversion_status == MATRIX_OVERFLOW) {
        printf(
            "Q4.12 overflow occurred during inversion.\n"
        );

        return 1;
    }

    multiply_matrices(
        matrix,
        inverse,
        verification
    );

    if (!calculate_condition_number(
            matrix,
            inverse,
            &condition_number)) {

        printf(
            "The condition-number calculation exceeded "
            "the available 32-bit range.\n"
        );

        return 1;
    }

    printf("Correctness check before benchmarking:\n");
    printf(
        "  inversion status: %d\n",
        inversion_status
    );
    printf(
        "  inverse[0][0]: %d\n",
        inverse[0][0]
    );
    printf(
        "  verification[0][0]: %ld\n",
        (long)verification[0][0]
    );
    printf("  condition number: ");
    print_fixed_value(condition_number);
    printf("\n\n");

    /*
     * Warm-up iterations are not timed.
     */
    for (iteration = 0;
         iteration < WARMUP_ITERATIONS;
         iteration++) {

        inversion_status =
            invert_matrix(matrix, inverse);

        if (inversion_status != MATRIX_SUCCESS) {
            printf(
                "Inversion failed during warm-up.\n"
            );

            return 1;
        }
    }

    /*
     * Begin the timed region.
     */
    if (clock_gettime(
            CLOCK_MONOTONIC,
            &start_time) != 0) {

        perror("clock_gettime start");
        return 1;
    }

    /*
     * Only invert_matrix() is measured.
     */
    for (iteration = 0;
         iteration < BENCHMARK_ITERATIONS;
         iteration++) {

        inversion_status =
            invert_matrix(matrix, inverse);

        if (inversion_status != MATRIX_SUCCESS) {
            printf(
                "Inversion failed during benchmark.\n"
            );

            return 1;
        }
    }

    /*
     * End the timed region.
     */
    if (clock_gettime(
            CLOCK_MONOTONIC,
            &end_time) != 0) {

        perror("clock_gettime end");
        return 1;
    }

    total_seconds =
        elapsed_seconds(
            &start_time,
            &end_time
        );

    average_nanoseconds =
        total_seconds
        * 1000000000.0
        / BENCHMARK_ITERATIONS;

    printf("Unoptimized fixed-point benchmark:\n");
    printf(
        "  warm-up iterations: %d\n",
        WARMUP_ITERATIONS
    );
    printf(
        "  measured iterations: %d\n",
        BENCHMARK_ITERATIONS
    );
    printf(
        "  total measured time: %.9f seconds\n",
        total_seconds
    );
    printf(
        "  average time per inversion: %.2f ns\n",
        average_nanoseconds
    );

    /*
     * Keep one calculated result observable after the loop.
     */
    printf(
        "  final result check inverse[0][0]: %d\n",
        inverse[0][0]
    );

    return 0;
}