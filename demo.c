#include <stdio.h>
#include <stdint.h>

#define N 8
#define FRACTION_BITS 12
#define FIXED_ONE (1 << FRACTION_BITS)
#define Q12_FROM_INT(value) ((int16_t)((value) * FIXED_ONE))

#define MATRIX_SUCCESS   1
#define MATRIX_SINGULAR  0
#define MATRIX_OVERFLOW -1

/* Magnitude bits available in signed 16-bit Q4.12, excluding the sign. */
#define MATRIX_MAGNITUDE_BITS 15

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


int matrix_peak_magnitude_bits __attribute__((weak)) = -1;
int matrix_predicted_bits      __attribute__((weak)) = -1;

/*
 * ====================================================================
 * TESTBENCH
 * ====================================================================
 *
 * The project requires a well-conditioned and an ill-conditioned matrix,
 * and the required precision for each.
 *
 * CASE 1: symmetric tridiagonal, diagonal 4.0, off-diagonal 1.0.
 *     Strongly diagonally dominant, kappa_inf = 2.98. Representative of
 *     the well-behaved end of the input space.
 *
 * CASE 2: dense random matrix, elements in [-1.0, +1.0], selected for
 *     kappa_inf = 79.8. This exceeds the validated operating range of
 *     kappa <= 32 and inverts with ZERO remaining magnitude bits, which
 *     is what makes it useful: it sits exactly at the precision limit of
 *     Q4.12 rather than comfortably inside it. Largest element of the
 *     inverse is 4.74, against a format maximum of 7.9998.
 *
 * Both matrices produce identical results under round-half-away-from-
 * zero and round-half-up, so all four implementations agree on both.
 */
static const int16_t well_conditioned[N][N] = {
    {Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0, 0, 0, 0},
    {Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0, 0, 0},
    {0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0, 0},
    {0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0, 0},
    {0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0, 0},
    {0, 0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1), 0},
    {0, 0, 0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4), Q12_FROM_INT(1)},
    {0, 0, 0, 0, 0, 0, Q12_FROM_INT(1), Q12_FROM_INT(4)}
};

/* Raw Q4.12; divide by 4096 for the real value. */
static const int16_t ill_conditioned[N][N] = {
    { -2109,    269,   2286,    613,  -1492,  -3384,  -2401,  -3622},
    {  3484,  -1508,   3455,  -3649,  -2089,   1881,    -30,   -317},
    { -3137,  -1310,   -894,   -250,   -746,   1356,  -4082,  -3411},
    {  2786,   3949,  -3225,  -3540,   1164,   1528,  -3377,  -2426},
    {  -570,   1328,  -1668,   1791,   1367,    -24,   3679,   2271},
    { -3477,   -343,   3404,   3241,   -802,  -3484,   2318,  -2730},
    {  3058,  -2340,    573,  -2787,   2097,    243,   -334,   -986},
    { -1093,  -2904,   3568,  -2869,   3458,   -303,   1563,   2490}
};

/*
 * Reports the CLZ overflow analysis for the case just run.
 *
 * Written to stderr, deliberately. The correctness tests compare the
 * stdout of the four demo programs with diff, and only one of them
 * produces these numbers. Keeping them on stderr means
 *
 *     ./demo_optimized > out.txt
 *
 * still yields a file that is byte-identical to the other three, while
 *
 *     ./demo_optimized 2> clz.txt
 *
 * captures the analysis on its own.
 */
static void print_clz_analysis(const char *label, int status)
{
    int headroom;

    /* Keep stderr ordered after whatever stdout has produced so far. */
    fflush(stdout);

    if (matrix_peak_magnitude_bits < 0) {
        fprintf(stderr, "\n[%s] CLZ overflow analysis: not instrumented "
                        "in this build.\n", label);
        return;
    }

    headroom = MATRIX_MAGNITUDE_BITS - matrix_peak_magnitude_bits;

    fprintf(stderr, "\n[%s] CLZ overflow analysis\n", label);
    fprintf(stderr, "  available magnitude bits (Q4.12) : %d\n",
            MATRIX_MAGNITUDE_BITS);
    fprintf(stderr, "  predicted peak,         : %d\n",
            matrix_predicted_bits);
    fprintf(stderr, "  measured peak,          : %d\n",
            matrix_peak_magnitude_bits);

    if (status == MATRIX_SUCCESS) {
        fprintf(stderr, "  headroom remaining               : %d bit%s\n",
                headroom, headroom == 1 ? "" : "s");
    } else {
        fprintf(stderr, "  headroom remaining               : none, "
                        "inversion did not complete\n");
    }

    fprintf(stderr, "  prediction margin                : %+d bits\n",
            matrix_predicted_bits - matrix_peak_magnitude_bits);

    if (matrix_predicted_bits > MATRIX_MAGNITUDE_BITS
            && status == MATRIX_SUCCESS) {
        fprintf(stderr, "  note: CLZ predicted overflow that did not "
                        "occur\n");
    }
}

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

/*
 * Inverts one testbench matrix and reports everything about it.
 *
 * Returns 0 on success, 1 if the inversion or the condition-number
 * calculation failed.
 */
static int run_case(const char *label, const int16_t matrix[N][N])
{
    int16_t inverse[N][N];
    int32_t verification[N][N];
    int32_t condition_number;
    int status;

    printf("====================================================\n");
    printf("%s\n", label);
    printf("====================================================\n\n");

    printf("Original Q4.12 matrix A:\n\n");
    print_matrix(matrix);

    status = invert_matrix(matrix, inverse);

    if (status == MATRIX_SINGULAR) {
        printf("\nThe matrix is singular at Q4.12 precision.\n\n");
        print_clz_analysis(label, status);
        return 1;
    }

    if (status == MATRIX_OVERFLOW) {
        printf("\nQ4.12 overflow occurred during inversion.\n\n");
        print_clz_analysis(label, status);
        return 1;
    }

    printf("\nInverse matrix A^-1:\n\n");
    print_matrix(inverse);

    multiply_matrices(matrix, inverse, verification);
    printf("\nVerification A * A^-1:\n\n");
    print_wide_matrix(verification);

    if (!calculate_condition_number(matrix, inverse, &condition_number)) {
        printf("\nCondition-number calculation overflowed.\n\n");
        print_clz_analysis(label, status);
        return 1;
    }

    printf("\nInfinity-norm condition number: ");
    print_fixed_value(condition_number);
    printf("\n\n");

    print_clz_analysis(label, status);

    return 0;
}

int main(void)
{
    int failures = 0;

    printf("%s\n\n", IMPLEMENTATION_NAME);

    failures += run_case("Case 1: well-conditioned", well_conditioned);
    printf("\n");
    failures += run_case("Case 2: ill-conditioned", ill_conditioned);

    return failures != 0;
}