#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define N 8
#define FRACTION_BITS 12
#define FIXED_ONE (1 << FRACTION_BITS)
#define Q12_FROM_INT(value) ((int16_t)((value) * FIXED_ONE))

#define MATRIX_SUCCESS   1

#ifndef WARMUP_ITERATIONS
#define WARMUP_ITERATIONS 1000
#endif

#ifndef BENCHMARK_ITERATIONS
#define BENCHMARK_ITERATIONS 100000
#endif

#ifndef IMPLEMENTATION_NAME
#define IMPLEMENTATION_NAME "matrix implementation"
#endif

extern int invert_matrix(const int16_t input[N][N], int16_t inverse[N][N]);
extern int calculate_condition_number(const int16_t matrix[N][N],
                                      const int16_t inverse[N][N],
                                      int32_t *condition_number);

static double elapsed_seconds(const struct timespec *start,
                              const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec)
         + (double)(end->tv_nsec - start->tv_nsec) / 1000000000.0;
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
    int32_t condition_number;
    struct timespec start_time;
    struct timespec end_time;
    double total_seconds;
    double average_nanoseconds;
    int status;
    int iteration;

    /* Correctness and condition-number check: not timed. */
    status = invert_matrix(matrix, inverse);
    if (status != MATRIX_SUCCESS) {
        printf("Initial inversion failed with status %d.\n", status);
        return 1;
    }

    if (!calculate_condition_number(matrix, inverse, &condition_number)) {
        printf("Condition-number calculation failed.\n");
        return 1;
    }

    /* Warm-up: not timed. */
    for (iteration = 0; iteration < WARMUP_ITERATIONS; iteration++) {
        status = invert_matrix(matrix, inverse);
        if (status != MATRIX_SUCCESS) {
            printf("Warm-up inversion failed with status %d.\n", status);
            return 1;
        }
    }

    clock_gettime(CLOCK_MONOTONIC, &start_time);

    for (iteration = 0; iteration < BENCHMARK_ITERATIONS; iteration++) {
        status = invert_matrix(matrix, inverse);
        if (status != MATRIX_SUCCESS) {
            printf("Measured inversion failed with status %d.\n", status);
            return 1;
        }
    }

    clock_gettime(CLOCK_MONOTONIC, &end_time);

    total_seconds = elapsed_seconds(&start_time, &end_time);
    average_nanoseconds = total_seconds * 1000000000.0
                        / BENCHMARK_ITERATIONS;

    printf("%s\n", IMPLEMENTATION_NAME);
    printf("Warm-up iterations: %d\n", WARMUP_ITERATIONS);
    printf("Measured iterations: %d\n", BENCHMARK_ITERATIONS);
    printf("Total measured time: %.9f seconds\n", total_seconds);
    printf("Average time per inversion: %.2f ns\n", average_nanoseconds);
    printf("Final inverse[0][0]: %d\n", (int)inverse[0][0]);
    printf("Condition number (raw Q4.12): %ld\n", (long)condition_number);

    return 0;
}