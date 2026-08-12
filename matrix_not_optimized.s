	.cpu cortex-a7
	.arch armv7-a
	.arch_extension virt
	.arch_extension idiv
	.arch_extension sec
	.arch_extension mp
	.fpu neon-vfpv4
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"not_optimized_fixedpoint.c"
@ GNU C11 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O2 -std=c11
	.text
	.align	1
	.p2align 2,,3
	.global	fixed_absolute
	.syntax unified
	.thumb
	.thumb_func
	.type	fixed_absolute, %function
fixed_absolute:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:50:     if (widened_value < 0) {
	cmp	r0, #0	@ tmp118,
	it	lt
	rsblt	r0, r0, #0	@ tmp118, tmp119,
@ not_optimized_fixedpoint.c:55: }
	uxth	r0, r0	@, tmp118
	bx	lr	@
	.size	fixed_absolute, .-fixed_absolute
	.align	1
	.p2align 2,,3
	.global	fixed_result_fits_int16
	.syntax unified
	.thumb
	.thumb_func
	.type	fixed_result_fits_int16, %function
fixed_result_fits_int16:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r0, #32768	@ _2, tmp124,
@ not_optimized_fixedpoint.c:67: }
	cmp	r0, #65536	@ _2,
	ite	cs
	movcs	r0, #0	@,
	movcc	r0, #1	@,
	bx	lr	@
	.size	fixed_result_fits_int16, .-fixed_result_fits_int16
	.align	1
	.p2align 2,,3
	.global	fixed_multiply
	.syntax unified
	.thumb
	.thumb_func
	.type	fixed_multiply, %function
fixed_multiply:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:96:     product = (int32_t)first * (int32_t)second;
	mul	r1, r0, r1	@ product, tmp123, tmp124
@ not_optimized_fixedpoint.c:101:     if (product >= 0) {
	cmp	r1, #0	@ product,
@ not_optimized_fixedpoint.c:102:         product = product + (FIXED_ONE / 2);
	ite	ge
	addge	r1, r1, #2048	@ product, product,
@ not_optimized_fixedpoint.c:104:         product = product - (FIXED_ONE / 2);
	sublt	r1, r1, #2048	@ product, product,
@ not_optimized_fixedpoint.c:107:     return product / FIXED_ONE;
	addw	r0, r1, #4095	@ tmp121, product,
	ands	r0, r0, r1, asr #32	@ product, tmp121, product
	it	cc
	movcc	r0, r1	@ product, product
@ not_optimized_fixedpoint.c:108: }
	asrs	r0, r0, #12	@, product,
	bx	lr	@
	.size	fixed_multiply, .-fixed_multiply
	.align	1
	.p2align 2,,3
	.global	fixed_divide
	.syntax unified
	.thumb
	.thumb_func
	.type	fixed_divide, %function
fixed_divide:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:129:     if (denominator == 0) {
	cmp	r1, #0	@ denominator
	beq	.L13		@,
@ not_optimized_fixedpoint.c:137:     scaled_numerator = (int32_t)numerator * FIXED_ONE;
	lsl	r3, r0, #12	@ scaled_numerator, numerator,
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	blt	.L14		@,
@ not_optimized_fixedpoint.c:147:         half_denominator = denominator_32 / 2;
	asrs	r0, r1, #1	@ half_denominator, denominator,
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	cmp	r3, #0	@ scaled_numerator,
	blt	.L11		@,
.L10:
@ not_optimized_fixedpoint.c:151:         scaled_numerator += half_denominator;
	add	r3, r3, r0	@ scaled_numerator, half_denominator
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	movs	r0, #1	@ <retval>,
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	sdiv	r3, r3, r1	@ _25, scaled_numerator, denominator
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	str	r3, [r2]	@ _25, *result_5(D)
	bx	lr	@
.L14:
@ not_optimized_fixedpoint.c:145:         half_denominator = -denominator_32 / 2;
	rsbs	r0, r1, #0	@ _12, denominator
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	cmp	r3, #0	@ scaled_numerator,
@ not_optimized_fixedpoint.c:145:         half_denominator = -denominator_32 / 2;
	asr	r0, r0, #1	@ half_denominator, _12,
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	blt	.L10		@,
.L11:
@ not_optimized_fixedpoint.c:153:         scaled_numerator -= half_denominator;
	subs	r3, r3, r0	@ scaled_numerator, scaled_numerator, half_denominator
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	movs	r0, #1	@ <retval>,
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	sdiv	r3, r3, r1	@ _25, scaled_numerator, denominator
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	str	r3, [r2]	@ _25, *result_5(D)
	bx	lr	@
.L13:
@ not_optimized_fixedpoint.c:130:         return 0;
	mov	r0, r1	@ <retval>, denominator
@ not_optimized_fixedpoint.c:159: }
	bx	lr	@
	.size	fixed_divide, .-fixed_divide
	.align	1
	.p2align 2,,3
	.global	create_identity
	.syntax unified
	.thumb
	.thumb_func
	.type	create_identity, %function
create_identity:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vldr	d28, .L18	@,
	vldr	d29, .L18+8	@,
	vmov.i32	q12, #1  @ v4si	@ tmp126,
	vmov.i32	q11, #0  @ v4si	@ tmp127,
	vldr	d26, .L18+16	@,
	vldr	d27, .L18+24	@,
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	movs	r3, #0	@ row,
.L16:
	vdup.32	q8, r3	@ tmp123, row
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	adds	r3, r3, #1	@ row, row,
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	cmp	r3, #8	@ row,
	vceq.i32	q10, q8, q14	@ tmp128, tmp123, tmp125
	vceq.i32	q8, q8, q13	@ tmp132, tmp123, tmp129
	vbsl	q10, q12, q11	@ vect_patt_51.52, tmp126, tmp127
	vbsl	q8, q12, q11	@ vect_patt_51.52, tmp126, tmp127
