#include <stdio.h>
#include <stdint.h>

#define N 8
#define FRACTION_BITS 12
#define FIXED_ONE (1 << FRACTION_BITS)
#define Q12_FROM_INT(value) ((int16_t)((value) * FIXED_ONE))

#define MATRIX_SUCCESS   1
#define MATRIX_SINGULAR  0
#define MATRIX_OVERFLOW -1

#ifndef IMPLEMENTATION_NAME
#define IMPLEMENTATION_NAME "matrix implementation"
#endif

/* Functions supplied by the implementation file linked with this driver. */
extern int invert_matrix(const int16_t input[N][N], int16_t inverse[N][N]);
extern void multiply_matrices(const int16_t first[N][N],
                              const int16_t second[N][N],
                              int32_t result[N][N]);
extern int calculate_condition_number(const int16_t matrix[N][N],
                                      const int16_t inverse[N][N],
                                      int32_t *condition_number);

static void print_fixed_value(int32_t value)
{
    int32_t magnitude;
    int32_t whole_part;
    int32_t remainder;
    int position;

    magnitude = value < 0 ? -value : value;
    whole_part = magnitude / FIXED_ONE;
    remainder = magnitude % FIXED_ONE;

    if (value < 0) {
        printf("-%ld.", (long)whole_part);
    } else {
        printf(" %ld.", (long)whole_part);
    }

    for (position = 0; position < 6; position++) {
        remainder *= 10;
        printf("%d", (int)(remainder / FIXED_ONE));
        remainder %= FIXED_ONE;
    }
}

static void print_matrix(const int16_t matrix[N][N])
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

static void print_wide_matrix(const int32_t matrix[N][N])
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

int main(void)
{
    static const int16_t matrix[N][N] = {
        {Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0, 0, 0, 0},
        {Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0, 0, 0},
        {0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0, 0},
        {0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0},
        {0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0},
        {0, 0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0},
        {0, 0, 0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1)},
        {0, 0, 0, 0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4)}
    };

    int16_t inverse[N][N];
    int32_t verification[N][N];
    int32_t condition_number;
    int status;

    printf("%s\n\n", IMPLEMENTATION_NAME);
    printf("Original Q4.12 matrix A:\n\n");
    print_matrix(matrix);

    status = invert_matrix(matrix, inverse);

    if (status == MATRIX_SINGULAR) {
        printf("\nThe matrix is singular at Q4.12 precision.\n");
        return 1;
    }

    if (status == MATRIX_OVERFLOW) {
        printf("\nQ4.12 overflow occurred during inversion.\n");
        return 1;
    }

    printf("\nInverse matrix A^-1:\n\n");
    print_matrix(inverse);

    multiply_matrices(matrix, inverse, verification);
    printf("\nVerification A * A^-1:\n\n");
    print_wide_matrix(verification);

    if (!calculate_condition_number(matrix, inverse, &condition_number)) {
        printf("\nCondition-number calculation overflowed.\n");
        return 1;
    }

    printf("\nInfinity-norm condition number: ");
    print_fixed_value(condition_number);
    printf("\n");

    return 0;
}
