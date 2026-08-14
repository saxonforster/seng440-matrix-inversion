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
	.file	"with_register_spill.c"
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
	ldr	r3, .L5	@ ivtmp.71,
	add	r2, r0, #128	@ _23, ivtmp.72,
.LPIC0:
	add	r3, pc	@ ivtmp.71
.L2:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]!	@ _10, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r0]!	@ _10, MEM[(short int[8] *)_3]
@ with_register_spill.c:189:     for (row = 0; row < N; row++) {
	cmp	r0, r2	@ ivtmp.72, _23
	bne	.L2		@,
@ with_register_spill.c:192: }
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
@ with_register_spill.c:198:     int16x8_t first  = vld1q_s16(matrix[row1]);   /* read both rows before */
	add	r1, r0, r1, lsl #4	@ _3, matrix, tmp128,
@ with_register_spill.c:199:     int16x8_t second = vld1q_s16(matrix[row2]);   /* either store lands */
	add	r0, r0, r2, lsl #4	@ _6, matrix, tmp129,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1]	@ _12, MEM[(const short int[8] *)_3]
	vld1.16	{d18-d19}, [r0]	@ _11, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r1]	@ _11, MEM[(short int[8] *)_3]
	vst1.16	{d16-d17}, [r0]	@ _12, MEM[(short int[8] *)_6]
@ with_register_spill.c:203: }
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
	mov	r5, r1	@ inverse, tmp443
	vpush.64	{d8, d9, d10, d11, d12, d13, d14, d15}	@
@ with_register_spill.c:435:     matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
	ldr	r2, .L76	@ tmp334,
