# SENG 440 - Matrix Inversion
#
#   not_optimized_fixedpoint.c   the baseline
#   matrix_neon.c                baseline + hoisted range check + NEON
#   bench.c                      profiling driver (no main() conflict)
#
#   make            build the demo programs
#   make verify     prove NEON gives the same answer as the baseline
#   make asm        confirm NEON instructions were emitted
#   make check      diagnose missing profiling tools
#   make counts     >>> instruction counts per inversion <<<
#   make branches   branch counts and mispredicts
#   make static     fallback if valgrind is unavailable

CC     = gcc
OPT    = -O2
ARCH   = -march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard
CFLAGS = $(OPT) $(ARCH) -Wall -Wextra

# Inversions per profiling run. Raise for finer resolution; the
# per-inversion figure is what gets reported either way.
ITERS  = 1000

all: matrix_baseline matrix_neon

matrix_baseline: not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) $< -o $@

matrix_neon: matrix_neon.c
	$(CC) $(CFLAGS) $< -o $@

# --------------------------------------------------------------------
# Profiling builds.
#
# Compiled as separate objects on purpose. Without -flto the compiler
# cannot inline across a translation-unit boundary, which guarantees
# invert_matrix() stays a distinct symbol that callgrind can attribute
# cost to. Built into main() it would be reported against main().
#
# -Dmain=program_main renames the demo main() out of the way so bench.c
# can supply its own. Neither source file needs editing.
# --------------------------------------------------------------------
bench.o: bench.c
	$(CC) $(CFLAGS) -DITERATIONS=$(ITERS) -c $< -o $@

base_prof.o: not_optimized_fixedpoint.c
	$(CC) $(CFLAGS) -Dmain=program_main -c $< -o $@

neon_prof.o: matrix_neon.c
	$(CC) $(CFLAGS) -Dmain=program_main -c $< -o $@

bench_baseline: base_prof.o bench.o
	$(CC) $^ -o $@

bench_neon: neon_prof.o bench.o
	$(CC) $^ -o $@

benches: bench_baseline bench_neon

# --------------------------------------------------------------------
# Correctness.
# --------------------------------------------------------------------
verify: matrix_baseline matrix_neon
	@./matrix_baseline > baseline.txt
	@./matrix_neon     > neon.txt
	@if diff -q baseline.txt neon.txt > /dev/null; then \
	  echo "PASS: NEON output is identical to the baseline"; \
	else \
	  echo "FAIL:"; diff baseline.txt neon.txt; \
	fi

# Both drivers must report the same success count and the same final
# value. If they differ, they are not seeing the same input and any
# comparison below is meaningless.
verify-bench: benches
	@echo "baseline:"; ./bench_baseline
	@echo "neon:";     ./bench_neon

# --------------------------------------------------------------------
# Are the tools present?
# --------------------------------------------------------------------
check:
	@echo -n "valgrind ............ "; \
	  if command -v valgrind >/dev/null 2>&1; then valgrind --version; \
	  else echo "MISSING  (apt-get install valgrind, or use 'make static')"; fi
	@echo -n "callgrind_annotate .. "; \
	  if command -v callgrind_annotate >/dev/null 2>&1; then echo present; \
	  else echo "MISSING"; fi
	@echo -n "objdump ............. "; \
	  if command -v objdump >/dev/null 2>&1; then echo present; else echo MISSING; fi

# --------------------------------------------------------------------
# THE NUMBER FOR THE REPORT: instructions per inversion.
#
# Deterministic, unaffected by QEMU. Do not use wall-clock time from
# inside the VM -- QEMU translates ARM to x86 without modelling the
# Cortex-A7 pipeline, and it penalises NEON especially, because eight
# lanes of real work become roughly eight times the host instructions.
# --------------------------------------------------------------------
counts: benches
	@for s in bench_baseline bench_neon; do \
	  valgrind --tool=callgrind --callgrind-out-file=cg.$$s ./$$s >/dev/null 2>&1 || \
	    { echo "valgrind failed -- run 'make check'"; exit 1; }; \
	  total=$$(callgrind_annotate cg.$$s 2>/dev/null \
	           | grep -E '[0-9,]+ .*invert_matrix' | head -1 \
	           | tr -d ',' | awk '{print $$1}'); \
	  if [ -z "$$total" ]; then \
	    echo "$$s: could not find invert_matrix -- raw output follows:"; \
	    callgrind_annotate cg.$$s | head -25; \
	  else \
	    echo "$$s: $$total instructions total, $$((total / $(ITERS))) per inversion"; \
	  fi; \
	done

branches: benches
	@for s in bench_baseline bench_neon; do \
	  echo "=== $$s ==="; \
	  valgrind --tool=cachegrind --branch-sim=yes ./$$s 2>&1 >/dev/null \
	    | grep -E 'Branches|Mispredicts|I *refs'; \
	done

# --------------------------------------------------------------------
# Fallback if valgrind will not install. Static instruction counts are
# weaker evidence -- they count instructions present, not executed --
# but they do show the loop body shrinking.
# --------------------------------------------------------------------
static: benches
	@for s in bench_baseline bench_neon; do \
	  n=$$(objdump -d $$s | awk '/<invert_matrix>:/,/^$$/' | grep -cE '^\s+[0-9a-f]+:'); \
	  echo "$$s: $$n static instructions in invert_matrix"; \
	done

asm: matrix_neon
	@echo "VMULL:     $$(objdump -d matrix_neon | grep -c vmull)"
	@echo "VRSHR:     $$(objdump -d matrix_neon | grep -c vrshr)"
	@echo "VLD1/VST1: $$(objdump -d matrix_neon | grep -cE 'vld1|vst1')"
	@echo "VSUB/VEOR: $$(objdump -d matrix_neon | grep -cE 'vsub|veor')"

clean:
	rm -f matrix_baseline matrix_neon bench_baseline bench_neon \
	      *.o cg.* cachegrind.out.* baseline.txt neon.txt

.PHONY: all benches verify verify-bench check counts branches static asm clean