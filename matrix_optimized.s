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
	.file	"matrix_optimized.c"
@ GNU C11 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O2 -std=c11
	.text
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
	ldr	r3, .L5	@ ivtmp.70,
	add	r2, r0, #128	@ _23, ivtmp.71,
.LPIC0:
	add	r3, pc	@ ivtmp.70
.L2:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]!	@ _10, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r0]!	@ _10, MEM[(short int[8] *)_3]
@ matrix_optimized.c:189:     for (row = 0; row < N; row++) {
	cmp	r0, r2	@ ivtmp.71, _23
	bne	.L2		@,
@ matrix_optimized.c:192: }
	bx	lr	@
.L6:
	.align	2
.L5:
	.word	.LANCHOR0-(.LPIC0+4)
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
@ matrix_optimized.c:198:     int16x8_t first  = vld1q_s16(matrix[row1]);   /* read both rows before */
	add	r1, r0, r1, lsl #4	@ _3, matrix, tmp128,
@ matrix_optimized.c:199:     int16x8_t second = vld1q_s16(matrix[row2]);   /* either store lands */
	add	r0, r0, r2, lsl #4	@ _6, matrix, tmp129,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1]	@ _12, MEM[(const short int[8] *)_3]
	vld1.16	{d18-d19}, [r0]	@ _11, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r1]	@ _11, MEM[(short int[8] *)_3]
	vst1.16	{d16-d17}, [r0]	@ _12, MEM[(short int[8] *)_6]
@ matrix_optimized.c:203: }
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
	@ args = 0, pretend = 0, frame = 336
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	mov	r4, r1	@ inverse, tmp446
	vpush.64	{d8, d9, d10, d11}	@
@ matrix_optimized.c:434:     matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
	ldr	r2, .L76	@ tmp333,