@ not_optimized_fixedpoint.c:174:                 matrix[row][column] = FIXED_ONE;
	vmovn.i32	d18, q10	@ vect_patt_52.53_68, vect_patt_51.52
	vmovn.i32	d19, q8	@ vect_patt_52.53_68, vect_patt_51.52
	vshl.i16	q9, q9, #12	@ vect__31.54_70, vect_patt_52.53_68,
	vst1.16	{q9}, [r0]!	@ vect__31.54_70, MEM <vector(8) short int> [(short int *)vectp.56_71]
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	bne	.L16		@,
@ not_optimized_fixedpoint.c:180: }
	bx	lr	@
.L19:
	.align	3
.L18:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.size	create_identity, .-create_identity
	.align	1
	.p2align 2,,3
	.global	swap_rows
	.syntax unified
	.thumb
	.thumb_func
	.type	swap_rows, %function
swap_rows:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:191:         temporary = matrix[row1][column];
	add	r1, r0, r1, lsl #4	@ _3, matrix, tmp140,
	add	r2, r0, r2, lsl #4	@ _32, matrix, tmp141,
	subs	r3, r1, #2	@ ivtmp.76, _3,
	subs	r2, r2, #2	@ ivtmp.79, _32,
	adds	r1, r1, #14	@ _34, _3,
