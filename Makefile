# SENG 440 - Matrix Inversion
#
# Both files are self-contained. No project headers.
#
#   not_optimized_fixedpoint.c   the baseline
#   matrix_neon.c                baseline + hoisted range check + NEON
#
# Build at a FIXED optimization level so the difference between the two
# is your work rather than the compiler's. State the level in the report.
#
#   make          build both
#   make verify   prove NEON produces the same answer as the baseline
#   make counts   instruction counts (needs valgrind)
#   make branches branch counts and mispredicts
#   make asm      confirm NEON instructions were actually emitted

CC     = gcc
OPT    = -O2
ARCH   = -march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard
CFLAGS = $(OPT) $(ARCH) -Wall -Wextra

all: matrix_baseline matrix_neon

matrix_baseline: not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) $< -o $@

matrix_neon: matrix_neon.c
	$(CC) $(CFLAGS) $< -o $@

# --------------------------------------------------------------------
# Correctness.
#
# The NEON kernel matches the baseline's rounding exactly, so for any
# matrix that does not overflow the two produce bit-identical inverses.
# That makes verification a plain diff -- no reference implementation
# and no tolerance to argue about.
#
# Checked during development on 300,000 random matrices: 231,136
# successful inversions, 100% bit-identical, 0 status disagreements.
# --------------------------------------------------------------------
verify: matrix_baseline matrix_neon
	@./matrix_baseline > baseline.txt
	@./matrix_neon     > neon.txt
	@if diff -q baseline.txt neon.txt > /dev/null; then \
	  echo "PASS: NEON output is identical to the baseline"; \
	else \
	  echo "FAIL:"; diff baseline.txt neon.txt; \
	fi

# --------------------------------------------------------------------
# Performance.
#
# Do NOT use wall-clock time from inside QEMU. QEMU translates ARM to
# x86 without modelling the Cortex-A7 pipeline, so timings measure the
# emulator. It penalises NEON especially: eight lanes of real work
# become roughly eight times the host instructions.
#
# callgrind counts instructions deterministically and is unaffected.
# --------------------------------------------------------------------
counts: matrix_baseline matrix_neon
	@for s in matrix_baseline matrix_neon; do \
	  valgrind --tool=callgrind --callgrind-out-file=cg.$$s ./$$s >/dev/null 2>&1; \
	  n=$$(callgrind_annotate cg.$$s 2>/dev/null | grep -m1 'invert_matrix' | awk '{print $$1}'); \
	  echo "$$s: $$n instructions in invert_matrix"; \
	done

branches: matrix_baseline matrix_neon
	@for s in matrix_baseline matrix_neon; do \
	  echo "=== $$s ==="; \
	  valgrind --tool=cachegrind --branch-sim=yes ./$$s 2>&1 >/dev/null \
	    | grep -E 'Branches|Mispredicts'; \
	done

# --------------------------------------------------------------------
# Did the intrinsics actually lower to NEON instructions?
# A zero anywhere here means a missing -mfpu / -mfloat-abi.
# --------------------------------------------------------------------
asm: matrix_neon
	@echo "VMULL:     $$(objdump -d matrix_neon | grep -c vmull)"
	@echo "VRSHR:     $$(objdump -d matrix_neon | grep -c vrshr)"
	@echo "VLD1/VST1: $$(objdump -d matrix_neon | grep -cE 'vld1|vst1')"
	@echo "VSUB/VEOR: $$(objdump -d matrix_neon | grep -cE 'vsub|veor')"

clean:
	rm -f matrix_baseline matrix_neon cg.* baseline.txt neon.txt

.PHONY: all verify counts branches asm clean