@ matrix_optimized.c:384: {
	sub	sp, sp, #340	@,,
	ldr	r5, .L76+4	@ ivtmp.156,
@ matrix_optimized.c:384: {
	add	r3, sp, #87	@ tmp326,,
	bic	r3, r3, #15	@ ivtmp.155_451, tmp326,
	add	r6, r0, #128	@ _457, ivtmp.154,
@ matrix_optimized.c:434:     matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
.LPIC1:
	add	r2, pc	@ tmp333
	mov	r10, r3	@ ivtmp.141, ivtmp.155_451
.LPIC3:
	add	r5, pc	@ ivtmp.156
@ matrix_optimized.c:435:     matrix_predicted_bits = MATRIX_INPUT_BITS;
	mov	r1, r3	@ ivtmp.155, ivtmp.155_451
@ matrix_optimized.c:434:     matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
	movs	r7, #13	@ tmp334,
@ matrix_optimized.c:435:     matrix_predicted_bits = MATRIX_INPUT_BITS;
	strd	r7, r7, [r2]	@ tmp334, tmp334, tmp333
.L9:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r0]!	@ _90, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r2, r1	@ tmp340, ivtmp.155
@ matrix_optimized.c:442:     for (row = 0; row < N; row++) {
	adds	r1, r1, #32	@ ivtmp.155, ivtmp.155,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r5:128]!	@ _96, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r2:128]!	@ _90, MEM[(short int[8] *)_1]
@ matrix_optimized.c:442:     for (row = 0; row < N; row++) {
	cmp	r0, r6	@ ivtmp.154, _457
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r2:128]	@ _96, MEM[(short int[8] *)_5]
@ matrix_optimized.c:442:     for (row = 0; row < N; row++) {
	bne	.L9		@,
@ matrix_optimized.c:489:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	ldr	fp, .L76+8	@ tmp437,
	movs	r1, #0	@ ivtmp.136,
	str	r3, [sp, #4]	@ ivtmp.143, %sfp
	mov	lr, r3	@ ivtmp.144, ivtmp.155_451
.LPIC4:
	add	fp, pc	@ tmp437
@ matrix_optimized.c:448:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	mov	ip, r1	@ pivot_column, ivtmp.136
	str	r4, [sp, #16]	@ inverse, %sfp
@ matrix_optimized.c:433:     peak_bits = MATRIX_INPUT_BITS;
	movs	r0, #13	@ peak_bits,
	str	r0, [sp, #8]	@ peak_bits, %sfp
.L41:
@ matrix_optimized.c:457:         largest_value = fixed_absolute(augmented[pivot_column][pivot_column]);
	ldrsh	r0, [r10]	@ _7, MEM[(short int *)_438]
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	cmp	ip, #7	@ pivot_column,
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	add	r9, ip, #1	@ row, pivot_column,
@ matrix_optimized.c:48:     int32_t sign_mask     = widened_value >> 31; /* 0 if >= 0, all ones if < 0 */
	asr	r4, r0, #31	@ sign_mask, _7,
@ matrix_optimized.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r6, r0, r4	@ _133, _7, sign_mask
@ matrix_optimized.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r6, r6, r4	@ largest_value, _133, sign_mask
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L43		@,
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	ldr	r4, [sp, #4]	@ ivtmp.143, %sfp
@ matrix_optimized.c:456:         pivot_row     = pivot_column;
	mov	r7, ip	@ pivot_row, pivot_column
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	mov	r5, r9	@ row, row
.L12:
@ matrix_optimized.c:460:             current_value = fixed_absolute(augmented[row][pivot_column]);
	lsls	r2, r5, #5	@ _426, row,
@ matrix_optimized.c:47:     int32_t widened_value = value;              /* sign-extend to 32 bits */
	ldrsh	r2, [r4, r2]	@ widened_value, MEM[(short int *)_424 + _426 * 1]
@ matrix_optimized.c:48:     int32_t sign_mask     = widened_value >> 31; /* 0 if >= 0, all ones if < 0 */
	asr	r8, r2, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r2, r8, r2	@ _16, sign_mask, widened_value
@ matrix_optimized.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r2, r2, r8	@ _404, _16, sign_mask
@ matrix_optimized.c:464:                 pivot_row     = row;
	cmp	r6, r2	@ largest_value, _404
	it	lt
	movlt	r7, r5	@ pivot_row, row
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	add	r5, r5, #1	@ row, row,
@ matrix_optimized.c:464:                 pivot_row     = row;
	it	lt
	movlt	r6, r2	@ largest_value, _404
@ matrix_optimized.c:459:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r5, #8	@ row,
	bne	.L12		@,
.L10:
@ matrix_optimized.c:469:         if (largest_value == 0) {
	cbz	r6, .L19	@ largest_value,
@ matrix_optimized.c:366:     return __builtin_clz(value);   // one CLZ on Cortex-A7
	clz	r6, r6	@ _139, largest_value
@ matrix_optimized.c:489:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	ldr	r5, [sp, #8]	@ _10, %sfp
@ matrix_optimized.c:483:         growth_bits = count_leading_zeros((uint32_t)largest_value) - 19;
	subs	r6, r6, #19	@ growth_bits_86, _139,
@ matrix_optimized.c:489:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	ldr	r4, [fp, #4]	@ matrix_predicted_bits, matrix_predicted_bits
@ matrix_optimized.c:489:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	cmp	r6, #0	@ growth_bits_86,
	it	ge		@
	addge	r5, r5, r6	@,, _10, _10, growth_bits_86
@ matrix_optimized.c:489:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	cmp	r5, r4	@ _10, matrix_predicted_bits
@ matrix_optimized.c:490:             matrix_predicted_bits = peak_bits + growth_bits;
	it	gt
	strgt	r5, [fp, #4]	@ _10, matrix_predicted_bits
@ matrix_optimized.c:498:         if (pivot_row != pivot_column) {
	cmp	r7, r1	@ pivot_row, ivtmp.136
	beq	.L16		@,
	lsls	r7, r7, #5	@ _275, pivot_row,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r0, lr	@ _15, ivtmp.144
@ matrix_optimized.c:500:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r4, r7, #16	@ _75, _275,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d22-d23}, [r0:128]!	@ _85, MEM[(const short int[8] *)_14]
@ matrix_optimized.c:499:             int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
	add	r7, r7, r3	@ _12, ivtmp.155_451
@ matrix_optimized.c:500:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r4, r4, r3	@ _13, ivtmp.155_451
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d20-d21}, [r0:128]	@ _112, MEM[(const short int[8] *)_15]
	vld1.16	{d18-d19}, [r7:128]	@ _83, MEM[(const short int[8] *)_12]
	vld1.16	{d16-d17}, [r4:128]	@ _115, MEM[(const short int[8] *)_13]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d22-d23}, [r7:128]	@ _85, MEM[(short int[8] *)_12]
	vst1.16	{d20-d21}, [r4:128]	@ _112, MEM[(short int[8] *)_13]
	vst1.16	{d18-d19}, [lr:128]	@ _83, MEM[(short int[8] *)_14]
	vst1.16	{d16-d17}, [r0:128]	@ _115, MEM[(short int[8] *)_15]
@ matrix_optimized.c:517:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r0, [r10]	@ _7, MEM[(short int *)_438]
.L16:
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	movs	r4, #1	@ column,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	add	r5, lr, #2	@ ivtmp.128, ivtmp.144,
@ matrix_optimized.c:521:             if (column == pivot_column) {
	cmp	r1, #0	@ ivtmp.136
	beq	.L18	@
	mov	r5, lr	@ ivtmp.128, ivtmp.144
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	movs	r4, #0	@ column,
.L17:
@ matrix_optimized.c:106:     if (denominator == 0) {
	cbnz	r0, .L74	@ _7,
.L19:
@ matrix_optimized.c:470:             return MATRIX_SINGULAR;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:656: }
	add	sp, sp, #340	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L74:
@ matrix_optimized.c:147:     denominator_mask = denominator_32 >> 31;
	asr	r8, r0, #31	@ denominator_mask, _7,
@ matrix_optimized.c:149:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r6, r0, r8	@ _190, _7, denominator_mask
@ matrix_optimized.c:149:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	sub	r6, r6, r8	@ _191, _190, denominator_mask
@ matrix_optimized.c:148:     half_denominator =
	asrs	r2, r6, #1	@ half_denominator_192, _191,
	str	r2, [sp, #12]	@ half_denominator_192, %sfp
.L20:
@ matrix_optimized.c:525:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r5]	@ _17, MEM[(short int *)_421]
@ matrix_optimized.c:115:     if (numerator == 0) {
	cbz	r6, .L21	@ _17,
@ matrix_optimized.c:120:     if (denominator == FIXED_ONE) {     /* x / 1.0 */
	cmp	r0, #4096	@ _7,
	beq	.L25		@,
@ matrix_optimized.c:125:     if (denominator == -FIXED_ONE) {    /* x / -1.0 */
	cmn	r0, #4096	@ _7,
@ matrix_optimized.c:158:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	itett	ne
	eorne	r7, r8, r6, asr #31	@ quotient_sign_mask, denominator_mask, _17,
@ matrix_optimized.c:126:         *result = -(int32_t)numerator;
	rsbeq	r2, r6, #0	@ division_result, _17
@ matrix_optimized.c:160:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	ldrne	r2, [sp, #12]	@ half_denominator_192, %sfp
	eorne	r2, r2, r7	@ _195, half_denominator_192, quotient_sign_mask
@ matrix_optimized.c:159:     rounding_term =
	ittt	ne
	subne	r2, r2, r7	@ rounding_term_196, _195, quotient_sign_mask
@ matrix_optimized.c:162:     *result = (scaled_numerator + rounding_term) / denominator_32;
	addne	r2, r2, r6, lsl #12	@ _197, rounding_term_196, _17,
@ matrix_optimized.c:162:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdivne	r2, r2, r0	@ division_result, _197, _7
@ matrix_optimized.c:57:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r6, r2, #32768	@ _141, division_result,
@ matrix_optimized.c:57:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r6, #65536	@ _141,
	bcs	.L40		@,
@ matrix_optimized.c:534:             augmented[pivot_column][column] = (int16_t)division_result;
	sxth	r6, r2	@ _17, division_result
.L21:
@ matrix_optimized.c:534:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r6, [r5], #2	@ movhi	@ _17, MEM[(short int *)_61]
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #1	@ column, column,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r4, #16	@ column,
	beq	.L23		@,
@ matrix_optimized.c:521:             if (column == pivot_column) {
	cmp	r4, r1	@ column, ivtmp.136
	bne	.L20		@,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r5, r5, #2	@ ivtmp.128, ivtmp.128,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r1, #1	@ column, ivtmp.136,
.L18:
@ matrix_optimized.c:521:             if (column == pivot_column) {
	cmp	r4, r1	@ column, ivtmp.136
	bne	.L17		@,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r5, r5, #2	@ ivtmp.128, ivtmp.128,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r1, #1	@ column, ivtmp.136,
	b	.L18		@
.L75:
@ matrix_optimized.c:521:             if (column == pivot_column) {
	cmp	r2, r1	@ column, ivtmp.136
	beq	.L24		@,
@ matrix_optimized.c:525:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r5, #2]!	@ _17, MEM[(short int *)_390]
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	mov	r4, r2	@ column, column
@ matrix_optimized.c:115:     if (numerator == 0) {
	cmp	r6, #0	@ _17
	beq	.L21	@
.L25:
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r4, #15	@ column,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	add	r2, r4, #1	@ column, column,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	bne	.L75		@,
.L23:
@ matrix_optimized.c:561:             target_factor[target_count] = factor;
	ldr	r5, [sp, #4]	@ ivtmp.143, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r0, lr	@ tmp365, ivtmp.144
@ matrix_optimized.c:538:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	mov	r4, #4096	@ tmp364,
@ matrix_optimized.c:560:             target_row[target_count]    = row;
	add	r7, sp, #44	@ tmp431,,
@ matrix_optimized.c:538:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	strh	r4, [r10]	@ movhi	@ tmp364, MEM[(short int *)_438]
@ matrix_optimized.c:561:             target_factor[target_count] = factor;
	add	r6, sp, #28	@ tmp432,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r0:128]!	@ _125, MEM[(const short int[8] *)_21]
	vld1.16	{d22-d23}, [r0:128]	@ _124, MEM[(const short int[8] *)_22]
@ matrix_optimized.c:553:         for (row = 0; row < N; row++) {
	movs	r0, #0	@ row,
@ matrix_optimized.c:551:         target_count = 0;
	mov	r4, r0	@ target_count, row
.L32:
@ matrix_optimized.c:554:             int16_t factor = augmented[row][pivot_column];
	lsls	r2, r0, #5	@ _413, row,
	ldrsh	r2, [r5, r2]	@ factor, MEM[(short int *)_411 + _413 * 1]
@ matrix_optimized.c:556:             if (row == pivot_column || factor == 0) {
	cmp	r2, #0	@ factor,
	it	ne		@
	cmpne	r0, r1	@, row, ivtmp.136
@ matrix_optimized.c:560:             target_row[target_count]    = row;
	it	ne
	strne	r0, [r7, r4, lsl #2]	@ row, target_row[target_count_120]
@ matrix_optimized.c:553:         for (row = 0; row < N; row++) {
	add	r0, r0, #1	@ row, row,
@ matrix_optimized.c:561:             target_factor[target_count] = factor;
	itt	ne
	strhne	r2, [r6, r4, lsl #1]	@ movhi	@ factor, target_factor[target_count_120]
@ matrix_optimized.c:562:             target_count++;
	addne	r4, r4, #1	@ target_count, target_count,
@ matrix_optimized.c:553:         for (row = 0; row < N; row++) {
	cmp	r0, #8	@ row,
	bne	.L32		@,
@ matrix_optimized.c:567:         if (target_count > 0) {
	cmp	r4, #0	@ target_count
	beq	.L34	@
@ matrix_optimized.c:580:             stage_pointer = &augmented[target_row[0]][0];
	ldr	r2, [sp, #44]	@ target_row[0], target_row[0]
@ matrix_optimized.c:586:             for (index = 1; index < target_count; index++) {
	cmp	r4, #1	@ target_count,
@ matrix_optimized.c:583:             stage_factor  = target_factor[0];
	ldrsh	r6, [sp, #28]	@ next_factor, target_factor[0]
@ matrix_optimized.c:580:             stage_pointer = &augmented[target_row[0]][0];
	add	r0, sp, #44	@ ivtmp.102,,
@ matrix_optimized.c:580:             stage_pointer = &augmented[target_row[0]][0];
	add	r5, r3, r2, lsl #5	@ next_pointer, ivtmp.155_451, target_row[0],
@ matrix_optimized.c:583:             stage_factor  = target_factor[0];
	add	r7, sp, #28	@ tmp388,,
@ matrix_optimized.c:580:             stage_pointer = &augmented[target_row[0]][0];
	str	r0, [sp, #12]	@ ivtmp.102, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r8, r5	@ _29, next_pointer
@ matrix_optimized.c:565:         overflow = vdupq_n_s32(0);   /* fresh accumulator for this step */
	vmov.i32	q14, #0  @ v4si	@ overflow,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r8:128]!	@ _129, MEM[(const short int[8] *)stage_pointer_92]
	vld1.16	{d26-d27}, [r8:128]	@ _128, MEM[(const short int[8] *)_27]
@ matrix_optimized.c:586:             for (index = 1; index < target_count; index++) {
	beq	.L35		@,
	add	r2, r7, r4, lsl #1	@ _34, tmp388, target_count,
	add	r7, sp, #30	@ ivtmp.113,,
	str	r4, [sp, #20]	@ target_count, %sfp
	mov	r4, r2	@ _34, _34
.L36:
	vmov	q15, q13  @ v8hi	@ stage_high, _128
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d7[0], r6	@ tmp394,, stage_factor
	vmov.16	d6[0], r6	@ tmp395,, stage_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _221, stage_low,
	vshll.s16	q5, d19, #12	@ _223, stage_low,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d5[0], r6	@ tmp396,, stage_factor
	vmov.16	d4[0], r6	@ tmp397,, stage_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q4, d30, #12	@ _201, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q8, d24, d7[0]	@ _225, _125, tmp394,
	vmlsl.s16	q5, d25, d6[0]	@ _227, _125, tmp395,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q15, d31, #12	@ _203, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q4, d22, d5[0]	@ _205, _124, tmp396,
@ matrix_optimized.c:589:                 next_pointer = &augmented[target_row[index]][0];
	ldr	r6, [r0, #4]!	@ MEM[(int *)_184], MEM[(int *)_184]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r2, r5	@ tmp405, stage_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q15, d23, d4[0]	@ _207, _124, tmp397,
@ matrix_optimized.c:589:                 next_pointer = &augmented[target_row[index]][0];
	add	r5, r3, r6, lsl #5	@ next_pointer, ivtmp.155_451, MEM[(int *)_184],
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _228, _225,
	vrshr.s32	q5, q5, #12	@ _229, _227,
@ matrix_optimized.c:592:                 next_factor  = target_factor[index];
	ldrsh	r6, [r7], #2	@ next_factor, MEM[(short int *)_183]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r8, r5	@ _29, next_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d20, q8	@ _237, _228
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r8:128]!	@ _129, MEM[(const short int[8] *)next_pointer_100]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d21, q5	@ _238, _229
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q4, q4, #12	@ _208, _205,
	vrshr.s32	q15, q15, #12	@ _209, _207,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d26-d27}, [r8:128]	@ _128, MEM[(const short int[8] *)_29]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d20-d21}, [r2]!	@ _239, MEM[(short int[8] *)stage_pointer_388]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d20, q4	@ _217, _208
	vmovn.i32	d21, q15	@ _218, _209
@ matrix_optimized.c:586:             for (index = 1; index < target_count; index++) {
	cmp	r4, r7	@ _34, ivtmp.113
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d20-d21}, [r2:128]	@ _219, MEM[(short int[8] *)_31]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q8, #31	@ _231, _228,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q8, q8, q10	@ _232, _228, _231
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q5, #31	@ _233, _229,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q5, q5, q10	@ _234, _229, _233
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q4, #31	@ _211, _208,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q5	@ _30, _232, _234
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q4, q4, q10	@ _212, _208, _211
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q15, #31	@ _213, _209,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q4	@ _393, _30, _212
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q15, q15, q10	@ _214, _209, _213
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q15	@ _394, _393, _214
	vorr	q14, q14, q8	@ overflow, overflow, _394
@ matrix_optimized.c:586:             for (index = 1; index < target_count; index++) {
	bne	.L36		@,
	ldr	r4, [sp, #20]	@ target_count, %sfp
.L35:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _261, _129,
	vshll.s16	q10, d19, #12	@ _263, _129,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d3[0], r6	@ tmp406,, next_factor
	vmov.16	d2[0], r6	@ tmp407,, next_factor
	vmlsl.s16	q8, d24, d3[0]	@ _265, _125, tmp406,
	vmov.16	d1[0], r6	@ tmp408,, next_factor
	vmlsl.s16	q10, d25, d2[0]	@ _267, _125, tmp407,
	vmov.16	d0[0], r6	@ tmp409,, next_factor
	ldr	r0, [sp, #12]	@ ivtmp.102, %sfp
@ matrix_optimized.c:629:                 augmented[target_row[index]][pivot_column] = 0;
	movs	r6, #0	@ tmp421,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _268, _265,
	add	r4, r0, r4, lsl #2	@ _286, ivtmp.102, target_count,
	vrshr.s32	q10, q10, #12	@ _269, _267,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q15, q8, #31	@ _271, _268,
	vshr.s32	q12, q10, #31	@ _273, _269,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d18, q8	@ _277, _268
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q12, q10, q12	@ _274, _269, _273
	veor	q8, q8, q15	@ _272, _268, _271
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d19, q10	@ _278, _269
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q12	@ _381, _272, _274
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q10, d27, #12	@ _243, _128,
	vshll.s16	q12, d26, #12	@ _241, _128,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r5:128]	@ _279, MEM[(short int[8] *)stage_pointer_91]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q12, d22, d1[0]	@ _245, _124, tmp408,
	vmov	q9, q10  @ v4si	@ _243, _243
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q14	@ _379, _381, overflow
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q9, d23, d0[0]	@ _243, _124, tmp409,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q10, q12, #12	@ _248, _245,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q10, #31	@ _251, _248,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q9, q9, #12	@ _249, _247,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d22, q10	@ _257, _248
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q12, q9, #31	@ _253, _249,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q10, q10, q13	@ _252, _248, _251
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d23, q9	@ _258, _249
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q10	@ _375, _379, _252
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q12	@ _254, _249, _253
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d22-d23}, [r8:128]	@ _259, MEM[(short int[8] *)prephitmp_403]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q9	@ _256, _375, _254
.L37:
@ matrix_optimized.c:629:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r2, [r0], #4	@ _36, MEM[(int *)_116]
@ matrix_optimized.c:629:                 augmented[target_row[index]][pivot_column] = 0;
	add	r2, ip, r2, lsl #4	@ tmp419, pivot_column, _36,
@ matrix_optimized.c:628:             for (index = 0; index < target_count; index++) {
	cmp	r0, r4	@ ivtmp.102, _286
@ matrix_optimized.c:629:                 augmented[target_row[index]][pivot_column] = 0;
	strh	r6, [r3, r2, lsl #1]	@ movhi	@ tmp421, augmented[_36][pivot_column_215]
@ matrix_optimized.c:628:             for (index = 0; index < target_count; index++) {
	bne	.L37		@,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15289:   return __a | __b;
	vorr	d16, d17, d16	@ _148, _256, _256
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3924:   return (uint32x2_t)__builtin_neon_vpmaxuv2si ((int32x2_t) __a, (int32x2_t) __b);
	vpmax.u32	d16, d16, d16	@ _150, _148, _148
	vmov	r4, r5, d16  @ v2si	@ _150, _150
@ matrix_optimized.c:373:     return folded ? 32 - count_leading_zeros(folded) : 0;
	cmp	r4, #0	@ _151
	beq	.L34		@,
@ matrix_optimized.c:366:     return __builtin_clz(value);   // one CLZ on Cortex-A7
	clz	r4, r4	@ _142, _151
@ matrix_optimized.c:639:             if (step_bits > peak_bits) {
	ldr	r2, [sp, #8]	@ peak_bits, %sfp
@ matrix_optimized.c:373:     return folded ? 32 - count_leading_zeros(folded) : 0;
	rsb	r0, r4, #32	@ iftmp.13_143, _142,
@ matrix_optimized.c:639:             if (step_bits > peak_bits) {
	cmp	r2, r0	@ peak_bits, iftmp.13_143
	bge	.L39		@,
@ matrix_optimized.c:641:                 matrix_peak_magnitude_bits = step_bits;
	ldr	r4, .L76+12	@ tmp424,
@ matrix_optimized.c:640:                 peak_bits                  = step_bits;
	str	r0, [sp, #8]	@ iftmp.13_143, %sfp
@ matrix_optimized.c:641:                 matrix_peak_magnitude_bits = step_bits;
.LPIC6:
	add	r4, pc	@ tmp424
	str	r0, [r4]	@ iftmp.13_143, matrix_peak_magnitude_bits
.L39:
@ matrix_optimized.c:644:             if (step_bits > MATRIX_MAGNITUDE_BITS) {
	cmp	r0, #15	@ iftmp.13_143,
	ble	.L34		@,
.L40:
@ matrix_optimized.c:531:                 return MATRIX_OVERFLOW;
	mov	r0, #-1	@ <retval>,
@ matrix_optimized.c:656: }
	add	sp, sp, #340	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L34:
@ matrix_optimized.c:448:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	ldr	r2, [sp, #4]	@ ivtmp.143, %sfp
	cmp	r9, #8	@ row,
	add	r1, r1, #1	@ ivtmp.136, ivtmp.136,
	add	r10, r10, #34	@ ivtmp.141, ivtmp.141,
	add	r2, r2, #2	@ ivtmp.143, ivtmp.143,
	add	lr, lr, #32	@ ivtmp.144, ivtmp.144,
	str	r2, [sp, #4]	@ ivtmp.143, %sfp
	bne	.L48		@,
	ldr	r4, [sp, #16]	@ inverse, %sfp
	adds	r3, r3, #16	@ ivtmp.94, ivtmp.155_451,
	add	r2, r4, #128	@ _138, ivtmp.96,
.L42:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]	@ _130, MEM[(const short int[8] *)_41]
@ matrix_optimized.c:651:     for (row = 0; row < N; row++) {
	adds	r3, r3, #32	@ ivtmp.94, ivtmp.94,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r4]!	@ _130, MEM[(short int[8] *)_40]
@ matrix_optimized.c:651:     for (row = 0; row < N; row++) {
	cmp	r4, r2	@ ivtmp.96, _138
	bne	.L42		@,
@ matrix_optimized.c:655:     return MATRIX_SUCCESS;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:656: }
	add	sp, sp, #340	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L48:
	mov	ip, r9	@ pivot_column, row
	b	.L41		@
.L43:
@ matrix_optimized.c:456:         pivot_row     = pivot_column;
	movs	r7, #7	@ pivot_row,
	b	.L10		@
.L24:
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #2	@ column, column,
@ matrix_optimized.c:519:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r5, r5, #4	@ ivtmp.128, ivtmp.128,
	b	.L20		@
.L77:
	.align	2
.L76:
	.word	.LANCHOR1-(.LPIC1+4)
	.word	.LANCHOR0-(.LPIC3+4)
	.word	.LANCHOR1-(.LPIC4+4)
	.word	.LANCHOR1-(.LPIC6+4)
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
@ matrix_optimized.c:80:         return (product + (1 << (FRACTION_BITS - 1)))
	vmov.i32	q12, #2048  @ v4si	@ tmp163,
@ matrix_optimized.c:668: {
	push	{r4, r5, lr}	@
@ matrix_optimized.c:668: {
	mov	r4, r0	@ first, tmp181
	sub	ip, r0, #2	@ ivtmp.209, first,
	mov	r5, r1	@ second, tmp182
	mov	lr, r2	@ ivtmp.207, tmp183
	adds	r4, r4, #126	@ _31, first,
	add	r0, r1, #128	@ _46, second,
.L80:
	vmov.i32	q13, #0  @ v4si	@ vect_sum_46.168,
	mov	r3, r5	@ ivtmp.196, second
	mov	r2, ip	@ ivtmp.200, ivtmp.209
	vmov	q14, q13  @ v4si	@ vect_sum_26.185, vect_sum_46.168
.L79:
@ matrix_optimized.c:685:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r1, [r2, #2]!	@ _6, MEM[(const int16_t *)_58]
@ matrix_optimized.c:685:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vld1.16	{q10}, [r3]!	@ tmp161, MEM <const vector(8) short int> [(short int *)vectp_second.169_122]
@ matrix_optimized.c:685:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vdup.16	q8, r1	@ tmp159, _6
@ matrix_optimized.c:684:             for (k = 0; k < N; k++) {
	cmp	r0, r3	@ _46, ivtmp.196
	vmull.s16 q9, d16, d20	@ vect_patt_113.172, tmp159, tmp161
	vmull.s16 q8, d17, d21	@ vect_patt_113.172, tmp159, tmp161
@ matrix_optimized.c:88:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q11, q12, q9	@ vect__82.178_141, tmp163, vect_patt_113.172
	vsub.i32	q10, q12, q8	@ vect__82.178_142, tmp163, vect_patt_113.172
@ matrix_optimized.c:80:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q3, q9, q12	@ vect__80.174_130, vect_patt_113.172, tmp163
	vadd.i32	q15, q8, q12	@ vect__80.174_131, vect_patt_113.172, tmp163
@ matrix_optimized.c:88:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q11, q11, #12	@ vect__33.180_146, vect__82.178_141,
	vshr.s32	q10, q10, #12	@ vect__33.180_147, vect__82.178_142,
	vcge.s32	q9, q9, #0	@ tmp169, vect_patt_113.172
	vcge.s32	q8, q8, #0	@ tmp177, vect_patt_113.172
@ matrix_optimized.c:81:             >> FRACTION_BITS;
	vshr.s32	q3, q3, #12	@ vect__31.176_135, vect__80.174_130,
	vshr.s32	q15, q15, #12	@ vect__31.176_136, vect__80.174_131,
@ matrix_optimized.c:88:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q11, q11	@ vect__84.182_150, vect__33.180_146
	vneg.s32	q10, q10	@ vect__84.182_151, vect__33.180_147
	vbsl	q9, q3, q11	@ vect__35.184, vect__31.176_135, vect__84.182_150
	vbsl	q8, q15, q10	@ vect__35.184, vect__31.176_136, vect__84.182_151
@ matrix_optimized.c:685:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q14, q14, q9	@ vect_sum_26.185, vect_sum_26.185, vect__35.184
	vadd.i32	q13, q13, q8	@ vect_sum_46.168, vect_sum_46.168, vect__35.184
@ matrix_optimized.c:684:             for (k = 0; k < N; k++) {
	bne	.L79		@,
@ matrix_optimized.c:688:             result[row][column] = sum;
	mov	r3, lr	@ tmp178, ivtmp.207
@ matrix_optimized.c:676:     for (row = 0; row < N; row++) {
	add	ip, ip, #16	@ ivtmp.209, ivtmp.209,
	cmp	ip, r4	@ ivtmp.209, _31
	add	lr, lr, #32	@ ivtmp.207, ivtmp.207,
@ matrix_optimized.c:688:             result[row][column] = sum;
	vst1.32	{q14}, [r3]!	@ vect_sum_26.185, MEM <vector(4) int> [(int *)vectp.188_160]
	vst1.32	{q13}, [r3]	@ vect_sum_46.168, MEM <vector(4) int> [(int *)vectp.187_166]
@ matrix_optimized.c:676:     for (row = 0; row < N; row++) {
	bne	.L80		@,
@ matrix_optimized.c:691: }
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
@ matrix_optimized.c:701: {
	mov	r2, r0	@ tmp134, matrix
@ matrix_optimized.c:705:     int32_t maximum_row_sum = 0;
	movs	r0, #0	@ <retval>,
	add	r1, r2, #128	@ _43, ivtmp.222,
.L85:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r2]!	@ _22, MEM[(const short int[8] *)_3]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q9, d16	@ _20, _22
	vmovl.s16	q8, d17	@ _17, _22
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q9, q9	@ _19, _20
	vabs.s32	q8, q8	@ _16, _17
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q8, q8, q9	@ _15, _16, _19
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d7, d16, d17	@ _12, _15, _15
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d7, d7, d7	@ _9, _12, _12
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r3, s14	@ int	@ _10, _9
@ matrix_optimized.c:719:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ <retval>, _10
	it	lt
	movlt	r0, r3	@ <retval>, _10
@ matrix_optimized.c:707:     for (row = 0; row < N; row++) {
	cmp	r2, r1	@ ivtmp.222, _43
	bne	.L85		@,
@ matrix_optimized.c:725: }
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
@ matrix_optimized.c:735:     if (first < 0 || second < 0) {
	orrs	r3, r0, r1	@ tmp132, first, second
	bmi	.L91		@,
@ matrix_optimized.c:739:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r0, .L89	@ first,
@ matrix_optimized.c:739:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	sdiv	r3, r3, r0	@ _12, tmp125, first
@ matrix_optimized.c:739:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r1, r3	@ second, _12
	bgt	.L91		@,
.L89:
@ matrix_optimized.c:743:     product = first * second;
	mul	r3, r1, r0	@ product_13, second, first
@ matrix_optimized.c:748:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:746:     *result = product >> FRACTION_BITS;
	asrs	r3, r3, #12	@ _14, product_13,
@ matrix_optimized.c:746:     *result = product >> FRACTION_BITS;
	str	r3, [r2]	@ _14, *result_9(D)
@ matrix_optimized.c:748:     return 1;
	bx	lr	@
.L91:
@ matrix_optimized.c:736:         return 0;                              /* contract violation */
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:749: }
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
	push	{r4, r5, r6, lr}	@
@ matrix_optimized.c:758: {
	mov	r5, r1	@ inverse, tmp131
	mov	r6, r2	@ condition_number, tmp132
@ matrix_optimized.c:759:     int32_t matrix_norm  = matrix_infinity_norm(matrix);
	bl	matrix_infinity_norm(PLT)	@
	mov	r4, r0	@ tmp133,
@ matrix_optimized.c:760:     int32_t inverse_norm = matrix_infinity_norm(inverse);
	mov	r0, r5	@, inverse
	bl	matrix_infinity_norm(PLT)	@
@ matrix_optimized.c:735:     if (first < 0 || second < 0) {
	orrs	r3, r4, r0	@ tmp135, matrix_norm, inverse_norm
	bmi	.L99		@,
@ matrix_optimized.c:739:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r4, .L97	@ matrix_norm,
@ matrix_optimized.c:739:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp127,
	sdiv	r3, r3, r4	@ _16, tmp127, matrix_norm
@ matrix_optimized.c:739:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r0, r3	@ inverse_norm, _16
	bgt	.L99		@,
.L97:
@ matrix_optimized.c:743:     product = first * second;
	mul	r4, r0, r4	@ product_17, inverse_norm, matrix_norm
@ matrix_optimized.c:748:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:746:     *result = product >> FRACTION_BITS;
	asrs	r4, r4, #12	@ _18, product_17,
@ matrix_optimized.c:746:     *result = product >> FRACTION_BITS;
	str	r4, [r6]	@ _18, *condition_number_8(D)
@ matrix_optimized.c:764: }
	pop	{r4, r5, r6, pc}	@
.L99:
@ matrix_optimized.c:736:         return 0;                              /* contract violation */
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:764: }
	pop	{r4, r5, r6, pc}	@
	.size	calculate_condition_number, .-calculate_condition_number
	.global	matrix_predicted_bits
	.global	matrix_peak_magnitude_bits
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
	.type	identity_q12, %object
	.size	identity_q12, 128
identity_q12:
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4096
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	matrix_peak_magnitude_bits, %object
	.size	matrix_peak_magnitude_bits, 4
matrix_peak_magnitude_bits:
	.space	4
	.type	matrix_predicted_bits, %object
	.size	matrix_predicted_bits, 4
matrix_predicted_bits:
	.space	4
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