.L21:
@ not_optimized_fixedpoint.c:191:         temporary = matrix[row1][column];
	ldrsh	r0, [r3, #2]!	@ temporary, MEM[(short int *)_29]
@ not_optimized_fixedpoint.c:192:         matrix[row1][column] = matrix[row2][column];
	ldrsh	ip, [r2, #2]!	@ _7, MEM[(short int *)_31]
@ not_optimized_fixedpoint.c:190:     for (column = 0; column < N; column++) {
	cmp	r3, r1	@ ivtmp.76, _34
@ not_optimized_fixedpoint.c:192:         matrix[row1][column] = matrix[row2][column];
	strh	ip, [r3]	@ movhi	@ _7, MEM[(short int *)_29]
@ not_optimized_fixedpoint.c:193:         matrix[row2][column] = temporary;
	strh	r0, [r2]	@ movhi	@ temporary, MEM[(short int *)_31]
@ not_optimized_fixedpoint.c:190:     for (column = 0; column < N; column++) {
	bne	.L21		@,
@ not_optimized_fixedpoint.c:195: }
	bx	lr	@
	.size	swap_rows, .-swap_rows
	.align	1
	.p2align 2,,3
	.global	invert_matrix
	.syntax unified
	.thumb
	.thumb_func
	.type	invert_matrix, %function
invert_matrix:
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	sub	sp, sp, #164	@,,
@ not_optimized_fixedpoint.c:236:             working[row][column] = input[row][column];
	add	r5, sp, #32	@ tmp294,,
@ not_optimized_fixedpoint.c:213: {
	mov	r7, r1	@ tmp304, inverse
@ not_optimized_fixedpoint.c:236:             working[row][column] = input[row][column];
	movs	r2, #128	@,
	mov	r1, r0	@, tmp303
	mov	r0, r5	@, tmp294
	bl	memcpy(PLT)	@
	vldr	d28, .L84	@,
	vldr	d29, .L84+8	@,
	vmov.i32	q12, #1  @ v4si	@ tmp241,
	vmov.i32	q11, #0  @ v4si	@ tmp242,
	vldr	d26, .L84+16	@,
	vldr	d27, .L84+24	@,
	mov	r2, r7	@ ivtmp.219, inverse
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	movs	r3, #0	@ row,
.L24:
	vdup.32	q8, r3	@ tmp238, row
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	adds	r3, r3, #1	@ row, row,
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	cmp	r3, #8	@ row,
	vceq.i32	q10, q8, q14	@ tmp243, tmp238, tmp240
	vceq.i32	q8, q8, q13	@ tmp247, tmp238, tmp244
	vbsl	q10, q12, q11	@ vect_patt_36.101, tmp241, tmp242
	vbsl	q8, q12, q11	@ vect_patt_36.101, tmp241, tmp242
@ not_optimized_fixedpoint.c:174:                 matrix[row][column] = FIXED_ONE;
	vmovn.i32	d18, q10	@ vect_patt_34.102_231, vect_patt_36.101
	vmovn.i32	d19, q8	@ vect_patt_34.102_231, vect_patt_36.101
	vshl.i16	q9, q9, #12	@ vect__111.103_233, vect_patt_34.102_231,
	vst1.16	{q9}, [r2]!	@ vect__111.103_233, MEM <vector(8) short int> [(short int *)vectp.105_234]
@ not_optimized_fixedpoint.c:171:     for (row = 0; row < N; row++) {
	bne	.L24		@,
	mov	r9, #0	@ ivtmp.198,
	sub	r10, r7, #2	@ ivtmp.208, inverse,
	mov	r4, r5	@ ivtmp.211, tmp294
	mov	fp, r5	@ ivtmp.207, tmp294
	mov	r8, r5	@ ivtmp.203, tmp294
@ not_optimized_fixedpoint.c:245:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	mov	r6, r9	@ pivot_row, ivtmp.198
.L53:
@ not_optimized_fixedpoint.c:254:         largest_value = fixed_absolute(working[pivot_column][pivot_column]);
	ldrsh	r2, [r8]	@ _5, MEM[(short int *)_291]
@ not_optimized_fixedpoint.c:256:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r6, #7	@ pivot_row,
@ not_optimized_fixedpoint.c:256:         for (row = pivot_column + 1; row < N; row++) {
	add	ip, r6, #1	@ row, pivot_row,
@ not_optimized_fixedpoint.c:50:     if (widened_value < 0) {
	eor	r0, r2, r2, asr #31	@ tmp250, _5, _5,
	sub	r0, r0, r2, asr #31	@ tmp250, tmp250, _5,
	uxth	r0, r0	@ largest_value, tmp250
@ not_optimized_fixedpoint.c:256:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L25		@,
@ not_optimized_fixedpoint.c:256:         for (row = pivot_column + 1; row < N; row++) {
	mov	r1, ip	@ row, row
.L27:
@ not_optimized_fixedpoint.c:257:             current_value = fixed_absolute(working[row][pivot_column]);
	lsls	r3, r1, #4	@ _275, row,
@ not_optimized_fixedpoint.c:50:     if (widened_value < 0) {
	ldrsh	r3, [r4, r3]	@ MEM[(short int *)_273 + _275 * 1], MEM[(short int *)_273 + _275 * 1]
	cmp	r3, #0	@ tmp253,
	it	lt
	rsblt	r3, r3, #0	@ tmp253, MEM[(short int *)_273 + _275 * 1],
	uxth	r3, r3	@ _151, tmp253
@ not_optimized_fixedpoint.c:261:                 pivot_row = row;
	cmp	r0, r3	@ largest_value, _151
	it	lt
	movlt	r6, r1	@ pivot_row, row
@ not_optimized_fixedpoint.c:256:         for (row = pivot_column + 1; row < N; row++) {
	add	r1, r1, #1	@ row, row,
@ not_optimized_fixedpoint.c:261:                 pivot_row = row;
	it	lt
	movlt	r0, r3	@ largest_value, _151
@ not_optimized_fixedpoint.c:256:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r1, #8	@ row,
	bne	.L27		@,
@ not_optimized_fixedpoint.c:269:         if (largest_value == 0) {
	cmp	r0, #0	@ largest_value
	beq	.L31	@
@ not_optimized_fixedpoint.c:276:         if (pivot_row != pivot_column) {
	cmp	r6, r9	@ pivot_row, ivtmp.198
	beq	.L25		@,
@ not_optimized_fixedpoint.c:191:         temporary = matrix[row1][column];
	lsls	r6, r6, #4	@ _132, pivot_row,
	sub	r2, fp, #2	@ ivtmp.188, ivtmp.207,
	add	lr, r5, r6	@ _133, tmp294, _132
	sub	r3, lr, #2	@ ivtmp.185, _133,
	add	lr, lr, #14	@ _270, _133,
.L32:
@ not_optimized_fixedpoint.c:191:         temporary = matrix[row1][column];
	ldrsh	r1, [r3, #2]!	@ temporary, MEM[(short int *)_265]
@ not_optimized_fixedpoint.c:192:         matrix[row1][column] = matrix[row2][column];
	ldrsh	r0, [r2, #2]!	@ _139, MEM[(short int *)_267]
@ not_optimized_fixedpoint.c:190:     for (column = 0; column < N; column++) {
	cmp	r3, lr	@ ivtmp.185, _270
@ not_optimized_fixedpoint.c:192:         matrix[row1][column] = matrix[row2][column];
	strh	r0, [r3]	@ movhi	@ _139, MEM[(short int *)_265]
@ not_optimized_fixedpoint.c:193:         matrix[row2][column] = temporary;
	strh	r1, [r2]	@ movhi	@ temporary, MEM[(short int *)_267]
@ not_optimized_fixedpoint.c:190:     for (column = 0; column < N; column++) {
	bne	.L32		@,
@ not_optimized_fixedpoint.c:191:         temporary = matrix[row1][column];
	add	r6, r6, r7	@ _158, inverse
	mov	r2, r10	@ ivtmp.176, ivtmp.208
	subs	r3, r6, #2	@ ivtmp.173, _158,
	adds	r6, r6, #14	@ _256, _158,
.L33:
@ not_optimized_fixedpoint.c:191:         temporary = matrix[row1][column];
	ldrsh	r1, [r3, #2]!	@ temporary, MEM[(short int *)_251]
@ not_optimized_fixedpoint.c:192:         matrix[row1][column] = matrix[row2][column];
	ldrsh	r0, [r2, #2]!	@ _129, MEM[(short int *)_253]
@ not_optimized_fixedpoint.c:190:     for (column = 0; column < N; column++) {
	cmp	r3, r6	@ ivtmp.173, _256
@ not_optimized_fixedpoint.c:192:         matrix[row1][column] = matrix[row2][column];
	strh	r0, [r3]	@ movhi	@ _129, MEM[(short int *)_251]
@ not_optimized_fixedpoint.c:193:         matrix[row2][column] = temporary;
	strh	r1, [r2]	@ movhi	@ temporary, MEM[(short int *)_253]
@ not_optimized_fixedpoint.c:190:     for (column = 0; column < N; column++) {
	bne	.L33		@,
@ not_optimized_fixedpoint.c:285:         pivot_value = working[pivot_column][pivot_column];
	ldrsh	r2, [r8]	@ _5, MEM[(short int *)_291]
.L25:
@ not_optimized_fixedpoint.c:269:         if (largest_value == 0) {
	cmp	r2, #0	@ _5
	beq	.L31	@
@ not_optimized_fixedpoint.c:292:             if (!fixed_divide(working[pivot_column][column], pivot_value, &division_result)) {
	ldrsh	r3, [fp]	@ _107, MEM[(short int *)_297]
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	cmp	r2, #0	@ _5,
	str	r4, [sp, #4]	@ ivtmp.211, %sfp
@ not_optimized_fixedpoint.c:139:     denominator_32 = denominator;
	mov	r0, r10	@ ivtmp.155, ivtmp.208
@ not_optimized_fixedpoint.c:137:     scaled_numerator = (int32_t)numerator * FIXED_ONE;
	lsl	r3, r3, #12	@ scaled_numerator, _107,
@ not_optimized_fixedpoint.c:139:     denominator_32 = denominator;
	mov	lr, fp	@ ivtmp.152, ivtmp.207
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	blt	.L79		@,
.L35:
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	cmp	r3, #0	@ scaled_numerator,
	mov	r4, #1	@ _8,
@ not_optimized_fixedpoint.c:147:         half_denominator = denominator_32 / 2;
	asr	r1, r2, #1	@ half_denominator, _5,
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	blt	.L37		@,
.L36:
@ not_optimized_fixedpoint.c:151:         scaled_numerator += half_denominator;
	add	r3, r3, r1	@ scaled_numerator, half_denominator
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	sdiv	r3, r3, r2	@ _157, scaled_numerator, _5
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r6, r3, #32768	@ _86, _157,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r6, #65536	@ _86,
	bcs	.L44		@,
.L39:
@ not_optimized_fixedpoint.c:300:             working[pivot_column][column] = (int16_t)division_result;
	strh	r3, [lr]	@ movhi	@ _157, MEM[(short int *)_31]
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	cmp	r2, #0	@ _5,
@ not_optimized_fixedpoint.c:137:     scaled_numerator = (int32_t)numerator * FIXED_ONE;
	ldrsh	r3, [r0, #2]	@ MEM[(short int *)_58 + 2B], MEM[(short int *)_58 + 2B]
	lsl	r3, r3, #12	@ scaled_numerator, MEM[(short int *)_58 + 2B],
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	blt	.L80		@,
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	cmp	r3, #0	@ scaled_numerator,
	ite	lt		@
	movlt	r6, #0	@, tmp271
	andge	r6, r4, #1	@,, tmp271, _8
	cmp	r6, #0	@ tmp271
	beq	.L42	@
.L41:
@ not_optimized_fixedpoint.c:151:         scaled_numerator += half_denominator;
	add	r3, r3, r1	@ scaled_numerator, half_denominator
.L43:
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	sdiv	r3, r3, r2	@ _175, scaled_numerator, _5
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r1, r3, #32768	@ _89, _175,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r1, #65536	@ _89,
	bcs	.L44		@,
@ not_optimized_fixedpoint.c:313:             inverse[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r0, #2]!	@ movhi	@ _175, MEM[(short int *)_20]
	add	r6, r10, #16	@ _296, ivtmp.208,
@ not_optimized_fixedpoint.c:287:         for (column = 0; column < N; column++) {
	cmp	r0, r6	@ ivtmp.155, _296
	beq	.L81		@,
@ not_optimized_fixedpoint.c:292:             if (!fixed_divide(working[pivot_column][column], pivot_value, &division_result)) {
	ldrsh	r3, [lr, #2]!	@ _107, MEM[(short int *)_38]
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	cmp	r2, #0	@ _5,
@ not_optimized_fixedpoint.c:137:     scaled_numerator = (int32_t)numerator * FIXED_ONE;
	lsl	r3, r3, #12	@ scaled_numerator, _107,
@ not_optimized_fixedpoint.c:144:     if (denominator_32 < 0) {
	bge	.L35		@,
.L79:
@ not_optimized_fixedpoint.c:145:         half_denominator = -denominator_32 / 2;
	rsbs	r1, r2, #0	@ _144, _5
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	cmp	r3, #0	@ scaled_numerator,
	mov	r4, #0	@ _8,
@ not_optimized_fixedpoint.c:145:         half_denominator = -denominator_32 / 2;
	asr	r1, r1, #1	@ half_denominator, _144,
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	blt	.L36		@,
.L37:
@ not_optimized_fixedpoint.c:153:         scaled_numerator -= half_denominator;
	subs	r3, r3, r1	@ scaled_numerator, scaled_numerator, half_denominator
@ not_optimized_fixedpoint.c:156:     *result = scaled_numerator / denominator_32;
	sdiv	r3, r3, r2	@ _157, scaled_numerator, _5
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r6, r3, #32768	@ _86, _157,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r6, #65536	@ _86,
	bcc	.L39		@,
.L44:
@ not_optimized_fixedpoint.c:297:                 return MATRIX_OVERFLOW;
	mov	r0, #-1	@ <retval>,
.L23:
@ not_optimized_fixedpoint.c:385: }
	add	sp, sp, #164	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L31:
@ not_optimized_fixedpoint.c:270:             return MATRIX_SINGULAR;
	movs	r0, #0	@ <retval>,
@ not_optimized_fixedpoint.c:385: }
	add	sp, sp, #164	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L81:
	ldr	r4, [sp, #4]	@ ivtmp.211, %sfp
	add	r3, r7, #142	@ _78, inverse,
	str	r3, [sp, #4]	@ _78, %sfp
@ not_optimized_fixedpoint.c:323:         working[pivot_column][pivot_column] = FIXED_ONE;
	mov	r2, #4096	@ tmp275,
	strh	r2, [r8]	@ movhi	@ tmp275, MEM[(short int *)_291]
	add	lr, r7, #14	@ ivtmp.134, inverse,
	strd	ip, r8, [sp, #8]	@ row, ivtmp.203,,
	str	r5, [sp, #16]	@ tmp294, %sfp
	mov	r3, r5	@ ivtmp.137, tmp294
@ not_optimized_fixedpoint.c:328:         for (other_row = 0; other_row < N; other_row++) {
	movs	r1, #0	@ other_row,
@ not_optimized_fixedpoint.c:323:         working[pivot_column][pivot_column] = FIXED_ONE;
	mov	r2, r6	@ _296, _296
	mov	r8, r7	@ inverse, inverse
.L52:
@ not_optimized_fixedpoint.c:330:             if (other_row == pivot_column) {
	cmp	r1, r9	@ other_row, ivtmp.198
	beq	.L46		@,
@ not_optimized_fixedpoint.c:334:             elimination_factor = working[other_row][pivot_column];
	ldrsh	r0, [r3, r9, lsl #1]	@ elimination_factor, MEM[(short int *)_153 + ivtmp.198_276 * 2]
@ not_optimized_fixedpoint.c:342:             if (elimination_factor == 0) {
	cbnz	r0, .L82	@ elimination_factor,
.L46:
@ not_optimized_fixedpoint.c:328:         for (other_row = 0; other_row < N; other_row++) {
	ldr	r0, [sp, #4]	@ _78, %sfp
	add	lr, lr, #16	@ ivtmp.134, ivtmp.134,
@ not_optimized_fixedpoint.c:328:         for (other_row = 0; other_row < N; other_row++) {
	adds	r1, r1, #1	@ other_row, other_row,
@ not_optimized_fixedpoint.c:328:         for (other_row = 0; other_row < N; other_row++) {
	adds	r3, r3, #16	@ ivtmp.137, ivtmp.137,
	cmp	r0, lr	@ _78, ivtmp.134
	bne	.L52		@,
@ not_optimized_fixedpoint.c:245:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	ldr	ip, [sp, #8]	@ row, %sfp
	mov	r7, r8	@ inverse, inverse
	ldrd	r8, r5, [sp, #12]	@ ivtmp.203, tmp294,,
	cmp	ip, #8	@ row,
	mov	r6, r2	@ _296, _296
	add	r9, r9, #1	@ ivtmp.198, ivtmp.198,
	add	r8, r8, #18	@ ivtmp.203, ivtmp.203,
	add	fp, fp, #16	@ ivtmp.207, ivtmp.207,
	add	r4, r4, #2	@ ivtmp.211, ivtmp.211,
	beq	.L83		@,
	mov	r10, r6	@ ivtmp.208, _296
	mov	r6, ip	@ pivot_row, row
	b	.L53		@
.L80:
@ not_optimized_fixedpoint.c:150:     if ((scaled_numerator >= 0 && denominator_32 > 0) || (scaled_numerator < 0 && denominator_32 < 0)) {
	cmp	r3, #0	@ scaled_numerator,
	blt	.L41		@,
.L42:
@ not_optimized_fixedpoint.c:153:         scaled_numerator -= half_denominator;
	subs	r3, r3, r1	@ scaled_numerator, scaled_numerator, half_denominator
	b	.L43		@
.L82:
@ not_optimized_fixedpoint.c:342:             if (elimination_factor == 0) {
	str	r9, [sp, #28]	@ ivtmp.198, %sfp
	sub	ip, lr, #16	@ ivtmp.117, ivtmp.134,
	mov	r5, r10	@ ivtmp.123, ivtmp.208
	mov	r7, r3	@ ivtmp.121, ivtmp.137
	mov	r6, fp	@ ivtmp.115, ivtmp.207
	strd	r1, r3, [sp, #20]	@ other_row, ivtmp.137,,
.L51:
@ not_optimized_fixedpoint.c:353:                 product = fixed_multiply(elimination_factor, working[pivot_column][column]);
	ldrsh	r3, [r6], #2	@ _16, MEM[(short int *)_147]
@ not_optimized_fixedpoint.c:355:                 updated_value = (int32_t)working[other_row][column] - product;
	ldrsh	r9, [r7]	@ _18, MEM[(short int *)_56]
@ not_optimized_fixedpoint.c:96:     product = (int32_t)first * (int32_t)second;
	mul	r3, r0, r3	@ product, elimination_factor, _16
@ not_optimized_fixedpoint.c:101:     if (product >= 0) {
	cmp	r3, #0	@ product,
@ not_optimized_fixedpoint.c:104:         product = product - (FIXED_ONE / 2);
	sub	r1, r3, #2048	@ product, product,
@ not_optimized_fixedpoint.c:102:         product = product + (FIXED_ONE / 2);
	it	ge
	addge	r1, r3, #2048	@ product, product,
@ not_optimized_fixedpoint.c:107:     return product / FIXED_ONE;
	addw	r3, r1, #4095	@ tmp279, product,
	ands	r3, r3, r1, asr #32	@ product, tmp279, product
	it	cc
	movcc	r3, r1	@ product, product
@ not_optimized_fixedpoint.c:355:                 updated_value = (int32_t)working[other_row][column] - product;
	sub	r1, r9, r3, asr #12	@ updated_value, _18, product,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r3, r1, #32768	@ _91, updated_value,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r3, #65536	@ _91,
	bcs	.L44		@,
@ not_optimized_fixedpoint.c:96:     product = (int32_t)first * (int32_t)second;
	ldrh	r3, [r5, #2]!	@, MEM[(short int *)_200]
@ not_optimized_fixedpoint.c:361:                 working[other_row][column] = (int16_t)updated_value;
	strh	r1, [r7], #2	@ movhi	@ updated_value, MEM[(short int *)_56]
@ not_optimized_fixedpoint.c:96:     product = (int32_t)first * (int32_t)second;
	smulbb	r3, r3, r0	@ product, MEM[(short int *)_200], elimination_factor
@ not_optimized_fixedpoint.c:101:     if (product >= 0) {
	cmp	r3, #0	@ product,
@ not_optimized_fixedpoint.c:104:         product = product - (FIXED_ONE / 2);
	sub	r1, r3, #2048	@ product, product,
@ not_optimized_fixedpoint.c:102:         product = product + (FIXED_ONE / 2);
	it	ge
	addge	r1, r3, #2048	@ product, product,
@ not_optimized_fixedpoint.c:368:                 updated_value = (int32_t)inverse[other_row][column] - product;
	ldrsh	r3, [ip, #2]	@ _28, MEM[(short int *)_32 + 2B]
@ not_optimized_fixedpoint.c:107:     return product / FIXED_ONE;
	addw	r9, r1, #4095	@ tmp287, product,
	ands	r9, r9, r1, asr #32	@ product, tmp287, product
	it	cc
	movcc	r9, r1	@ product, product
@ not_optimized_fixedpoint.c:368:                 updated_value = (int32_t)inverse[other_row][column] - product;
	sub	r3, r3, r9, asr #12	@ updated_value, _28, product,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r1, r3, #32768	@ _100, updated_value,
@ not_optimized_fixedpoint.c:62:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r1, #65536	@ _100,
	bcs	.L44		@,
@ not_optimized_fixedpoint.c:374:                 inverse[other_row][column] = (int16_t)updated_value;
	strh	r3, [ip, #2]!	@ movhi	@ updated_value, MEM[(short int *)_74]
@ not_optimized_fixedpoint.c:346:             for (column = 0; column < N; column++) {
	cmp	ip, lr	@ ivtmp.117, ivtmp.134
	bne	.L51		@,
@ not_optimized_fixedpoint.c:380:             working[other_row][pivot_column] = 0;
	ldrd	r1, r3, [sp, #20]	@ other_row, ivtmp.137,,
	ldr	r9, [sp, #28]	@ ivtmp.198, %sfp
	movs	r0, #0	@ tmp292,
	strh	r0, [r3, r9, lsl #1]	@ movhi	@ tmp292, MEM[(short int *)_153 + ivtmp.198_276 * 2]
	b	.L46		@
.L83:
@ not_optimized_fixedpoint.c:384:     return MATRIX_SUCCESS;
	movs	r0, #1	@ <retval>,
	b	.L23		@
.L85:
	.align	3
.L84:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.size	invert_matrix, .-invert_matrix
	.align	1
	.p2align 2,,3
	.global	multiply_matrices
	.syntax unified
	.thumb
	.thumb_func
	.type	multiply_matrices, %function
multiply_matrices:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ not_optimized_fixedpoint.c:102:         product = product + (FIXED_ONE / 2);
	vmov.i32	q15, #2048  @ v4si	@ tmp158,
@ not_optimized_fixedpoint.c:104:         product = product - (FIXED_ONE / 2);
	vmov.i32	q14, #4294965248  @ v4si	@ tmp160,
	vmov.i32	q13, #4095  @ v4si	@ tmp167,
	vmov.i32	q12, #0  @ v4si	@ tmp168,
@ not_optimized_fixedpoint.c:396: {
	push	{r4, r5, lr}	@
@ not_optimized_fixedpoint.c:396: {
	mov	ip, r2	@ ivtmp.265, tmp182
	sub	lr, r0, #2	@ ivtmp.267, tmp180,
	mov	r4, r1	@ second, tmp181
	add	r5, r2, #256	@ _29, ivtmp.265,
	add	r0, r1, #128	@ _44, second,
.L87:
	vmov.i32	q10, #0  @ v4si	@ vect_sum_43.228,
	mov	r3, r4	@ ivtmp.254, second
	mov	r2, lr	@ ivtmp.258, ivtmp.267
	vmov	q11, q10  @ v4si	@ vect_sum_26.243, vect_sum_43.228
.L88:
@ not_optimized_fixedpoint.c:410:                 product = fixed_multiply(first[row][k], second[k][column]);
	ldrsh	r1, [r2, #2]!	@ _4, MEM[(short int *)_10]
@ not_optimized_fixedpoint.c:410:                 product = fixed_multiply(first[row][k], second[k][column]);
	vld1.16	{q3}, [r3]!	@ tmp156, MEM <const vector(8) short int> [(short int *)vectp_second.229_107]
@ not_optimized_fixedpoint.c:410:                 product = fixed_multiply(first[row][k], second[k][column]);
	vdup.16	q8, r1	@ tmp154, _4
@ not_optimized_fixedpoint.c:409:             for (k = 0; k < N; k++) {
	cmp	r0, r3	@ _44, ivtmp.254
	vmull.s16 q9, d16, d6	@ vect_patt_97.232, tmp154, tmp156
	vmull.s16 q8, d17, d7	@ vect_patt_97.232, tmp154, tmp156
@ not_optimized_fixedpoint.c:102:         product = product + (FIXED_ONE / 2);
	vadd.i32	q1, q9, q15	@ vect__71.234_115, vect_patt_97.232, tmp158
	vadd.i32	q3, q8, q15	@ vect__71.234_116, vect_patt_97.232, tmp158
@ not_optimized_fixedpoint.c:104:         product = product - (FIXED_ONE / 2);
	vadd.i32	q2, q8, q14	@ vect__73.237_124, vect_patt_97.232, tmp160
	vadd.i32	q0, q9, q14	@ vect__73.237_123, vect_patt_97.232, tmp160
	vcge.s32	q8, q8, #0	@ tmp166, vect_patt_97.232
	vcge.s32	q9, q9, #0	@ tmp161, vect_patt_97.232
	vbsl	q8, q3, q2	@ vect_product_32.239, vect__71.234_116, vect__73.237_124
	vbsl	q9, q1, q0	@ vect_product_32.239, vect__71.234_115, vect__73.237_123
	vclt.s32	q3, q8, #0	@ tmp172, vect_product_32.239
	vclt.s32	q2, q9, #0	@ tmp169, vect_product_32.239
	vbsl	q3, q13, q12	@ vect_patt_75.240, tmp167, tmp168
	vbsl	q2, q13, q12	@ vect_patt_75.240, tmp167, tmp168
@ not_optimized_fixedpoint.c:411:                 sum += product;
	vadd.i32	q8, q8, q3	@ vect_patt_72.241_137, vect_product_32.239, vect_patt_75.240
	vadd.i32	q9, q9, q2	@ vect_patt_72.241_136, vect_product_32.239, vect_patt_75.240
	vshr.s32	q8, q8, #12	@ vect_patt_45.242_140, vect_patt_72.241_137,
	vshr.s32	q9, q9, #12	@ vect_patt_45.242_139, vect_patt_72.241_136,
	vadd.i32	q10, q10, q8	@ vect_sum_43.228, vect_sum_43.228, vect_patt_45.242_140
	vadd.i32	q11, q11, q9	@ vect_sum_26.243, vect_sum_26.243, vect_patt_45.242_139
@ not_optimized_fixedpoint.c:409:             for (k = 0; k < N; k++) {
	bne	.L88		@,
@ not_optimized_fixedpoint.c:414:             result[row][column] = sum;
	mov	r3, ip	@ tmp177, ivtmp.265
@ not_optimized_fixedpoint.c:404:     for (row = 0; row < N; row++) {
	add	ip, ip, #32	@ ivtmp.265, ivtmp.265,
	cmp	r5, ip	@ _29, ivtmp.265
	add	lr, lr, #16	@ ivtmp.267, ivtmp.267,
@ not_optimized_fixedpoint.c:414:             result[row][column] = sum;
	vst1.32	{q11}, [r3]!	@ vect_sum_26.243, MEM <vector(4) int> [(int *)vectp.246_145]
	vst1.32	{q10}, [r3]	@ vect_sum_43.228, MEM <vector(4) int> [(int *)vectp.245_151]
@ not_optimized_fixedpoint.c:404:     for (row = 0; row < N; row++) {
	bne	.L87		@,
@ not_optimized_fixedpoint.c:417: }
	pop	{r4, r5, pc}	@
	.size	multiply_matrices, .-multiply_matrices
	.align	1
	.p2align 2,,3
	.global	matrix_infinity_norm
	.syntax unified
	.thumb
	.thumb_func
	.type	matrix_infinity_norm, %function
matrix_infinity_norm:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:427: {
	mov	r2, r0	@ tmp131, matrix
@ not_optimized_fixedpoint.c:434:     maximum_row_sum = 0;
	movs	r0, #0	@ <retval>,
	add	r1, r2, #128	@ _33, ivtmp.290,
.L93:
@ not_optimized_fixedpoint.c:440:             row_sum += fixed_absolute(matrix[row][column]);
	vld1.16	{q9}, [r2]!	@ vect__4.279_7, MEM <const vector(8) short int> [(short int *)vectp.278_20]
@ not_optimized_fixedpoint.c:50:     if (widened_value < 0) {
	vabs.s16	q9, q9	@ vect__19.280_6, vect__4.279_7
	vmovl.u16 q8, d18	@ vect_patt_25.281_5, vect__19.280_6
	vaddw.u16	q8, q8, d19	@ vect_patt_25.281_5, vect_patt_25.281_5, vect__19.280_6
	vadd.i32	d7, d16, d17	@ tmp127, vect_patt_25.281_5
	vpadd.i32	d7, d7, d7	@ tmp128, tmp127, tmp127
	vmov	r3, s14	@ int	@ _34, tmp128
@ not_optimized_fixedpoint.c:443:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ <retval>, _34
	it	lt
	movlt	r0, r3	@ <retval>, _34
@ not_optimized_fixedpoint.c:436:     for (row = 0; row < N; row++) {
	cmp	r2, r1	@ ivtmp.290, _33
	bne	.L93		@,
@ not_optimized_fixedpoint.c:449: }
	bx	lr	@
	.size	matrix_infinity_norm, .-matrix_infinity_norm
	.align	1
	.p2align 2,,3
	.global	multiply_positive_q12
	.syntax unified
	.thumb
	.thumb_func
	.type	multiply_positive_q12, %function
multiply_positive_q12:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ not_optimized_fixedpoint.c:465:     if (first < 0 || second < 0) {
	orrs	r3, r0, r1	@ tmp132, first, second
	bmi	.L99		@,
@ not_optimized_fixedpoint.c:469:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r0, .L97	@ first,
@ not_optimized_fixedpoint.c:469:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	sdiv	r3, r3, r0	@ _12, tmp125, first
@ not_optimized_fixedpoint.c:469:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r1, r3	@ second, _12
	bgt	.L99		@,
.L97:
@ not_optimized_fixedpoint.c:474:     product = first * second;
	mul	r3, r1, r0	@ product_13, second, first
@ not_optimized_fixedpoint.c:481:     return 1;
	movs	r0, #1	@ <retval>,
@ not_optimized_fixedpoint.c:479:     *result = product / FIXED_ONE;
	asrs	r3, r3, #12	@ _14, product_13,
@ not_optimized_fixedpoint.c:479:     *result = product / FIXED_ONE;
	str	r3, [r2]	@ _14, *result_9(D)
@ not_optimized_fixedpoint.c:481:     return 1;
	bx	lr	@
.L99:
@ not_optimized_fixedpoint.c:466:         return 0;
	movs	r0, #0	@ <retval>,
@ not_optimized_fixedpoint.c:482: }
	bx	lr	@
	.size	multiply_positive_q12, .-multiply_positive_q12
	.align	1
	.p2align 2,,3
	.global	calculate_condition_number
	.syntax unified
	.thumb
	.thumb_func
	.type	calculate_condition_number, %function
calculate_condition_number:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}	@
	add	ip, r0, #128	@ _67, ivtmp.330,
@ not_optimized_fixedpoint.c:496: {
	mov	lr, r2	@ condition_number, tmp161
@ not_optimized_fixedpoint.c:434:     maximum_row_sum = 0;
	movs	r2, #0	@ maximum_row_sum,
.L104:
@ not_optimized_fixedpoint.c:440:             row_sum += fixed_absolute(matrix[row][column]);
	vld1.16	{q9}, [r0]!	@ vect__34.311_37, MEM <const vector(8) short int> [(short int *)vectp.310_60]
@ not_optimized_fixedpoint.c:50:     if (widened_value < 0) {
	vabs.s16	q9, q9	@ vect__47.312_36, vect__34.311_37
	vmovl.u16 q8, d18	@ vect_patt_63.313_35, vect__47.312_36
	vaddw.u16	q8, q8, d19	@ vect_patt_63.313_35, vect_patt_63.313_35, vect__47.312_36
	vadd.i32	d7, d16, d17	@ tmp142, vect_patt_63.313_35
	vpadd.i32	d7, d7, d7	@ tmp143, tmp142, tmp142
	vmov	r3, s14	@ int	@ _29, tmp143
@ not_optimized_fixedpoint.c:443:         if (row_sum > maximum_row_sum) {
	cmp	r2, r3	@ maximum_row_sum, _29
	it	lt
	movlt	r2, r3	@ maximum_row_sum, _29
@ not_optimized_fixedpoint.c:436:     for (row = 0; row < N; row++) {
	cmp	ip, r0	@ _67, ivtmp.330
	bne	.L104		@,
@ not_optimized_fixedpoint.c:434:     maximum_row_sum = 0;
	movs	r0, #0	@ maximum_row_sum,
	add	ip, r1, #128	@ _33, ivtmp.324,
.L105:
@ not_optimized_fixedpoint.c:440:             row_sum += fixed_absolute(matrix[row][column]);
	vld1.16	{q9}, [r1]!	@ vect__19.304_70, MEM <const vector(8) short int> [(short int *)vectp.303_75]
@ not_optimized_fixedpoint.c:50:     if (widened_value < 0) {
	vabs.s16	q9, q9	@ vect__54.305_69, vect__19.304_70
	vmovl.u16 q8, d18	@ vect_patt_77.306_68, vect__54.305_69
	vaddw.u16	q8, q8, d19	@ vect_patt_77.306_68, vect_patt_77.306_68, vect__54.305_69
	vadd.i32	d7, d16, d17	@ tmp148, vect_patt_77.306_68
	vpadd.i32	d7, d7, d7	@ tmp149, tmp148, tmp148
	vmov	r3, s14	@ int	@ _66, tmp149
@ not_optimized_fixedpoint.c:443:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ maximum_row_sum, _66
	it	lt
	movlt	r0, r3	@ maximum_row_sum, _66
@ not_optimized_fixedpoint.c:436:     for (row = 0; row < N; row++) {
	cmp	ip, r1	@ _33, ivtmp.324
	bne	.L105		@,
@ not_optimized_fixedpoint.c:465:     if (first < 0 || second < 0) {
	orrs	r3, r0, r2	@ tmp162, maximum_row_sum, maximum_row_sum
	bmi	.L109		@,
@ not_optimized_fixedpoint.c:469:     if (first != 0 && second > INT32_MAX / first) {
	cbnz	r2, .L116	@ maximum_row_sum,
.L107:
@ not_optimized_fixedpoint.c:474:     product = first * second;
	mul	r3, r2, r0	@ product_45, maximum_row_sum, maximum_row_sum
@ not_optimized_fixedpoint.c:481:     return 1;
	movs	r0, #1	@ <retval>,
@ not_optimized_fixedpoint.c:479:     *result = product / FIXED_ONE;
	asrs	r3, r3, #12	@ _46, product_45,
@ not_optimized_fixedpoint.c:479:     *result = product / FIXED_ONE;
	str	r3, [lr]	@ _46, *condition_number_6(D)
@ not_optimized_fixedpoint.c:505: }
	ldr	pc, [sp], #4	@
.L116:
@ not_optimized_fixedpoint.c:469:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp153,
	sdiv	r3, r3, r2	@ _44, tmp153, maximum_row_sum
@ not_optimized_fixedpoint.c:469:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r0, r3	@ maximum_row_sum, _44
	ble	.L107		@,
.L109:
@ not_optimized_fixedpoint.c:466:         return 0;
	movs	r0, #0	@ <retval>,
@ not_optimized_fixedpoint.c:505: }
	ldr	pc, [sp], #4	@
	.size	calculate_condition_number, .-calculate_condition_number
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