@ with_register_spill.c:384: {
	sub	sp, sp, #340	@,,
	ldr	r4, .L76+4	@ ivtmp.157,
@ with_register_spill.c:384: {
	add	r3, sp, #87	@ tmp327,,
	bic	r3, r3, #15	@ ivtmp.156_455, tmp327,
	add	r6, r0, #128	@ _461, ivtmp.155,
@ with_register_spill.c:435:     matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
.LPIC1:
	add	r2, pc	@ tmp334
	mov	ip, r3	@ ivtmp.142, ivtmp.156_455
.LPIC3:
	add	r4, pc	@ ivtmp.157
@ with_register_spill.c:436:     matrix_predicted_bits = MATRIX_INPUT_BITS;
	mov	r1, r3	@ ivtmp.156, ivtmp.156_455
@ with_register_spill.c:435:     matrix_peak_magnitude_bits = MATRIX_INPUT_BITS;
	movs	r7, #13	@ tmp335,
@ with_register_spill.c:436:     matrix_predicted_bits = MATRIX_INPUT_BITS;
	strd	r7, r7, [r2]	@ tmp335, tmp335, tmp334
.L9:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r0]!	@ _93, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r2, r1	@ tmp341, ivtmp.156
@ with_register_spill.c:443:     for (row = 0; row < N; row++) {
	adds	r1, r1, #32	@ ivtmp.156, ivtmp.156,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r4:128]!	@ _99, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r2:128]!	@ _93, MEM[(short int[8] *)_1]
@ with_register_spill.c:443:     for (row = 0; row < N; row++) {
	cmp	r0, r6	@ ivtmp.155, _461
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r2:128]	@ _99, MEM[(short int[8] *)_5]
@ with_register_spill.c:443:     for (row = 0; row < N; row++) {
	bne	.L9		@,
@ with_register_spill.c:490:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	ldr	fp, .L76+8	@ tmp434,
	movs	r1, #0	@ ivtmp.137,
	str	r3, [sp]	@ ivtmp.144, %sfp
	mov	lr, r3	@ ivtmp.145, ivtmp.156_455
.LPIC4:
	add	fp, pc	@ tmp434
@ with_register_spill.c:449:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	mov	r9, r1	@ pivot_column, ivtmp.137
	str	r5, [sp, #12]	@ inverse, %sfp
@ with_register_spill.c:434:     peak_bits = MATRIX_INPUT_BITS;
	movs	r0, #13	@ peak_bits,
	str	r0, [sp, #4]	@ peak_bits, %sfp
.L41:
@ with_register_spill.c:458:         largest_value = fixed_absolute(augmented[pivot_column][pivot_column]);
	ldrsh	r0, [ip]	@ _7, MEM[(short int *)_442]
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r9, #7	@ pivot_column,
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	add	r10, r9, #1	@ row, pivot_column,
@ with_register_spill.c:48:     int32_t sign_mask     = widened_value >> 31; /* 0 if >= 0, all ones if < 0 */
	asr	r4, r0, #31	@ sign_mask, _7,
@ with_register_spill.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r6, r0, r4	@ _136, _7, sign_mask
@ with_register_spill.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r6, r6, r4	@ largest_value, _136, sign_mask
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L43		@,
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	ldr	r4, [sp]	@ ivtmp.144, %sfp
@ with_register_spill.c:457:         pivot_row     = pivot_column;
	mov	r7, r9	@ pivot_row, pivot_column
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	mov	r5, r10	@ row, row
.L12:
@ with_register_spill.c:461:             current_value = fixed_absolute(augmented[row][pivot_column]);
	lsls	r2, r5, #5	@ _430, row,
@ with_register_spill.c:47:     int32_t widened_value = value;              /* sign-extend to 32 bits */
	ldrsh	r2, [r4, r2]	@ widened_value, MEM[(short int *)_428 + _430 * 1]
@ with_register_spill.c:48:     int32_t sign_mask     = widened_value >> 31; /* 0 if >= 0, all ones if < 0 */
	asr	r8, r2, #31	@ sign_mask, widened_value,
@ with_register_spill.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r2, r8, r2	@ _32, sign_mask, widened_value
@ with_register_spill.c:51:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r2, r2, r8	@ _30, _32, sign_mask
@ with_register_spill.c:465:                 pivot_row     = row;
	cmp	r2, r6	@ _30, largest_value
	it	gt
	movgt	r7, r5	@ pivot_row, row
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	add	r5, r5, #1	@ row, row,
@ with_register_spill.c:465:                 pivot_row     = row;
	it	gt
	movgt	r6, r2	@ largest_value, _30
@ with_register_spill.c:460:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r5, #8	@ row,
	bne	.L12		@,
.L10:
@ with_register_spill.c:470:         if (largest_value == 0) {
	cbz	r6, .L19	@ largest_value,
@ with_register_spill.c:366:     return __builtin_clz(value);   // one CLZ on Cortex-A7
	clz	r6, r6	@ _142, largest_value
@ with_register_spill.c:490:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	ldr	r5, [sp, #4]	@ _10, %sfp
@ with_register_spill.c:484:         growth_bits = count_leading_zeros((uint32_t)largest_value) - 19;
	subs	r6, r6, #19	@ growth_bits_87, _142,
@ with_register_spill.c:490:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	ldr	r4, [fp, #4]	@ matrix_predicted_bits, matrix_predicted_bits
@ with_register_spill.c:490:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	cmp	r6, #0	@ growth_bits_87,
	it	ge		@
	addge	r5, r5, r6	@,, _10, _10, growth_bits_87
@ with_register_spill.c:490:         if (peak_bits + growth_bits > matrix_predicted_bits) {
	cmp	r5, r4	@ _10, matrix_predicted_bits
@ with_register_spill.c:491:             matrix_predicted_bits = peak_bits + growth_bits;
	it	gt
	strgt	r5, [fp, #4]	@ _10, matrix_predicted_bits
@ with_register_spill.c:499:         if (pivot_row != pivot_column) {
	cmp	r7, r1	@ pivot_row, ivtmp.137
	beq	.L16		@,
	lsls	r7, r7, #5	@ _368, pivot_row,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r0, lr	@ _15, ivtmp.145
@ with_register_spill.c:501:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r4, r7, #16	@ _76, _368,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d22-d23}, [r0:128]!	@ _115, MEM[(const short int[8] *)_14]
@ with_register_spill.c:500:             int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
	add	r7, r7, r3	@ _12, ivtmp.156_455
@ with_register_spill.c:501:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r4, r4, r3	@ _13, ivtmp.156_455
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d20-d21}, [r0:128]	@ _91, MEM[(const short int[8] *)_15]
	vld1.16	{d18-d19}, [r7:128]	@ _118, MEM[(const short int[8] *)_12]
	vld1.16	{d16-d17}, [r4:128]	@ _86, MEM[(const short int[8] *)_13]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d22-d23}, [r7:128]	@ _115, MEM[(short int[8] *)_12]
	vst1.16	{d20-d21}, [r4:128]	@ _91, MEM[(short int[8] *)_13]
	vst1.16	{d18-d19}, [lr:128]	@ _118, MEM[(short int[8] *)_14]
	vst1.16	{d16-d17}, [r0:128]	@ _86, MEM[(short int[8] *)_15]
@ with_register_spill.c:518:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r0, [ip]	@ _7, MEM[(short int *)_442]
.L16:
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	movs	r4, #1	@ column,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	add	r5, lr, #2	@ ivtmp.129, ivtmp.145,
@ with_register_spill.c:522:             if (column == pivot_column) {
	cmp	r1, #0	@ ivtmp.137
	beq	.L18	@
	mov	r5, lr	@ ivtmp.129, ivtmp.145
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	movs	r4, #0	@ column,
.L17:
@ with_register_spill.c:106:     if (denominator == 0) {
	cbnz	r0, .L74	@ _7,
.L19:
@ with_register_spill.c:471:             return MATRIX_SINGULAR;
	movs	r0, #0	@ <retval>,
@ with_register_spill.c:658: }
	add	sp, sp, #340	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L74:
@ with_register_spill.c:147:     denominator_mask = denominator_32 >> 31;
	asr	r8, r0, #31	@ denominator_mask, _7,
@ with_register_spill.c:149:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r6, r0, r8	@ _194, _7, denominator_mask
@ with_register_spill.c:149:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	sub	r6, r6, r8	@ _195, _194, denominator_mask
@ with_register_spill.c:148:     half_denominator =
	asrs	r2, r6, #1	@ half_denominator_196, _195,
	str	r2, [sp, #8]	@ half_denominator_196, %sfp
.L20:
@ with_register_spill.c:526:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r5]	@ _17, MEM[(short int *)_425]
@ with_register_spill.c:115:     if (numerator == 0) {
	cbz	r6, .L21	@ _17,
@ with_register_spill.c:120:     if (denominator == FIXED_ONE) {     /* x / 1.0 */
	cmp	r0, #4096	@ _7,
	beq	.L25		@,
@ with_register_spill.c:125:     if (denominator == -FIXED_ONE) {    /* x / -1.0 */
	cmn	r0, #4096	@ _7,
@ with_register_spill.c:158:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	itett	ne
	eorne	r7, r8, r6, asr #31	@ quotient_sign_mask, denominator_mask, _17,
@ with_register_spill.c:126:         *result = -(int32_t)numerator;
	rsbeq	r2, r6, #0	@ division_result, _17
@ with_register_spill.c:160:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	ldrne	r2, [sp, #8]	@ half_denominator_196, %sfp
	eorne	r2, r2, r7	@ _199, half_denominator_196, quotient_sign_mask
@ with_register_spill.c:159:     rounding_term =
	ittt	ne
	subne	r2, r2, r7	@ rounding_term_200, _199, quotient_sign_mask
@ with_register_spill.c:162:     *result = (scaled_numerator + rounding_term) / denominator_32;
	addne	r2, r2, r6, lsl #12	@ _201, rounding_term_200, _17,
@ with_register_spill.c:162:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdivne	r2, r2, r0	@ division_result, _201, _7
@ with_register_spill.c:57:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r6, r2, #32768	@ _144, division_result,
@ with_register_spill.c:57:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r6, #65536	@ _144,
	bcs	.L40		@,
@ with_register_spill.c:535:             augmented[pivot_column][column] = (int16_t)division_result;
	sxth	r6, r2	@ _17, division_result
.L21:
@ with_register_spill.c:535:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r6, [r5], #2	@ movhi	@ _17, MEM[(short int *)_59]
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #1	@ column, column,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r4, #16	@ column,
	beq	.L23		@,
@ with_register_spill.c:522:             if (column == pivot_column) {
	cmp	r4, r1	@ column, ivtmp.137
	bne	.L20		@,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r5, r5, #2	@ ivtmp.129, ivtmp.129,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r1, #1	@ column, ivtmp.137,
.L18:
@ with_register_spill.c:522:             if (column == pivot_column) {
	cmp	r4, r1	@ column, ivtmp.137
	bne	.L17		@,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r5, r5, #2	@ ivtmp.129, ivtmp.129,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r1, #1	@ column, ivtmp.137,
	b	.L18		@
.L75:
@ with_register_spill.c:522:             if (column == pivot_column) {
	cmp	r2, r1	@ column, ivtmp.137
	beq	.L24		@,
@ with_register_spill.c:526:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r5, #2]!	@ _17, MEM[(short int *)_399]
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	mov	r4, r2	@ column, column
@ with_register_spill.c:115:     if (numerator == 0) {
	cmp	r6, #0	@ _17
	beq	.L21	@
.L25:
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r4, #15	@ column,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	add	r2, r4, #1	@ column, column,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	bne	.L75		@,
.L23:
@ with_register_spill.c:562:             target_factor[target_count] = factor;
	ldr	r5, [sp]	@ ivtmp.144, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r0, lr	@ tmp366, ivtmp.145
@ with_register_spill.c:539:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	mov	r4, #4096	@ tmp365,
@ with_register_spill.c:561:             target_row[target_count]    = row;
	add	r7, sp, #44	@ tmp428,,
@ with_register_spill.c:539:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	strh	r4, [ip]	@ movhi	@ tmp365, MEM[(short int *)_442]
@ with_register_spill.c:562:             target_factor[target_count] = factor;
	add	r6, sp, #28	@ tmp429,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d30-d31}, [r0:128]!	@ _128, MEM[(const short int[8] *)_21]
	vld1.16	{d28-d29}, [r0:128]	@ _84, MEM[(const short int[8] *)_22]
@ with_register_spill.c:554:         for (row = 0; row < N; row++) {
	movs	r0, #0	@ row,
@ with_register_spill.c:552:         target_count = 0;
	mov	r4, r0	@ target_count, row
.L32:
@ with_register_spill.c:555:             int16_t factor = augmented[row][pivot_column];
	lsls	r2, r0, #5	@ _71, row,
	ldrsh	r2, [r5, r2]	@ factor, MEM[(short int *)_34 + _71 * 1]
@ with_register_spill.c:557:             if (row == pivot_column || factor == 0) {
	cmp	r2, #0	@ factor,
	it	ne		@
	cmpne	r0, r1	@, row, ivtmp.137
@ with_register_spill.c:561:             target_row[target_count]    = row;
	it	ne
	strne	r0, [r7, r4, lsl #2]	@ row, target_row[target_count_125]
@ with_register_spill.c:554:         for (row = 0; row < N; row++) {
	add	r0, r0, #1	@ row, row,
@ with_register_spill.c:562:             target_factor[target_count] = factor;
	itt	ne
	strhne	r2, [r6, r4, lsl #1]	@ movhi	@ factor, target_factor[target_count_125]
@ with_register_spill.c:563:             target_count++;
	addne	r4, r4, #1	@ target_count, target_count,
@ with_register_spill.c:554:         for (row = 0; row < N; row++) {
	cmp	r0, #8	@ row,
	bne	.L32		@,
@ with_register_spill.c:569:         if (target_count > 0) {
	cmp	r4, #0	@ target_count
	beq	.L34	@
@ with_register_spill.c:582:             stage_pointer = &augmented[target_row[0]][0];
	ldr	r0, [sp, #44]	@ target_row[0], target_row[0]
@ with_register_spill.c:588:             for (index = 1; index < target_count; index++) {
	cmp	r4, #1	@ target_count,
@ with_register_spill.c:585:             stage_factor  = target_factor[0];
	ldrsh	r8, [sp, #28]	@ next_factor, target_factor[0]
@ with_register_spill.c:582:             stage_pointer = &augmented[target_row[0]][0];
	add	r2, sp, #44	@ ivtmp.103,,
@ with_register_spill.c:582:             stage_pointer = &augmented[target_row[0]][0];
	add	r0, r3, r0, lsl #5	@ next_pointer, ivtmp.156_455, target_row[0],
@ with_register_spill.c:585:             stage_factor  = target_factor[0];
	add	r5, sp, #28	@ tmp389,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r6, r0	@ _29, next_pointer
@ with_register_spill.c:588:             for (index = 1; index < target_count; index++) {
	vmov.i32	q4, #0  @ v4si	@ _410,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d26-d27}, [r6:128]!	@ _132, MEM[(const short int[8] *)stage_pointer_95]
	vld1.16	{d18-d19}, [r6:128]	@ stage_high, MEM[(const short int[8] *)_27]
@ with_register_spill.c:588:             for (index = 1; index < target_count; index++) {
	beq	.L35		@,
@ with_register_spill.c:567:         overflow_b = vdupq_n_s32(0);   /* fresh accumulator for this step */
	vmov.i32	q5, #0  @ v4si	@ overflow_b,
	add	r5, r5, r4, lsl #1	@ _20, tmp389, target_count,
	add	r7, sp, #30	@ ivtmp.114,,
	str	r9, [sp, #8]	@ pivot_column, %sfp
	mov	r9, r2	@ ivtmp.109, ivtmp.109
@ with_register_spill.c:566:         overflow_a = vdupq_n_s32(0);   /* fresh accumulator for this step */
	vmov	q4, q5  @ v4si	@ overflow_a, overflow_b
	strd	r4, r10, [sp, #16]	@ target_count, row,,
	mov	r10, r5	@ _20, _20
.L36:
@ with_register_spill.c:591:                 next_pointer = &augmented[target_row[index]][0];
	ldr	r6, [r9, #4]!	@ MEM[(int *)_89], MEM[(int *)_89]
	mov	r5, r8	@ stage_factor, next_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q11, d26, #12	@ _225, stage_low,
	vshll.s16	q10, d27, #12	@ _227, stage_low,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d7[0], r5	@ tmp395,, stage_factor
	vmov.16	d6[0], r5	@ tmp396,, stage_factor
	vmlsl.s16	q11, d30, d7[0]	@ _229, _128, tmp395,
	vmov.16	d5[0], r5	@ tmp400,, stage_factor
	vmlsl.s16	q10, d31, d6[0]	@ _231, _128, tmp396,
	vmov.16	d4[0], r5	@ tmp401,, stage_factor
@ with_register_spill.c:594:                 next_factor  = target_factor[index];
	ldrsh	r8, [r7], #2	@ next_factor, MEM[(short int *)_414]
	mov	r4, r0	@ stage_pointer, next_pointer
@ with_register_spill.c:591:                 next_pointer = &augmented[target_row[index]][0];
	add	r0, r3, r6, lsl #5	@ next_pointer, ivtmp.156_455, MEM[(int *)_89],
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q11, q11, #12	@ _232, _229,
@ with_register_spill.c:588:             for (index = 1; index < target_count; index++) {
	cmp	r10, r7	@ _20, ivtmp.114
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r6, r0	@ _29, next_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q10, q10, #12	@ _233, _231,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d17, q11	@ _241, _232
	vmovn.i32	d12, q10	@ _242, _233
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q7, q11, #31	@ _235, _232,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d13, d12  @ v4hi	@ _243, _242
	vmov	d12, d17  @ v4hi	@ _243, _241
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _205, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q11, q11, q7	@ _236, _232, _235
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q8, d28, d5[0]	@ _209, _84, tmp400,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q9, d19, #12	@ _207, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q7, q10, #31	@ _237, _233,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q9, d29, d4[0]	@ _211, _84, tmp401,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d26-d27}, [r6:128]!	@ _132, MEM[(const short int[8] *)next_pointer_103]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q10, q10, q7	@ _238, _233, _237
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _212, _209,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q10, q11, q10	@ _239, _236, _238
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q9, q9, #12	@ _213, _211,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q4, q4, q10	@ overflow_a, overflow_a, _239
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q8, #31	@ _215, _212,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d25, q8	@ _221, _212
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q8, q8, q10	@ _216, _212, _215
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q9, #31	@ _217, _213,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d24, q9	@ _222, _213
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q10	@ _218, _213, _217
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vswp	d24, d25	@ _223, _221
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q9	@ _219, _216, _218
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r6:128]	@ stage_high, MEM[(const short int[8] *)_29]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d12-d13}, [r4]!	@ _243, MEM[(short int[8] *)stage_pointer_435]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q5, q5, q8	@ overflow_b, overflow_b, _219
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [r4:128]	@ _223, MEM[(short int[8] *)_31]
@ with_register_spill.c:588:             for (index = 1; index < target_count; index++) {
	bne	.L36		@,
	vorr	q4, q5, q4	@ _410, overflow_b, overflow_a
	ldr	r9, [sp, #8]	@ pivot_column, %sfp
	ldrd	r4, r10, [sp, #16]	@ target_count, row,,
.L35:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q11, d26, #12	@ _265, _132,
	vshll.s16	q10, d27, #12	@ _267, _132,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d3[0], r8	@ tmp406,, next_factor
	vmov.16	d2[0], r8	@ tmp407,, next_factor
	vmlsl.s16	q11, d30, d3[0]	@ _269, _128, tmp406,
	vmov.16	d1[0], r8	@ tmp408,, next_factor
	vmlsl.s16	q10, d31, d2[0]	@ _271, _128, tmp407,
	vmov.16	d0[0], r8	@ tmp409,, next_factor
	add	r4, r2, r4, lsl #2	@ _376, ivtmp.103, target_count,
	mov	r5, r2	@ ivtmp.103, ivtmp.103
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q11, q11, #12	@ _272, _269,
	vrshr.s32	q10, q10, #12	@ _273, _271,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q15, q11, #31	@ _275, _272,
	vshr.s32	q12, q10, #31	@ _277, _273,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d17, q11	@ _281, _272
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q13, q10, q12	@ _278, _273, _277
	veor	q15, q11, q15	@ _276, _272, _275
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q12, d19, #12	@ _247, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d22, q10	@ _282, _273
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q10, d18, #12	@ _245, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q12, d29, d0[0]	@ _251, _84, tmp409,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d23, d22  @ v4hi	@ _283, _282
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q10, d28, d1[0]	@ _249, _84, tmp408,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d22, d17  @ v4hi	@ _283, _281
	vorr	q8, q15, q13	@ _33, _276, _278
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d22-d23}, [r0:128]	@ _283, MEM[(short int[8] *)stage_pointer_320]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q9, q10, #12	@ _252, _249,
	vrshr.s32	q10, q12, #12	@ _253, _251,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q9, #31	@ _255, _252,
	vshr.s32	q12, q10, #31	@ _257, _253,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d22, q9	@ _261, _252
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q12, q10, q12	@ _258, _253, _257
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d20, q10	@ _262, _253
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q13	@ _256, _252, _255
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d23, d20  @ v4hi	@ _263, _262
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d22-d23}, [r6:128]	@ _263, MEM[(short int[8] *)prephitmp_409]
@ with_register_spill.c:631:                 augmented[target_row[index]][pivot_column] = 0;
	movs	r6, #0	@ tmp416,
.L37:
@ with_register_spill.c:631:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r2, [r5], #4	@ _36, MEM[(int *)_119]
@ with_register_spill.c:631:                 augmented[target_row[index]][pivot_column] = 0;
	add	r2, r9, r2, lsl #4	@ tmp414, pivot_column, _36,
@ with_register_spill.c:630:             for (index = 0; index < target_count; index++) {
	cmp	r5, r4	@ ivtmp.103, _376
@ with_register_spill.c:631:                 augmented[target_row[index]][pivot_column] = 0;
	strh	r6, [r3, r2, lsl #1]	@ movhi	@ tmp416, augmented[_36][pivot_column_176]
@ with_register_spill.c:630:             for (index = 0; index < target_count; index++) {
	bne	.L37		@,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q4	@ _379, _33, _410
	vorr	q8, q8, q9	@ _106, _379, _256
	vorr	q8, q8, q12	@ _147, _106, _258
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15289:   return __a | __b;
	vorr	d16, d17, d16	@ _152, _147, _147
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3924:   return (uint32x2_t)__builtin_neon_vpmaxuv2si ((int32x2_t) __a, (int32x2_t) __b);
	vpmax.u32	d16, d16, d16	@ _154, _152, _152
	vmov	r4, r5, d16  @ v2si	@ _154, _154
@ with_register_spill.c:373:     return folded ? 32 - count_leading_zeros(folded) : 0;
	cmp	r4, #0	@ _155
	beq	.L34		@,
@ with_register_spill.c:366:     return __builtin_clz(value);   // one CLZ on Cortex-A7
	clz	r4, r4	@ _145, _155
@ with_register_spill.c:641:             if (step_bits > peak_bits) {
	ldr	r2, [sp, #4]	@ peak_bits, %sfp
@ with_register_spill.c:373:     return folded ? 32 - count_leading_zeros(folded) : 0;
	rsb	r0, r4, #32	@ iftmp.14_146, _145,
@ with_register_spill.c:641:             if (step_bits > peak_bits) {
	cmp	r0, r2	@ iftmp.14_146, peak_bits
	ble	.L39		@,
@ with_register_spill.c:643:                 matrix_peak_magnitude_bits = step_bits;
	ldr	r4, .L76+12	@ tmp421,
@ with_register_spill.c:642:                 peak_bits                  = step_bits;
	str	r0, [sp, #4]	@ iftmp.14_146, %sfp
@ with_register_spill.c:643:                 matrix_peak_magnitude_bits = step_bits;
.LPIC6:
	add	r4, pc	@ tmp421
	str	r0, [r4]	@ iftmp.14_146, matrix_peak_magnitude_bits
.L39:
@ with_register_spill.c:646:             if (step_bits > MATRIX_MAGNITUDE_BITS) {
	cmp	r0, #15	@ iftmp.14_146,
	ble	.L34		@,
.L40:
@ with_register_spill.c:532:                 return MATRIX_OVERFLOW;
	mov	r0, #-1	@ <retval>,
@ with_register_spill.c:658: }
	add	sp, sp, #340	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L34:
@ with_register_spill.c:449:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	ldr	r2, [sp]	@ ivtmp.144, %sfp
	cmp	r10, #8	@ row,
	add	r1, r1, #1	@ ivtmp.137, ivtmp.137,
	add	ip, ip, #34	@ ivtmp.142, ivtmp.142,
	add	r2, r2, #2	@ ivtmp.144, ivtmp.144,
	add	lr, lr, #32	@ ivtmp.145, ivtmp.145,
	str	r2, [sp]	@ ivtmp.144, %sfp
	bne	.L48		@,
	ldr	r5, [sp, #12]	@ inverse, %sfp
	adds	r3, r3, #16	@ ivtmp.95, ivtmp.156_455,
	add	r2, r5, #128	@ _141, ivtmp.97,
.L42:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]	@ _133, MEM[(const short int[8] *)_42]
@ with_register_spill.c:653:     for (row = 0; row < N; row++) {
	adds	r3, r3, #32	@ ivtmp.95, ivtmp.95,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r5]!	@ _133, MEM[(short int[8] *)_41]
@ with_register_spill.c:653:     for (row = 0; row < N; row++) {
	cmp	r5, r2	@ ivtmp.97, _141
	bne	.L42		@,
@ with_register_spill.c:657:     return MATRIX_SUCCESS;
	movs	r0, #1	@ <retval>,
@ with_register_spill.c:658: }
	add	sp, sp, #340	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L48:
	mov	r9, r10	@ pivot_column, row
	b	.L41		@
.L43:
@ with_register_spill.c:457:         pivot_row     = pivot_column;
	movs	r7, #7	@ pivot_row,
	b	.L10		@
.L24:
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #2	@ column, column,
@ with_register_spill.c:520:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r5, r5, #4	@ ivtmp.129, ivtmp.129,
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
@ with_register_spill.c:80:         return (product + (1 << (FRACTION_BITS - 1)))
	vmov.i32	q12, #2048  @ v4si	@ tmp163,
@ with_register_spill.c:670: {
	push	{r4, r5, lr}	@
@ with_register_spill.c:670: {
	mov	r4, r0	@ first, tmp181
	sub	ip, r0, #2	@ ivtmp.210, first,
	mov	r5, r1	@ second, tmp182
	mov	lr, r2	@ ivtmp.208, tmp183
	adds	r4, r4, #126	@ _31, first,
	add	r0, r1, #128	@ _46, second,
.L80:
	vmov.i32	q13, #0  @ v4si	@ vect_sum_46.169,
	mov	r3, r5	@ ivtmp.197, second
	mov	r2, ip	@ ivtmp.201, ivtmp.210
	vmov	q14, q13  @ v4si	@ vect_sum_26.186, vect_sum_46.169
.L79:
@ with_register_spill.c:687:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r1, [r2, #2]!	@ _6, MEM[(const int16_t *)_58]
@ with_register_spill.c:687:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vld1.16	{q10}, [r3]!	@ tmp161, MEM <const vector(8) short int> [(short int *)vectp_second.170_122]
@ with_register_spill.c:687:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vdup.16	q8, r1	@ tmp159, _6
@ with_register_spill.c:686:             for (k = 0; k < N; k++) {
	cmp	r0, r3	@ _46, ivtmp.197
	vmull.s16 q9, d16, d20	@ vect_patt_113.173, tmp159, tmp161
	vmull.s16 q8, d17, d21	@ vect_patt_113.173, tmp159, tmp161
@ with_register_spill.c:88:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q11, q12, q9	@ vect__82.179_141, tmp163, vect_patt_113.173
	vsub.i32	q10, q12, q8	@ vect__82.179_142, tmp163, vect_patt_113.173
@ with_register_spill.c:80:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q3, q9, q12	@ vect__80.175_130, vect_patt_113.173, tmp163
	vadd.i32	q15, q8, q12	@ vect__80.175_131, vect_patt_113.173, tmp163
@ with_register_spill.c:88:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q11, q11, #12	@ vect__33.181_146, vect__82.179_141,
	vshr.s32	q10, q10, #12	@ vect__33.181_147, vect__82.179_142,
	vcge.s32	q9, q9, #0	@ tmp169, vect_patt_113.173
	vcge.s32	q8, q8, #0	@ tmp177, vect_patt_113.173
@ with_register_spill.c:81:             >> FRACTION_BITS;
	vshr.s32	q3, q3, #12	@ vect__31.177_135, vect__80.175_130,
	vshr.s32	q15, q15, #12	@ vect__31.177_136, vect__80.175_131,
@ with_register_spill.c:88:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q11, q11	@ vect__84.183_150, vect__33.181_146
	vneg.s32	q10, q10	@ vect__84.183_151, vect__33.181_147
	vbsl	q9, q3, q11	@ vect__35.185, vect__31.177_135, vect__84.183_150
	vbsl	q8, q15, q10	@ vect__35.185, vect__31.177_136, vect__84.183_151
@ with_register_spill.c:687:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q14, q14, q9	@ vect_sum_26.186, vect_sum_26.186, vect__35.185
	vadd.i32	q13, q13, q8	@ vect_sum_46.169, vect_sum_46.169, vect__35.185
@ with_register_spill.c:686:             for (k = 0; k < N; k++) {
	bne	.L79		@,
@ with_register_spill.c:690:             result[row][column] = sum;
	mov	r3, lr	@ tmp178, ivtmp.208
@ with_register_spill.c:678:     for (row = 0; row < N; row++) {
	add	ip, ip, #16	@ ivtmp.210, ivtmp.210,
	cmp	ip, r4	@ ivtmp.210, _31
	add	lr, lr, #32	@ ivtmp.208, ivtmp.208,
@ with_register_spill.c:690:             result[row][column] = sum;
	vst1.32	{q14}, [r3]!	@ vect_sum_26.186, MEM <vector(4) int> [(int *)vectp.189_160]
	vst1.32	{q13}, [r3]	@ vect_sum_46.169, MEM <vector(4) int> [(int *)vectp.188_166]
@ with_register_spill.c:678:     for (row = 0; row < N; row++) {
	bne	.L80		@,
@ with_register_spill.c:693: }
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
@ with_register_spill.c:703: {
	mov	r2, r0	@ tmp134, matrix
@ with_register_spill.c:707:     int32_t maximum_row_sum = 0;
	movs	r0, #0	@ <retval>,
	add	r1, r2, #128	@ _43, ivtmp.223,
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
@ with_register_spill.c:721:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ <retval>, _10
	it	lt
	movlt	r0, r3	@ <retval>, _10
@ with_register_spill.c:709:     for (row = 0; row < N; row++) {
	cmp	r2, r1	@ ivtmp.223, _43
	bne	.L85		@,
@ with_register_spill.c:727: }
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
@ with_register_spill.c:737:     if (first < 0 || second < 0) {
	orrs	r3, r0, r1	@ tmp132, first, second
	bmi	.L91		@,
@ with_register_spill.c:741:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r0, .L89	@ first,
@ with_register_spill.c:741:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	sdiv	r3, r3, r0	@ _12, tmp125, first
@ with_register_spill.c:741:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r1, r3	@ second, _12
	bgt	.L91		@,
.L89:
@ with_register_spill.c:745:     product = first * second;
	mul	r3, r1, r0	@ product_13, second, first
@ with_register_spill.c:750:     return 1;
	movs	r0, #1	@ <retval>,
@ with_register_spill.c:748:     *result = product >> FRACTION_BITS;
	asrs	r3, r3, #12	@ _14, product_13,
@ with_register_spill.c:748:     *result = product >> FRACTION_BITS;
	str	r3, [r2]	@ _14, *result_9(D)
@ with_register_spill.c:750:     return 1;
	bx	lr	@
.L91:
@ with_register_spill.c:738:         return 0;                              /* contract violation */
	movs	r0, #0	@ <retval>,
@ with_register_spill.c:751: }
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
@ with_register_spill.c:760: {
	mov	r5, r1	@ inverse, tmp131
	mov	r6, r2	@ condition_number, tmp132
@ with_register_spill.c:761:     int32_t matrix_norm  = matrix_infinity_norm(matrix);
	bl	matrix_infinity_norm(PLT)	@
	mov	r4, r0	@ tmp133,
@ with_register_spill.c:762:     int32_t inverse_norm = matrix_infinity_norm(inverse);
	mov	r0, r5	@, inverse
	bl	matrix_infinity_norm(PLT)	@
@ with_register_spill.c:737:     if (first < 0 || second < 0) {
	orrs	r3, r4, r0	@ tmp135, matrix_norm, inverse_norm
	bmi	.L99		@,
@ with_register_spill.c:741:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r4, .L97	@ matrix_norm,
@ with_register_spill.c:741:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp127,
	sdiv	r3, r3, r4	@ _16, tmp127, matrix_norm
@ with_register_spill.c:741:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r0, r3	@ inverse_norm, _16
	bgt	.L99		@,
.L97:
@ with_register_spill.c:745:     product = first * second;
	mul	r4, r0, r4	@ product_17, inverse_norm, matrix_norm
@ with_register_spill.c:750:     return 1;
	movs	r0, #1	@ <retval>,
@ with_register_spill.c:748:     *result = product >> FRACTION_BITS;
	asrs	r4, r4, #12	@ _18, product_17,
@ with_register_spill.c:748:     *result = product >> FRACTION_BITS;
	str	r4, [r6]	@ _18, *condition_number_8(D)
@ with_register_spill.c:766: }
	pop	{r4, r5, r6, pc}	@
.L99:
@ with_register_spill.c:738:         return 0;                              /* contract violation */
	movs	r0, #0	@ <retval>,
@ with_register_spill.c:766: }
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
