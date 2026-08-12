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
	ldr	r3, .L5	@ ivtmp.65,
	add	r2, r0, #128	@ _23, ivtmp.66,
.LPIC0:
	add	r3, pc	@ ivtmp.65
.L2:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]!	@ _10, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r0]!	@ _10, MEM[(short int[8] *)_3]
@ matrix_optimized.c:351:     for (row = 0; row < N; row++) {
	cmp	r0, r2	@ ivtmp.66, _23
	bne	.L2		@,
@ matrix_optimized.c:354: }
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
@ matrix_optimized.c:364:     int16x8_t first  = vld1q_s16(matrix[row1]);
	add	r1, r0, r1, lsl #4	@ _3, matrix, tmp128,
@ matrix_optimized.c:365:     int16x8_t second = vld1q_s16(matrix[row2]);
	add	r0, r0, r2, lsl #4	@ _6, matrix, tmp129,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1]	@ _12, MEM[(const short int[8] *)_3]
	vld1.16	{d18-d19}, [r0]	@ _11, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r1]	@ _11, MEM[(short int[8] *)_3]
	vst1.16	{d16-d17}, [r0]	@ _12, MEM[(short int[8] *)_6]
@ matrix_optimized.c:369: }
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
	@ args = 0, pretend = 0, frame = 328
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	mov	r4, r1	@ inverse, tmp421
	vpush.64	{d8, d9, d10, d11, d12, d13}	@
	ldr	r5, .L76	@ ivtmp.151,
	sub	sp, sp, #332	@,,
