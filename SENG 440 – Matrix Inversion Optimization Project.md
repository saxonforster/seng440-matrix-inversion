# SENG 440 – Matrix Inversion Optimization Project

## Overview

This project implements fixed-point (Q4.12) 8×8 matrix inversion using Gauss–Jordan elimination with partial pivoting. Multiple software optimizations are provided and can be compared for correctness, execution time, and profiling.

The project contains four implementations:

- **not_optimized_fixedpoint.c** – Baseline implementation
- **operator_strength_reduction.c** – Operator strength reduction optimization
- **matrix_neon.c** – ARM NEON SIMD optimization
- **matrix_optimized.c** – Combined optimizations

Three execution paths are provided for each implementation:

- **demo** – Prints matrices and verifies correctness
- **timing** – Measures execution time
- **bench** – Used with Valgrind/Callgrind for profiling

---

# Requirements

- ARM Linux (Cortex-A7)
- GCC
- GNU Make
- Valgrind (for profiling)

Install Valgrind if necessary:

```bash
sudo apt update
sudo apt install valgrind
```

---

# Compiling

Compile all executables:

```bash
make
```

This builds every demo, timing, and benchmark executable.

To remove all generated executables:

```bash
make clean
```

---

# Correctness Testing

Run the printable demonstration programs:

```bash
make run-demos
```

or individually:

```bash
./demo_baseline
./demo_osr
./demo_neon
./demo_optimized
```

Each program displays:

- Original matrix
- Inverse matrix
- Verification matrix (A × A⁻¹)
- Infinity-norm condition number

The verification matrix should closely approximate the identity matrix.

---

# Execution Time Measurement

Run all timing programs:

```bash
make run-timings
```

or individually:

```bash
./timing_baseline
./timing_osr
./timing_neon
./timing_optimized
```

Each program reports:

- Warm-up iterations
- Measured iterations
- Total execution time
- Average time per inversion
- Verification value
- Condition number

Only the matrix inversion routine is timed. Matrix printing and condition-number reporting occur after the timing measurements have completed.

---

# Valgrind / Callgrind Profiling

Run Callgrind on every implementation:

```bash
make counts
```

or profile a single implementation:

```bash
valgrind --tool=callgrind ./bench_baseline
```

Examples:

```bash
valgrind --tool=callgrind ./bench_osr
```

```bash
valgrind --tool=callgrind ./bench_neon
```

```bash
valgrind --tool=callgrind ./bench_optimized
```

Callgrind creates an output file similar to:

```text
callgrind.out.<pid>
```

View the profiling results:

```bash
callgrind_annotate callgrind.out.<pid>
```

If the Makefile specifies output filenames, use:

```bash
callgrind_annotate callgrind.baseline
```

or the corresponding file for each implementation.

---

# Executables

After compilation, the following executables are available.

## Demo Programs

```text
demo_baseline
demo_osr
demo_neon
demo_optimized
```

## Timing Programs

```text
timing_baseline
timing_osr
timing_neon
timing_optimized
```

## Benchmark Programs

```text
bench_baseline
bench_osr
bench_neon
bench_optimized
```

---

# Typical Workflow

1. Compile the project.

```bash
make
```

2. Verify correctness.

```bash
make run-demos
```

3. Measure execution time.

```bash
make run-timings
```

4. Profile instruction counts.

```bash
make counts
```

5. Clean generated files.

```bash
make clean
```

---

# Expected Results

All implementations should produce:

- The same inverse matrix
- Nearly identical verification matrices
- The same infinity-norm condition number

Execution time should decrease as optimizations are applied.

Typical performance trend:

```text
Baseline
    ↓
Operator Strength Reduction
    ↓
NEON SIMD
    ↓
Combined Optimizations
```

The exact execution times and instruction counts depend on the compiler, optimization flags, and hardware platform.