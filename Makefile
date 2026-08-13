SHELL := /bin/bash
CC = gcc

CFLAGS = -O2 -Wall -Wextra -std=c11

ARM_FLAGS = -mcpu=cortex-a7 \
            -mfpu=neon-vfpv4 \
            -mfloat-abi=hard

IMPLEMENTATIONS = baseline osr neon optimized

.PHONY: all demos timings benches run-demos run-timings \
        counts verify asm clean

all: demos timings benches


# ============================================================
# Printable demonstration programs
# ============================================================

demos: demo_baseline demo_osr demo_neon demo_optimized

demo_baseline: demo.c not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		demo.c not_optimized_fixedpoint.c \
		-o demo_baseline

demo_osr: demo.c operator_strength_reduction.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		demo.c operator_strength_reduction.c \
		-o demo_osr

demo_neon: demo.c matrix_neon.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		demo.c matrix_neon.c \
		-o demo_neon

demo_optimized: demo.c matrix_optimized.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		demo.c matrix_optimized.c \
		-o demo_optimized


# ============================================================
# Execution-time programs
# ============================================================

timings: timing_baseline timing_osr timing_neon timing_optimized

timing_baseline: timing.c not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		timing.c not_optimized_fixedpoint.c \
		-o timing_baseline

timing_osr: timing.c operator_strength_reduction.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		timing.c operator_strength_reduction.c \
		-o timing_osr

timing_neon: timing.c matrix_neon.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		timing.c matrix_neon.c \
		-o timing_neon

timing_optimized: timing.c matrix_optimized.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		timing.c matrix_optimized.c \
		-o timing_optimized


# ============================================================
# Valgrind / Callgrind programs
# ============================================================

benches: bench_baseline bench_osr bench_neon bench_optimized

bench_baseline: bench.c not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		bench.c not_optimized_fixedpoint.c \
		-o bench_baseline

bench_osr: bench.c operator_strength_reduction.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		bench.c operator_strength_reduction.c \
		-o bench_osr

bench_neon: bench.c matrix_neon.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		bench.c matrix_neon.c \
		-o bench_neon

bench_optimized: bench.c matrix_optimized.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) \
		bench.c matrix_optimized.c \
		-o bench_optimized


# ============================================================
# Run targets
# ============================================================

run-demos: demos
	./demo_baseline
	./demo_osr
	./demo_neon
	./demo_optimized

run-timings: timings
	./timing_baseline
	./timing_osr
	./timing_neon
	./timing_optimized

# ============================================================
# Correctness verification
# ============================================================

verify: demos
	@./demo_baseline  > /tmp/base.out 2>/dev/null
	@./demo_osr       > /tmp/osr.out  2>/dev/null
	@./demo_neon      > /tmp/neon.out 2>/dev/null
	@./demo_optimized > /tmp/opt.out  2>/dev/null
	@diff <(tail -n +2 /tmp/base.out) <(tail -n +2 /tmp/opt.out) \
		&& echo "PASS baseline == optimized"
	@diff <(tail -n +2 /tmp/osr.out)  <(tail -n +2 /tmp/opt.out) \
		&& echo "PASS osr == optimized"
	@diff <(tail -n +2 /tmp/neon.out) <(tail -n +2 /tmp/opt.out) \
		&& echo "PASS neon == optimized"
	@$(CC) $(CFLAGS) $(ARM_FLAGS) -DEXACT_BASELINE_ROUNDING=1 \
		demo.c matrix_optimized.c -o demo_exact
	@diff <(tail -n +2 /tmp/base.out) <(./demo_exact 2>/dev/null | tail -n +2) \
		&& echo "PASS bit-exact with baseline rounding"

# ============================================================
# Assembly listings
# ============================================================

asm: matrix_optimized.s matrix_not_optimized.s

matrix_optimized.s: matrix_optimized.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) -fverbose-asm -S $< -o $@

matrix_not_optimized.s: not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) $(ARM_FLAGS) -fverbose-asm -S $< -o $@

# ============================================================
# Callgrind instruction-count tests
# ============================================================

counts: benches
	valgrind --tool=callgrind \
		--callgrind-out-file=callgrind.baseline \
		./bench_baseline

	valgrind --tool=callgrind \
		--callgrind-out-file=callgrind.osr \
		./bench_osr

	valgrind --tool=callgrind \
		--callgrind-out-file=callgrind.neon \
		./bench_neon

	valgrind --tool=callgrind \
		--callgrind-out-file=callgrind.optimized \
		./bench_optimized

	callgrind_annotate callgrind.baseline
	callgrind_annotate callgrind.osr
	callgrind_annotate callgrind.neon
	callgrind_annotate callgrind.optimized


# ============================================================
# Cleanup
# ============================================================

clean:
	rm -f demo_baseline
	rm -f demo_osr
	rm -f demo_neon
	rm -f demo_optimized

	rm -f timing_baseline
	rm -f timing_osr
	rm -f timing_neon
	rm -f timing_optimized

	rm -f bench_baseline
	rm -f bench_osr
	rm -f bench_neon
	rm -f bench_optimized

	rm -f callgrind.*
	rm -f demo_exact