@ matrix_optimized.c:526: {
	add	r3, sp, #79	@ tmp318,,
	add	r6, r0, #128	@ _439, ivtmp.149,
	bic	r3, r3, #15	@ ivtmp.150_433, tmp318,
.LPIC1:
	add	r5, pc	@ ivtmp.151
	mov	fp, r3	@ ivtmp.136, ivtmp.150_433
	str	r3, [sp, #4]	@ ivtmp.150_433, %sfp
	mov	r1, r3	@ ivtmp.150, ivtmp.150_433
.L9:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r0]!	@ _96, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r3, r1	@ tmp326, ivtmp.150
@ matrix_optimized.c:579:     for (row = 0; row < N; row++) {
	adds	r1, r1, #32	@ ivtmp.150, ivtmp.150,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r5:128]!	@ _77, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r3:128]!	@ _96, MEM[(short int[8] *)_1]
@ matrix_optimized.c:579:     for (row = 0; row < N; row++) {
	cmp	r0, r6	@ ivtmp.149, _439
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r3:128]	@ _77, MEM[(short int[8] *)_5]
@ matrix_optimized.c:579:     for (row = 0; row < N; row++) {
	bne	.L9		@,
	ldr	r10, [sp, #4]	@ ivtmp.150_433, %sfp
	movs	r1, #0	@ ivtmp.131,
@ matrix_optimized.c:587:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	mov	ip, r1	@ pivot_column, ivtmp.131
	mov	r8, r4	@ inverse, inverse
	str	r10, [sp]	@ ivtmp.138, %sfp
	mov	lr, r10	@ ivtmp.139, ivtmp.150_433
.L32:
@ matrix_optimized.c:600:         largest_value = fixed_absolute(augmented[pivot_column][pivot_column]);
	ldrsh	r0, [fp]	@ _7, MEM[(short int *)_420]
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	cmp	ip, #7	@ pivot_column,
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	add	r6, ip, #1	@ row, pivot_column,
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asr	r3, r0, #31	@ sign_mask, _7,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r5, r0, r3	@ _119, _7, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r5, r5, r3	@ largest_value, _119, sign_mask
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L10		@,
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	ldr	r2, [sp]	@ ivtmp.138, %sfp
@ matrix_optimized.c:599:         pivot_row     = pivot_column;
	mov	r7, ip	@ pivot_row, pivot_column
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	mov	r4, r6	@ row, row
.L12:
@ matrix_optimized.c:603:             current_value = fixed_absolute(augmented[row][pivot_column]);
	lsls	r3, r4, #5	@ _408, row,
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r3, [r2, r3]	@ widened_value, MEM[(short int *)_406 + _408 * 1]
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asr	r9, r3, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r3, r9, r3	@ _13, sign_mask, widened_value
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r3, r3, r9	@ _385, _13, sign_mask
@ matrix_optimized.c:607:                 pivot_row     = row;
	cmp	r5, r3	@ largest_value, _385
	it	lt
	movlt	r7, r4	@ pivot_row, row
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	add	r4, r4, #1	@ row, row,
@ matrix_optimized.c:607:                 pivot_row     = row;
	it	lt
	movlt	r5, r3	@ largest_value, _385
@ matrix_optimized.c:602:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r4, #8	@ row,
	bne	.L12		@,
@ matrix_optimized.c:615:         if (largest_value == 0) {
	cbz	r5, .L16	@ largest_value,
@ matrix_optimized.c:628:         if (pivot_row != pivot_column) {
	cmp	r7, r1	@ pivot_row, ivtmp.131
	beq	.L14		@,
	lsls	r7, r7, #5	@ _257, pivot_row,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, lr	@ _12, ivtmp.139
@ matrix_optimized.c:630:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r0, r7, #16	@ _68, _257,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r3:128]!	@ _73, MEM[(const short int[8] *)_11]
@ matrix_optimized.c:630:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r0, r0, r10	@ _10, ivtmp.150_433
@ matrix_optimized.c:629:             int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
	add	r7, r7, r10	@ _9, ivtmp.150_433
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r0:128]	@ _108, MEM[(const short int[8] *)_10]
	vld1.16	{d22-d23}, [r3:128]	@ _99, MEM[(const short int[8] *)_12]
	vld1.16	{d18-d19}, [r7:128]	@ _109, MEM[(const short int[8] *)_9]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [r7:128]	@ _73, MEM[(short int[8] *)_9]
	vst1.16	{d22-d23}, [r0:128]	@ _99, MEM[(short int[8] *)_10]
	vst1.16	{d18-d19}, [lr:128]	@ _109, MEM[(short int[8] *)_11]
	vst1.16	{d16-d17}, [r3:128]	@ _108, MEM[(short int[8] *)_12]
@ matrix_optimized.c:652:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r0, [fp]	@ _7, MEM[(short int *)_420]
.L14:
@ matrix_optimized.c:607:                 pivot_row     = row;
	mov	r4, lr	@ ivtmp.123, ivtmp.139
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	movs	r3, #0	@ column,
.L28:
@ matrix_optimized.c:656:             if (column == pivot_column) {
	cmp	r3, r1	@ column, ivtmp.131
	beq	.L17		@,
@ matrix_optimized.c:271:     if (denominator == 0) {
	cbnz	r0, .L73	@ _7,
.L16:
@ matrix_optimized.c:616:             return MATRIX_SINGULAR;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:803: }
	add	sp, sp, #332	@,,
	@ sp needed	@
	vldm	sp!, {d8-d13}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L73:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r7, r0, #31	@ denominator_mask, _7,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r2, r0, r7	@ _172, _7, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r2, r2, r7	@ _173, _172, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r2, r2, #1	@ half_denominator_174, _173,
	str	r2, [sp, #8]	@ half_denominator_174, %sfp
.L18:
@ matrix_optimized.c:660:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r4]	@ _14, MEM[(short int *)_403]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r5, .L19	@ _14,
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r0, #4096	@ _7,
	beq	.L23		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r0, #4096	@ _7,
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	itett	ne
	eorne	r9, r7, r5, asr #31	@ quotient_sign_mask, denominator_mask, _14,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbeq	r2, r5, #0	@ division_result, _14
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	ldrne	r2, [sp, #8]	@ half_denominator_174, %sfp
	eorne	r2, r2, r9	@ _177, half_denominator_174, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	ittt	ne
	subne	r2, r2, r9	@ rounding_term_178, _177, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	addne	r2, r2, r5, lsl #12	@ _179, rounding_term_178, _14,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdivne	r2, r2, r0	@ division_result, _179, _7
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r2, #32768	@ _126, division_result,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _126,
	bcs	.L37		@,
@ matrix_optimized.c:669:             augmented[pivot_column][column] = (int16_t)division_result;
	sxth	r5, r2	@ _14, division_result
.L19:
@ matrix_optimized.c:669:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r4], #2	@ movhi	@ _14, MEM[(short int *)_40]
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r3, r3, #1	@ column, column,
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r3, #16	@ column,
	beq	.L21		@,
.L72:
@ matrix_optimized.c:656:             if (column == pivot_column) {
	cmp	r1, r3	@ ivtmp.131, column
	bne	.L18		@,
.L17:
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r3, r3, #1	@ column, column,
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #2	@ ivtmp.123, ivtmp.123,
	b	.L28		@
.L74:
@ matrix_optimized.c:656:             if (column == pivot_column) {
	cmp	r1, r2	@ ivtmp.131, column
	beq	.L22		@,
@ matrix_optimized.c:660:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r4, #2]!	@ _14, MEM[(short int *)_378]
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	mov	r3, r2	@ column, column
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _14
	beq	.L19	@
.L23:
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r3, #15	@ column,
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	add	r2, r3, #1	@ column, column,
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	bne	.L74		@,
.L21:
@ matrix_optimized.c:704:             target_factor[target_count] = factor;
	ldr	r4, [sp]	@ ivtmp.138, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, lr	@ tmp345, ivtmp.139
@ matrix_optimized.c:673:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	mov	r0, #4096	@ tmp344,
@ matrix_optimized.c:703:             target_row[target_count]    = row;
	add	r7, sp, #36	@ tmp407,,
@ matrix_optimized.c:673:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	strh	r0, [fp]	@ movhi	@ tmp344, MEM[(short int *)_420]
@ matrix_optimized.c:704:             target_factor[target_count] = factor;
	add	r5, sp, #20	@ tmp408,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r3:128]!	@ _111, MEM[(const short int[8] *)_18]
	vld1.16	{d22-d23}, [r3:128]	@ _110, MEM[(const short int[8] *)_19]
@ matrix_optimized.c:696:         for (row = 0; row < N; row++) {
	movs	r3, #0	@ row,
@ matrix_optimized.c:694:         target_count = 0;
	mov	r0, r3	@ target_count, row
.L30:
@ matrix_optimized.c:697:             int16_t factor = augmented[row][pivot_column];
	lsls	r2, r3, #5	@ _395, row,
	ldrsh	r2, [r4, r2]	@ factor, MEM[(short int *)_393 + _395 * 1]
@ matrix_optimized.c:699:             if (row == pivot_column || factor == 0) {
	cmp	r2, #0	@ factor,
	it	ne		@
	cmpne	r3, r1	@, row, ivtmp.131
@ matrix_optimized.c:703:             target_row[target_count]    = row;
	it	ne
	strne	r3, [r7, r0, lsl #2]	@ row, target_row[target_count_302]
@ matrix_optimized.c:696:         for (row = 0; row < N; row++) {
	add	r3, r3, #1	@ row, row,
@ matrix_optimized.c:704:             target_factor[target_count] = factor;
	itt	ne
	strhne	r2, [r5, r0, lsl #1]	@ movhi	@ factor, target_factor[target_count_302]
@ matrix_optimized.c:705:             target_count++;
	addne	r0, r0, #1	@ target_count, target_count,
@ matrix_optimized.c:696:         for (row = 0; row < N; row++) {
	cmp	r3, #8	@ row,
	bne	.L30		@,
@ matrix_optimized.c:710:         if (target_count > 0) {
	cmp	r0, #0	@ target_count
	beq	.L38	@
@ matrix_optimized.c:731:             stage_pointer = &augmented[target_row[0]][0];
	ldr	r3, [sp, #36]	@ target_row[0], target_row[0]
@ matrix_optimized.c:737:             for (index = 1; index < target_count; index++) {
	cmp	r0, #1	@ target_count,
@ matrix_optimized.c:734:             stage_factor  = target_factor[0];
	ldrsh	r5, [sp, #20]	@ next_factor, target_factor[0]
@ matrix_optimized.c:731:             stage_pointer = &augmented[target_row[0]][0];
	add	r2, sp, #36	@ ivtmp.97,,
@ matrix_optimized.c:731:             stage_pointer = &augmented[target_row[0]][0];
	add	r4, r10, r3, lsl #5	@ next_pointer, ivtmp.150_433, target_row[0],
@ matrix_optimized.c:734:             stage_factor  = target_factor[0];
	add	r9, sp, #20	@ tmp368,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r7, r4	@ _26, next_pointer
@ matrix_optimized.c:708:         overflow = vdupq_n_s32(0);
	vmov.i32	q15, #0  @ v4si	@ overflow,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r7:128]!	@ _115, MEM[(const short int[8] *)stage_pointer_79]
	vld1.16	{d28-d29}, [r7:128]	@ _114, MEM[(const short int[8] *)_24]
@ matrix_optimized.c:737:             for (index = 1; index < target_count; index++) {
	beq	.L34		@,
	add	r7, r9, r0, lsl #1	@ _31, tmp368, target_count,
	mov	r3, r2	@ ivtmp.103, ivtmp.97
	str	ip, [sp, #8]	@ pivot_column, %sfp
	add	r9, sp, #22	@ ivtmp.108,,
	str	r0, [sp, #12]	@ target_count, %sfp
	mov	ip, r7	@ _31, _31
.L35:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d6[0], r5	@ tmp374,, stage_factor
	vmov.16	d5[0], r5	@ tmp375,, stage_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _203, stage_low,
	vshll.s16	q6, d19, #12	@ _205, stage_low,
	vmov	q4, q14  @ v8hi	@ stage_high, _114
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q8, d24, d6[0]	@ _207, _111, tmp374,
	vmlsl.s16	q6, d25, d5[0]	@ _209, _111, tmp375,
	vmov.16	d4[0], r5	@ tmp376,, stage_factor
	vmov.16	d3[0], r5	@ tmp377,, stage_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q5, d8, #12	@ _183, stage_high,
	vshll.s16	q4, d9, #12	@ _185, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _210, _207,
	vrshr.s32	q6, q6, #12	@ _211, _209,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q5, d22, d4[0]	@ _187, _110, tmp376,
	vmlsl.s16	q4, d23, d3[0]	@ _189, _110, tmp377,
@ matrix_optimized.c:740:                 next_pointer = &augmented[target_row[index]][0];
	ldr	r5, [r3, #4]!	@ MEM[(int *)_166], MEM[(int *)_166]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r0, r4	@ tmp385, stage_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d21, q8	@ _219, _210
	vmovn.i32	d26, q6	@ _220, _211
@ matrix_optimized.c:740:                 next_pointer = &augmented[target_row[index]][0];
	add	r4, r10, r5, lsl #5	@ next_pointer, ivtmp.150_433, MEM[(int *)_166],
@ matrix_optimized.c:743:                 next_factor  = target_factor[index];
	ldrsh	r5, [r9], #2	@ next_factor, MEM[(short int *)_165]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r7, r4	@ _26, next_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d27, d26  @ v4hi	@ _221, _220
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r7:128]!	@ _115, MEM[(const short int[8] *)next_pointer_85]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d26, d21  @ v4hi	@ _221, _219
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q5, q5, #12	@ _190, _187,
	vrshr.s32	q4, q4, #12	@ _191, _189,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d28-d29}, [r7:128]	@ _114, MEM[(const short int[8] *)_26]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d21, q5	@ _199, _190
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d26-d27}, [r0]!	@ _221, MEM[(short int[8] *)stage_pointer_368]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d26, q4	@ _200, _191
@ matrix_optimized.c:737:             for (index = 1; index < target_count; index++) {
	cmp	ip, r9	@ _31, ivtmp.108
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d27, d26  @ v4hi	@ _201, _200
	vmov	d26, d21  @ v4hi	@ _201, _199
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d26-d27}, [r0:128]	@ _201, MEM[(short int[8] *)_28]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q8, #31	@ _213, _210,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q8, q8, q13	@ _214, _210, _213
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q6, #31	@ _215, _211,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q6, q6, q13	@ _216, _211, _215
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q5, #31	@ _193, _190,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q6	@ _32, _214, _216
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q5, q5, q13	@ _194, _190, _193
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q4, #31	@ _195, _191,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q5	@ _374, _32, _194
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q4, q4, q13	@ _196, _191, _195
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q4	@ _375, _374, _196
	vorr	q15, q15, q8	@ overflow, overflow, _375
@ matrix_optimized.c:737:             for (index = 1; index < target_count; index++) {
	bne	.L35		@,
	ldrd	ip, r0, [sp, #8]	@ pivot_column, target_count,,
.L34:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _243, _115,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d2[0], r5	@ tmp386,, next_factor
	vmov.16	d1[0], r5	@ tmp387,, next_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q9, d19, #12	@ _245, _115,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q8, d24, d2[0]	@ _247, _111, tmp386,
	vmov.16	d0[0], r5	@ tmp388,, next_factor
	vmlsl.s16	q9, d25, d1[0]	@ _249, _111, tmp387,
	vmov.16	d20[0], r5	@ tmp389,, next_factor
	add	r0, r2, r0, lsl #2	@ _344, ivtmp.97, target_count,
	mov	r5, r2	@ ivtmp.97, ivtmp.97
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _250, _247,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov	d7, d20  @ v4hi	@ tmp389, tmp389
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q12, q9, #12	@ _251, _249,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q4, q8, #31	@ _253, _250,
	vshr.s32	q13, q12, #31	@ _255, _251,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d18, q8	@ _259, _250
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q13, q12, q13	@ _256, _251, _255
	veor	q8, q8, q4	@ _254, _250, _253
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d19, q12	@ _260, _251
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q13	@ _319, _254, _256
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q13, d28, #12	@ _223, _114,
	vshll.s16	q12, d29, #12	@ _225, _114,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q13, d22, d0[0]	@ _227, _110, tmp388,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r4:128]	@ _261, MEM[(short int[8] *)stage_pointer_78]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q12, d23, d7[0]	@ _229, _110, tmp389,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q15	@ _298, _319, overflow
@ matrix_optimized.c:780:                 augmented[target_row[index]][pivot_column] = 0;
	movs	r4, #0	@ tmp401,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q11, q13, #12	@ _230, _227,
	vrshr.s32	q9, q12, #12	@ _231, _229,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q14, q11, #31	@ _233, _230,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d24, q9	@ _240, _231
	vmovn.i32	d21, q11	@ _239, _230
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q13, q9, #31	@ _235, _231,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q11, q11, q14	@ _234, _230, _233
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d25, d24  @ v4hi	@ _241, _240
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q13	@ _236, _231, _235
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d24, d21  @ v4hi	@ _241, _239
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q11	@ _285, _298, _234
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [r7:128]	@ _241, MEM[(short int[8] *)prephitmp_384]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q9	@ _238, _285, _236
.L36:
@ matrix_optimized.c:780:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r3, [r5], #4	@ _33, MEM[(int *)_100]
@ matrix_optimized.c:780:                 augmented[target_row[index]][pivot_column] = 0;
	add	r3, ip, r3, lsl #4	@ tmp399, pivot_column, _33,
@ matrix_optimized.c:779:             for (index = 0; index < target_count; index++) {
	cmp	r5, r0	@ ivtmp.97, _344
@ matrix_optimized.c:780:                 augmented[target_row[index]][pivot_column] = 0;
	strh	r4, [r10, r3, lsl #1]	@ movhi	@ tmp401, augmented[_33][pivot_column_336]
@ matrix_optimized.c:779:             for (index = 0; index < target_count; index++) {
	bne	.L36		@,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15289:   return __a | __b;
	vorr	d7, d17, d16	@ _131, _238, _238
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3924:   return (uint32x2_t)__builtin_neon_vpmaxuv2si ((int32x2_t) __a, (int32x2_t) __b);
	vpmax.u32	d7, d7, d7	@ _133, _131, _131
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6233:   return (uint32_t)__builtin_neon_vget_laneuv2si ((int32x2_t) __a, __b);
	vmov	r3, s14	@ int	@ _134, _133
@ matrix_optimized.c:788:             if (reduce_overflow(overflow) > (uint32_t)INT16_MAX) {
	cmp	r3, #32768	@ _134,
	bcc	.L38		@,
.L37:
@ matrix_optimized.c:666:                 return MATRIX_OVERFLOW;
	mov	r0, #-1	@ <retval>,
@ matrix_optimized.c:803: }
	add	sp, sp, #332	@,,
	@ sp needed	@
	vldm	sp!, {d8-d13}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L38:
@ matrix_optimized.c:587:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	ldr	r3, [sp]	@ ivtmp.138, %sfp
	cmp	r6, #8	@ row,
	add	r1, r1, #1	@ ivtmp.131, ivtmp.131,
	add	fp, fp, #34	@ ivtmp.136, ivtmp.136,
	add	r3, r3, #2	@ ivtmp.138, ivtmp.138,
	add	lr, lr, #32	@ ivtmp.139, ivtmp.139,
	str	r3, [sp]	@ ivtmp.138, %sfp
	bne	.L75		@,
	ldr	r3, [sp, #4]	@ ivtmp.150_433, %sfp
	mov	r4, r8	@ inverse, inverse
	add	r2, r8, #128	@ _124, ivtmp.91,
	adds	r3, r3, #16	@ ivtmp.150_433, ivtmp.150_433,
.L39:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]	@ _116, MEM[(const short int[8] *)_38]
@ matrix_optimized.c:798:     for (row = 0; row < N; row++) {
	adds	r3, r3, #32	@ ivtmp.89, ivtmp.89,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r4]!	@ _116, MEM[(short int[8] *)_37]
@ matrix_optimized.c:798:     for (row = 0; row < N; row++) {
	cmp	r4, r2	@ ivtmp.91, _124
	bne	.L39		@,
@ matrix_optimized.c:802:     return MATRIX_SUCCESS;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:803: }
	add	sp, sp, #332	@,,
	@ sp needed	@
	vldm	sp!, {d8-d13}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L75:
	mov	ip, r6	@ pivot_column, row
	b	.L32		@
.L10:
@ matrix_optimized.c:615:         if (largest_value == 0) {
	cmp	r5, #0	@ largest_value
	bne	.L14	@
	b	.L16		@
.L22:
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r3, r3, #2	@ column, column,
@ matrix_optimized.c:654:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #4	@ ivtmp.123, ivtmp.123,
	b	.L72		@
.L77:
	.align	2
.L76:
	.word	.LANCHOR0-(.LPIC1+4)
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
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vmov.i32	q12, #2048  @ v4si	@ tmp163,
@ matrix_optimized.c:820: {
	push	{r4, r5, lr}	@
@ matrix_optimized.c:820: {
	mov	r4, r0	@ first, tmp181
	sub	ip, r0, #2	@ ivtmp.204, first,
	mov	r5, r1	@ second, tmp182
	mov	lr, r2	@ ivtmp.202, tmp183
	adds	r4, r4, #126	@ _31, first,
	add	r0, r1, #128	@ _46, second,
.L80:
	vmov.i32	q13, #0  @ v4si	@ vect_sum_46.163,
	mov	r3, r5	@ ivtmp.191, second
	mov	r2, ip	@ ivtmp.195, ivtmp.204
	vmov	q14, q13  @ v4si	@ vect_sum_26.180, vect_sum_46.163
.L79:
@ matrix_optimized.c:837:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r1, [r2, #2]!	@ _6, MEM[(const int16_t *)_58]
@ matrix_optimized.c:837:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vld1.16	{q10}, [r3]!	@ tmp161, MEM <const vector(8) short int> [(short int *)vectp_second.164_122]
@ matrix_optimized.c:837:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vdup.16	q8, r1	@ tmp159, _6
@ matrix_optimized.c:836:             for (k = 0; k < N; k++) {
	cmp	r0, r3	@ _46, ivtmp.191
	vmull.s16 q9, d16, d20	@ vect_patt_113.167, tmp159, tmp161
	vmull.s16 q8, d17, d21	@ vect_patt_113.167, tmp159, tmp161
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q11, q12, q9	@ vect__82.173_141, tmp163, vect_patt_113.167
	vsub.i32	q10, q12, q8	@ vect__82.173_142, tmp163, vect_patt_113.167
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q3, q9, q12	@ vect__80.169_130, vect_patt_113.167, tmp163
	vadd.i32	q15, q8, q12	@ vect__80.169_131, vect_patt_113.167, tmp163
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q11, q11, #12	@ vect__33.175_146, vect__82.173_141,
	vshr.s32	q10, q10, #12	@ vect__33.175_147, vect__82.173_142,
	vcge.s32	q9, q9, #0	@ tmp169, vect_patt_113.167
	vcge.s32	q8, q8, #0	@ tmp177, vect_patt_113.167
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q3, q3, #12	@ vect__31.171_135, vect__80.169_130,
	vshr.s32	q15, q15, #12	@ vect__31.171_136, vect__80.169_131,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q11, q11	@ vect__84.177_150, vect__33.175_146
	vneg.s32	q10, q10	@ vect__84.177_151, vect__33.175_147
	vbsl	q9, q3, q11	@ vect__35.179, vect__31.171_135, vect__84.177_150
	vbsl	q8, q15, q10	@ vect__35.179, vect__31.171_136, vect__84.177_151
@ matrix_optimized.c:837:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q14, q14, q9	@ vect_sum_26.180, vect_sum_26.180, vect__35.179
	vadd.i32	q13, q13, q8	@ vect_sum_46.163, vect_sum_46.163, vect__35.179
@ matrix_optimized.c:836:             for (k = 0; k < N; k++) {
	bne	.L79		@,
@ matrix_optimized.c:840:             result[row][column] = sum;
	mov	r3, lr	@ tmp178, ivtmp.202
@ matrix_optimized.c:828:     for (row = 0; row < N; row++) {
	add	ip, ip, #16	@ ivtmp.204, ivtmp.204,
	cmp	ip, r4	@ ivtmp.204, _31
	add	lr, lr, #32	@ ivtmp.202, ivtmp.202,
@ matrix_optimized.c:840:             result[row][column] = sum;
	vst1.32	{q14}, [r3]!	@ vect_sum_26.180, MEM <vector(4) int> [(int *)vectp.183_160]
	vst1.32	{q13}, [r3]	@ vect_sum_46.163, MEM <vector(4) int> [(int *)vectp.182_166]
@ matrix_optimized.c:828:     for (row = 0; row < N; row++) {
	bne	.L80		@,
@ matrix_optimized.c:843: }
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
@ matrix_optimized.c:857: {
	mov	r2, r0	@ tmp134, matrix
@ matrix_optimized.c:861:     int32_t maximum_row_sum = 0;
	movs	r0, #0	@ <retval>,
	add	r1, r2, #128	@ _43, ivtmp.217,
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
@ matrix_optimized.c:874:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ <retval>, _10
	it	lt
	movlt	r0, r3	@ <retval>, _10
@ matrix_optimized.c:863:     for (row = 0; row < N; row++) {
	cmp	r2, r1	@ ivtmp.217, _43
	bne	.L85		@,
@ matrix_optimized.c:880: }
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
@ matrix_optimized.c:896:     if (first < 0 || second < 0) {
	orrs	r3, r0, r1	@ tmp132, first, second
	bmi	.L91		@,
@ matrix_optimized.c:900:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r0, .L89	@ first,
@ matrix_optimized.c:900:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	sdiv	r3, r3, r0	@ _12, tmp125, first
@ matrix_optimized.c:900:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r1, r3	@ second, _12
	bgt	.L91		@,
.L89:
@ matrix_optimized.c:904:     product = first * second;
	mul	r3, r1, r0	@ product_13, second, first
@ matrix_optimized.c:909:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:907:     *result = product >> FRACTION_BITS;
	asrs	r3, r3, #12	@ _14, product_13,
@ matrix_optimized.c:907:     *result = product >> FRACTION_BITS;
	str	r3, [r2]	@ _14, *result_9(D)
@ matrix_optimized.c:909:     return 1;
	bx	lr	@
.L91:
@ matrix_optimized.c:897:         return 0;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:910: }
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
@ matrix_optimized.c:926: {
	mov	r5, r1	@ inverse, tmp131
	mov	r6, r2	@ condition_number, tmp132
@ matrix_optimized.c:927:     int32_t matrix_norm  = matrix_infinity_norm(matrix);
	bl	matrix_infinity_norm(PLT)	@
	mov	r4, r0	@ tmp133,
@ matrix_optimized.c:928:     int32_t inverse_norm = matrix_infinity_norm(inverse);
	mov	r0, r5	@, inverse
	bl	matrix_infinity_norm(PLT)	@
@ matrix_optimized.c:896:     if (first < 0 || second < 0) {
	orrs	r3, r4, r0	@ tmp135, matrix_norm, inverse_norm
	bmi	.L99		@,
@ matrix_optimized.c:900:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r4, .L97	@ matrix_norm,
@ matrix_optimized.c:900:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp127,
	sdiv	r3, r3, r4	@ _16, tmp127, matrix_norm
@ matrix_optimized.c:900:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r0, r3	@ inverse_norm, _16
	bgt	.L99		@,
.L97:
@ matrix_optimized.c:904:     product = first * second;
	mul	r4, r0, r4	@ product_17, inverse_norm, matrix_norm
@ matrix_optimized.c:909:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:907:     *result = product >> FRACTION_BITS;
	asrs	r4, r4, #12	@ _18, product_17,
@ matrix_optimized.c:907:     *result = product >> FRACTION_BITS;
	str	r4, [r6]	@ _18, *condition_number_8(D)
@ matrix_optimized.c:932: }
	pop	{r4, r5, r6, pc}	@
.L99:
@ matrix_optimized.c:897:         return 0;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:932: }
	pop	{r4, r5, r6, pc}	@
	.size	calculate_condition_number, .-calculate_condition_number
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
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
