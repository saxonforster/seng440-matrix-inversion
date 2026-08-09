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
	ldr	r3, .L5	@ ivtmp.66,
	add	r2, r0, #128	@ _23, ivtmp.67,
.LPIC0:
	add	r3, pc	@ ivtmp.66
.L2:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]!	@ _10, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r0]!	@ _10, MEM[(short int[8] *)_3]
@ matrix_optimized.c:351:     for (row = 0; row < N; row++) {
	cmp	r0, r2	@ ivtmp.67, _23
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
	@ args = 0, pretend = 0, frame = 344
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	mov	r5, r1	@ inverse, tmp418
	vpush.64	{d8, d9, d10, d11, d12, d13, d14, d15}	@
	ldr	r4, .L76	@ ivtmp.152,
	sub	sp, sp, #348	@,,
@ matrix_optimized.c:526: {
	add	r3, sp, #95	@ tmp319,,
	add	r6, r0, #128	@ _443, ivtmp.150,
	bic	r3, r3, #15	@ ivtmp.151_437, tmp319,
.LPIC1:
	add	r4, pc	@ ivtmp.152
	mov	r10, r3	@ ivtmp.137, ivtmp.151_437
	str	r3, [sp, #8]	@ ivtmp.151_437, %sfp
	mov	r1, r3	@ ivtmp.151, ivtmp.151_437
.L9:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r0]!	@ _78, MEM[(const short int[8] *)_4]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r3, r1	@ tmp327, ivtmp.151
@ matrix_optimized.c:580:     for (row = 0; row < N; row++) {
	adds	r1, r1, #32	@ ivtmp.151, ivtmp.151,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r4:128]!	@ _80, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r3:128]!	@ _78, MEM[(short int[8] *)_1]
@ matrix_optimized.c:580:     for (row = 0; row < N; row++) {
	cmp	r0, r6	@ ivtmp.150, _443
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r3:128]	@ _80, MEM[(short int[8] *)_5]
@ matrix_optimized.c:580:     for (row = 0; row < N; row++) {
	bne	.L9		@,
	ldr	r8, [sp, #8]	@ ivtmp.151_437, %sfp
	movs	r1, #0	@ ivtmp.132,
@ matrix_optimized.c:588:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	mov	r9, r1	@ pivot_column, ivtmp.132
	str	r8, [sp, #4]	@ ivtmp.139, %sfp
	mov	lr, r8	@ ivtmp.140, ivtmp.151_437
.L32:
@ matrix_optimized.c:601:         largest_value = fixed_absolute(augmented[pivot_column][pivot_column]);
	ldrsh	r0, [r10]	@ _7, MEM[(short int *)_424]
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r9, #7	@ pivot_column,
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	add	r6, r9, #1	@ row, pivot_column,
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asr	r3, r0, #31	@ sign_mask, _7,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r7, r0, r3	@ _123, _7, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r7, r7, r3	@ largest_value, _123, sign_mask
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L10		@,
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	ldr	r2, [sp, #4]	@ ivtmp.139, %sfp
@ matrix_optimized.c:600:         pivot_row     = pivot_column;
	mov	ip, r9	@ pivot_row, pivot_column
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	mov	r4, r6	@ row, row
.L12:
@ matrix_optimized.c:604:             current_value = fixed_absolute(augmented[row][pivot_column]);
	lsls	r3, r4, #5	@ _412, row,
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r3, [r2, r3]	@ widened_value, MEM[(short int *)_410 + _412 * 1]
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asr	fp, r3, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r3, fp, r3	@ _30, sign_mask, widened_value
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r3, r3, fp	@ _29, _30, sign_mask
@ matrix_optimized.c:608:                 pivot_row     = row;
	cmp	r3, r7	@ _29, largest_value
	it	gt
	movgt	ip, r4	@ pivot_row, row
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	add	r4, r4, #1	@ row, row,
@ matrix_optimized.c:608:                 pivot_row     = row;
	it	gt
	movgt	r7, r3	@ largest_value, _29
@ matrix_optimized.c:603:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r4, #8	@ row,
	bne	.L12		@,
@ matrix_optimized.c:616:         if (largest_value == 0) {
	cbz	r7, .L16	@ largest_value,
@ matrix_optimized.c:629:         if (pivot_row != pivot_column) {
	cmp	ip, r1	@ pivot_row, ivtmp.132
	beq	.L14		@,
	lsl	ip, ip, #5	@ _98, pivot_row,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, lr	@ _12, ivtmp.140
@ matrix_optimized.c:631:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r0, ip, #16	@ _69, _98,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r3:128]!	@ _102, MEM[(const short int[8] *)_11]
@ matrix_optimized.c:631:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r0, r0, r8	@ _10, ivtmp.151_437
@ matrix_optimized.c:630:             int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
	add	ip, ip, r8	@ _9, ivtmp.151_437
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r0:128]	@ _74, MEM[(const short int[8] *)_10]
	vld1.16	{d22-d23}, [r3:128]	@ _99, MEM[(const short int[8] *)_12]
	vld1.16	{d18-d19}, [ip:128]	@ _112, MEM[(const short int[8] *)_9]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [ip:128]	@ _102, MEM[(short int[8] *)_9]
	vst1.16	{d22-d23}, [r0:128]	@ _99, MEM[(short int[8] *)_10]
	vst1.16	{d18-d19}, [lr:128]	@ _112, MEM[(short int[8] *)_11]
	vst1.16	{d16-d17}, [r3:128]	@ _74, MEM[(short int[8] *)_12]
@ matrix_optimized.c:653:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r0, [r10]	@ _7, MEM[(short int *)_424]
.L14:
@ matrix_optimized.c:608:                 pivot_row     = row;
	mov	r4, lr	@ ivtmp.124, ivtmp.140
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	movs	r3, #0	@ column,
.L28:
@ matrix_optimized.c:657:             if (column == pivot_column) {
	cmp	r3, r1	@ column, ivtmp.132
	beq	.L17		@,
@ matrix_optimized.c:271:     if (denominator == 0) {
	cbnz	r0, .L73	@ _7,
.L16:
@ matrix_optimized.c:617:             return MATRIX_SINGULAR;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:806: }
	add	sp, sp, #348	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L73:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asr	ip, r0, #31	@ denominator_mask, _7,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r2, r0, ip	@ _176, _7, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	sub	r2, r2, ip	@ _177, _176, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r2, r2, #1	@ half_denominator_178, _177,
	str	r2, [sp, #12]	@ half_denominator_178, %sfp
.L18:
@ matrix_optimized.c:661:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r7, [r4]	@ _14, MEM[(short int *)_407]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r7, .L19	@ _14,
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r0, #4096	@ _7,
	beq	.L23		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r0, #4096	@ _7,
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	itett	ne
	eorne	fp, ip, r7, asr #31	@ quotient_sign_mask, denominator_mask, _14,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbeq	r2, r7, #0	@ division_result, _14
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	ldrne	r2, [sp, #12]	@ half_denominator_178, %sfp
	eorne	r2, r2, fp	@ _181, half_denominator_178, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	ittt	ne
	subne	r2, r2, fp	@ rounding_term_182, _181, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	addne	r2, r2, r7, lsl #12	@ _183, rounding_term_182, _14,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdivne	r2, r2, r0	@ division_result, _183, _7
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r7, r2, #32768	@ _130, division_result,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r7, #65536	@ _130,
	bcs	.L37		@,
@ matrix_optimized.c:670:             augmented[pivot_column][column] = (int16_t)division_result;
	sxth	r7, r2	@ _14, division_result
.L19:
@ matrix_optimized.c:670:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r7, [r4], #2	@ movhi	@ _14, MEM[(short int *)_3]
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r3, r3, #1	@ column, column,
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r3, #16	@ column,
	beq	.L21		@,
.L72:
@ matrix_optimized.c:657:             if (column == pivot_column) {
	cmp	r1, r3	@ ivtmp.132, column
	bne	.L18		@,
.L17:
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r3, r3, #1	@ column, column,
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #2	@ ivtmp.124, ivtmp.124,
	b	.L28		@
.L74:
@ matrix_optimized.c:657:             if (column == pivot_column) {
	cmp	r1, r2	@ ivtmp.132, column
	beq	.L22		@,
@ matrix_optimized.c:661:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r7, [r4, #2]!	@ _14, MEM[(short int *)_369]
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	mov	r3, r2	@ column, column
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r7, #0	@ _14
	beq	.L19	@
.L23:
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	cmp	r3, #15	@ column,
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	add	r2, r3, #1	@ column, column,
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	bne	.L74		@,
.L21:
@ matrix_optimized.c:705:             target_factor[target_count] = factor;
	ldr	r4, [sp, #4]	@ ivtmp.139, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, lr	@ tmp346, ivtmp.140
@ matrix_optimized.c:674:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	mov	r0, #4096	@ tmp345,
@ matrix_optimized.c:704:             target_row[target_count]    = row;
	add	ip, sp, #52	@ tmp404,,
@ matrix_optimized.c:674:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	strh	r0, [r10]	@ movhi	@ tmp345, MEM[(short int *)_424]
@ matrix_optimized.c:705:             target_factor[target_count] = factor;
	add	r7, sp, #36	@ tmp405,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d8-d9}, [r3:128]!	@ _114, MEM[(const short int[8] *)_18]
	vld1.16	{d30-d31}, [r3:128]	@ _113, MEM[(const short int[8] *)_19]
@ matrix_optimized.c:697:         for (row = 0; row < N; row++) {
	movs	r3, #0	@ row,
@ matrix_optimized.c:695:         target_count = 0;
	mov	r0, r3	@ target_count, row
.L30:
@ matrix_optimized.c:698:             int16_t factor = augmented[row][pivot_column];
	lsls	r2, r3, #5	@ _352, row,
	ldrsh	r2, [r4, r2]	@ factor, MEM[(short int *)_31 + _352 * 1]
@ matrix_optimized.c:700:             if (row == pivot_column || factor == 0) {
	cmp	r2, #0	@ factor,
	it	ne		@
	cmpne	r3, r1	@, row, ivtmp.132
@ matrix_optimized.c:704:             target_row[target_count]    = row;
	it	ne
	strne	r3, [ip, r0, lsl #2]	@ row, target_row[target_count_323]
@ matrix_optimized.c:697:         for (row = 0; row < N; row++) {
	add	r3, r3, #1	@ row, row,
@ matrix_optimized.c:705:             target_factor[target_count] = factor;
	itt	ne
	strhne	r2, [r7, r0, lsl #1]	@ movhi	@ factor, target_factor[target_count_323]
@ matrix_optimized.c:706:             target_count++;
	addne	r0, r0, #1	@ target_count, target_count,
@ matrix_optimized.c:697:         for (row = 0; row < N; row++) {
	cmp	r3, #8	@ row,
	bne	.L30		@,
@ matrix_optimized.c:712:         if (target_count > 0) {
	cmp	r0, #0	@ target_count
	beq	.L38	@
@ matrix_optimized.c:733:             stage_pointer = &augmented[target_row[0]][0];
	ldr	r3, [sp, #52]	@ target_row[0], target_row[0]
@ matrix_optimized.c:739:             for (index = 1; index < target_count; index++) {
	cmp	r0, #1	@ target_count,
@ matrix_optimized.c:736:             stage_factor  = target_factor[0];
	ldrsh	ip, [sp, #36]	@ next_factor, target_factor[0]
@ matrix_optimized.c:733:             stage_pointer = &augmented[target_row[0]][0];
	add	r2, sp, #52	@ ivtmp.98,,
@ matrix_optimized.c:733:             stage_pointer = &augmented[target_row[0]][0];
	add	r3, r8, r3, lsl #5	@ next_pointer, ivtmp.151_437, target_row[0],
@ matrix_optimized.c:736:             stage_factor  = target_factor[0];
	add	r4, sp, #36	@ tmp369,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r7, r3	@ _26, next_pointer
@ matrix_optimized.c:739:             for (index = 1; index < target_count; index++) {
	vmov.i32	q5, #0  @ v4si	@ _391,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d28-d29}, [r7:128]!	@ _119, MEM[(const short int[8] *)stage_pointer_82]
	vld1.16	{d18-d19}, [r7:128]	@ stage_high, MEM[(const short int[8] *)_24]
@ matrix_optimized.c:739:             for (index = 1; index < target_count; index++) {
	beq	.L34		@,
@ matrix_optimized.c:710:         overflow_b = vdupq_n_s32(0);
	vmov.i32	q6, #0  @ v4si	@ overflow_b,
	add	r4, r4, r0, lsl #1	@ _17, tmp369, target_count,
	add	fp, sp, #38	@ ivtmp.109,,
	str	r9, [sp, #12]	@ pivot_column, %sfp
	mov	r9, r4	@ _17, _17
@ matrix_optimized.c:709:         overflow_a = vdupq_n_s32(0);
	vmov	q5, q6  @ v4si	@ overflow_a, overflow_b
	strd	r0, r6, [sp, #24]	@ target_count, row,,
	mov	r6, r2	@ ivtmp.104, ivtmp.104
.L35:
@ matrix_optimized.c:742:                 next_pointer = &augmented[target_row[index]][0];
	ldr	r7, [r6, #4]!	@ MEM[(int *)_76], MEM[(int *)_76]
	mov	r4, ip	@ stage_factor, next_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q12, d28, #12	@ _207, stage_low,
	vshll.s16	q11, d29, #12	@ _209, stage_low,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d6[0], r4	@ tmp375,, stage_factor
	vmov.16	d5[0], r4	@ tmp376,, stage_factor
	vmlsl.s16	q12, d8, d6[0]	@ _211, _114, tmp375,
	vmov.16	d3[0], r4	@ tmp381,, stage_factor
	vmlsl.s16	q11, d9, d5[0]	@ _213, _114, tmp376,
	vmov.16	d4[0], r4	@ tmp380,, stage_factor
@ matrix_optimized.c:745:                 next_factor  = target_factor[index];
	ldrsh	ip, [fp], #2	@ next_factor, MEM[(short int *)_395]
	mov	r0, r3	@ stage_pointer, next_pointer
@ matrix_optimized.c:742:                 next_pointer = &augmented[target_row[index]][0];
	add	r3, r8, r7, lsl #5	@ next_pointer, ivtmp.151_437, MEM[(int *)_76],
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q12, q12, #12	@ _214, _211,
@ matrix_optimized.c:739:             for (index = 1; index < target_count; index++) {
	cmp	r9, fp	@ _17, ivtmp.109
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r7, r3	@ _26, next_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q11, q11, #12	@ _215, _213,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d17, q12	@ _223, _214
	vmovn.i32	d14, q11	@ _224, _215
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d28-d29}, [r7:128]!	@ _119, MEM[(const short int[8] *)next_pointer_88]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d15, d14  @ v4hi	@ _225, _224
	vmov	d14, d17  @ v4hi	@ _225, _223
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _187, stage_high,
	vshll.s16	q9, d19, #12	@ _189, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q8, d30, d4[0]	@ _191, _113, tmp380,
	vmlsl.s16	q9, d31, d3[0]	@ _193, _113, tmp381,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _194, _191,
	vrshr.s32	q9, q9, #12	@ _195, _193,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d26, q8	@ _203, _194
	vmovn.i32	d21, q9	@ _204, _195
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d27, d21  @ v4hi	@ _205, _204
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q12, #31	@ _217, _214,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q12, q12, q10	@ _218, _214, _217
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q11, #31	@ _219, _215,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q11, q11, q10	@ _220, _215, _219
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q11, q12, q11	@ _221, _218, _220
	vorr	q5, q5, q11	@ overflow_a, overflow_a, _221
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q11, q8, #31	@ _197, _194,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q8, q8, q11	@ _198, _194, _197
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q11, q9, #31	@ _199, _195,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q11	@ _200, _195, _199
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q9	@ _201, _198, _200
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r7:128]	@ stage_high, MEM[(const short int[8] *)_26]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d14-d15}, [r0]!	@ _225, MEM[(short int[8] *)stage_pointer_375]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q6, q6, q8	@ overflow_b, overflow_b, _201
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d26-d27}, [r0:128]	@ _205, MEM[(short int[8] *)_28]
@ matrix_optimized.c:739:             for (index = 1; index < target_count; index++) {
	bne	.L35		@,
	vorr	q5, q6, q5	@ _391, overflow_b, overflow_a
	ldr	r9, [sp, #12]	@ pivot_column, %sfp
	ldrd	r0, r6, [sp, #24]	@ target_count, row,,
.L34:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q12, d28, #12	@ _247, _119,
	vshll.s16	q11, d29, #12	@ _249, _119,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d2[0], ip	@ tmp386,, next_factor
	vmov.16	d1[0], ip	@ tmp387,, next_factor
	vmlsl.s16	q12, d8, d2[0]	@ _251, _114, tmp386,
	vldr	d7, [sp, #16]	@, %sfp
	vmlsl.s16	q11, d9, d1[0]	@ _253, _114, tmp387,
	vmov.16	d0[0], ip	@ tmp388,, next_factor
	vmov.16	d7[0], ip	@ tmp389,, next_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q12, q12, #12	@ _254, _251,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vstr	d7, [sp, #16]	@, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q11, q11, #12	@ _255, _253,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q14, q12, #31	@ _257, _254,
	vshr.s32	q13, q11, #31	@ _259, _255,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d17, q12	@ _263, _254
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q13, q11, q13	@ _260, _255, _259
	veor	q14, q12, q14	@ _258, _254, _257
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d16, q11	@ _264, _255
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q12, d19, #12	@ _229, stage_high,
	vshll.s16	q11, d18, #12	@ _227, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q12, d31, d7[0]	@ _233, _113, tmp389,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vswp	d16, d17	@ _265, _263
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q11, d30, d0[0]	@ _231, _113, tmp388,
	add	r0, r2, r0, lsl #2	@ _350, ivtmp.98, target_count,
	mov	r4, r2	@ ivtmp.98, ivtmp.98
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r3:128]	@ _265, MEM[(short int[8] *)stage_pointer_302]
	vorr	q8, q14, q13	@ _216, _258, _260
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q9, q11, #12	@ _234, _231,
	vrshr.s32	q11, q12, #12	@ _235, _233,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d21, q9	@ _243, _234
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q12, q11, #31	@ _239, _235,
	vshr.s32	q13, q9, #31	@ _237, _234,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q12, q11, q12	@ _240, _235, _239
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d22, q11	@ _244, _235
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q13	@ _238, _234, _237
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d23, d22  @ v4hi	@ _245, _244
	vmov	d22, d21  @ v4hi	@ _245, _243
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d22-d23}, [r7:128]	@ _245, MEM[(short int[8] *)prephitmp_390]
@ matrix_optimized.c:782:                 augmented[target_row[index]][pivot_column] = 0;
	movs	r7, #0	@ tmp396,
.L36:
@ matrix_optimized.c:782:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r3, [r4], #4	@ _33, MEM[(int *)_103]
@ matrix_optimized.c:782:                 augmented[target_row[index]][pivot_column] = 0;
	add	r3, r9, r3, lsl #4	@ tmp394, pivot_column, _33,
@ matrix_optimized.c:781:             for (index = 0; index < target_count; index++) {
	cmp	r4, r0	@ ivtmp.98, _350
@ matrix_optimized.c:782:                 augmented[target_row[index]][pivot_column] = 0;
	strh	r7, [r8, r3, lsl #1]	@ movhi	@ tmp396, augmented[_33][pivot_column_344]
@ matrix_optimized.c:781:             for (index = 0; index < target_count; index++) {
	bne	.L36		@,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q5	@ _306, _216, _391
	vorr	q8, q8, q9	@ _16, _306, _238
	vorr	q8, q8, q12	@ _131, _16, _240
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15289:   return __a | __b;
	vorr	d7, d17, d16	@ _136, _131, _131
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3924:   return (uint32x2_t)__builtin_neon_vpmaxuv2si ((int32x2_t) __a, (int32x2_t) __b);
	vpmax.u32	d7, d7, d7	@ _138, _136, _136
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6233:   return (uint32_t)__builtin_neon_vget_laneuv2si ((int32x2_t) __a, __b);
	vmov	r3, s14	@ int	@ _139, _138
@ matrix_optimized.c:790:             if (reduce_overflow(overflow_a, overflow_b)
	cmp	r3, #32768	@ _139,
	bcc	.L38		@,
.L37:
@ matrix_optimized.c:667:                 return MATRIX_OVERFLOW;
	mov	r0, #-1	@ <retval>,
@ matrix_optimized.c:806: }
	add	sp, sp, #348	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L38:
@ matrix_optimized.c:588:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	ldr	r3, [sp, #4]	@ ivtmp.139, %sfp
	cmp	r6, #8	@ row,
	add	r1, r1, #1	@ ivtmp.132, ivtmp.132,
	add	r10, r10, #34	@ ivtmp.137, ivtmp.137,
	add	r3, r3, #2	@ ivtmp.139, ivtmp.139,
	add	lr, lr, #32	@ ivtmp.140, ivtmp.140,
	str	r3, [sp, #4]	@ ivtmp.139, %sfp
	bne	.L75		@,
	ldr	r3, [sp, #8]	@ ivtmp.151_437, %sfp
	add	r2, r5, #128	@ _128, ivtmp.92,
	adds	r3, r3, #16	@ ivtmp.151_437, ivtmp.151_437,
.L39:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r3:128]	@ _120, MEM[(const short int[8] *)_39]
@ matrix_optimized.c:801:     for (row = 0; row < N; row++) {
	adds	r3, r3, #32	@ ivtmp.90, ivtmp.90,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r5]!	@ _120, MEM[(short int[8] *)_38]
@ matrix_optimized.c:801:     for (row = 0; row < N; row++) {
	cmp	r5, r2	@ ivtmp.92, _128
	bne	.L39		@,
@ matrix_optimized.c:805:     return MATRIX_SUCCESS;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:806: }
	add	sp, sp, #348	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L75:
	mov	r9, r6	@ pivot_column, row
	b	.L32		@
.L10:
@ matrix_optimized.c:616:         if (largest_value == 0) {
	cmp	r7, #0	@ largest_value
	bne	.L14	@
	b	.L16		@
.L22:
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r3, r3, #2	@ column, column,
@ matrix_optimized.c:655:         for (column = 0; column < AUGMENTED_N; column++) {
	adds	r4, r4, #4	@ ivtmp.124, ivtmp.124,
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
@ matrix_optimized.c:823: {
	push	{r4, r5, lr}	@
@ matrix_optimized.c:823: {
	mov	r4, r0	@ first, tmp181
	sub	ip, r0, #2	@ ivtmp.205, first,
	mov	r5, r1	@ second, tmp182
	mov	lr, r2	@ ivtmp.203, tmp183
	adds	r4, r4, #126	@ _31, first,
	add	r0, r1, #128	@ _46, second,
.L80:
	vmov.i32	q13, #0  @ v4si	@ vect_sum_46.164,
	mov	r3, r5	@ ivtmp.192, second
	mov	r2, ip	@ ivtmp.196, ivtmp.205
	vmov	q14, q13  @ v4si	@ vect_sum_26.181, vect_sum_46.164
.L79:
@ matrix_optimized.c:840:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r1, [r2, #2]!	@ _6, MEM[(const int16_t *)_58]
@ matrix_optimized.c:840:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vld1.16	{q10}, [r3]!	@ tmp161, MEM <const vector(8) short int> [(short int *)vectp_second.165_122]
@ matrix_optimized.c:840:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vdup.16	q8, r1	@ tmp159, _6
@ matrix_optimized.c:839:             for (k = 0; k < N; k++) {
	cmp	r0, r3	@ _46, ivtmp.192
	vmull.s16 q9, d16, d20	@ vect_patt_113.168, tmp159, tmp161
	vmull.s16 q8, d17, d21	@ vect_patt_113.168, tmp159, tmp161
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q11, q12, q9	@ vect__82.174_141, tmp163, vect_patt_113.168
	vsub.i32	q10, q12, q8	@ vect__82.174_142, tmp163, vect_patt_113.168
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q3, q9, q12	@ vect__80.170_130, vect_patt_113.168, tmp163
	vadd.i32	q15, q8, q12	@ vect__80.170_131, vect_patt_113.168, tmp163
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q11, q11, #12	@ vect__33.176_146, vect__82.174_141,
	vshr.s32	q10, q10, #12	@ vect__33.176_147, vect__82.174_142,
	vcge.s32	q9, q9, #0	@ tmp169, vect_patt_113.168
	vcge.s32	q8, q8, #0	@ tmp177, vect_patt_113.168
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q3, q3, #12	@ vect__31.172_135, vect__80.170_130,
	vshr.s32	q15, q15, #12	@ vect__31.172_136, vect__80.170_131,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q11, q11	@ vect__84.178_150, vect__33.176_146
	vneg.s32	q10, q10	@ vect__84.178_151, vect__33.176_147
	vbsl	q9, q3, q11	@ vect__35.180, vect__31.172_135, vect__84.178_150
	vbsl	q8, q15, q10	@ vect__35.180, vect__31.172_136, vect__84.178_151
@ matrix_optimized.c:840:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q14, q14, q9	@ vect_sum_26.181, vect_sum_26.181, vect__35.180
	vadd.i32	q13, q13, q8	@ vect_sum_46.164, vect_sum_46.164, vect__35.180
@ matrix_optimized.c:839:             for (k = 0; k < N; k++) {
	bne	.L79		@,
@ matrix_optimized.c:843:             result[row][column] = sum;
	mov	r3, lr	@ tmp178, ivtmp.203
@ matrix_optimized.c:831:     for (row = 0; row < N; row++) {
	add	ip, ip, #16	@ ivtmp.205, ivtmp.205,
	cmp	ip, r4	@ ivtmp.205, _31
	add	lr, lr, #32	@ ivtmp.203, ivtmp.203,
@ matrix_optimized.c:843:             result[row][column] = sum;
	vst1.32	{q14}, [r3]!	@ vect_sum_26.181, MEM <vector(4) int> [(int *)vectp.184_160]
	vst1.32	{q13}, [r3]	@ vect_sum_46.164, MEM <vector(4) int> [(int *)vectp.183_166]
@ matrix_optimized.c:831:     for (row = 0; row < N; row++) {
	bne	.L80		@,
@ matrix_optimized.c:846: }
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
@ matrix_optimized.c:860: {
	mov	r2, r0	@ tmp134, matrix
@ matrix_optimized.c:864:     int32_t maximum_row_sum = 0;
	movs	r0, #0	@ <retval>,
	add	r1, r2, #128	@ _43, ivtmp.218,
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
@ matrix_optimized.c:877:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ <retval>, _10
	it	lt
	movlt	r0, r3	@ <retval>, _10
@ matrix_optimized.c:866:     for (row = 0; row < N; row++) {
	cmp	r2, r1	@ ivtmp.218, _43
	bne	.L85		@,
@ matrix_optimized.c:883: }
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
@ matrix_optimized.c:899:     if (first < 0 || second < 0) {
	orrs	r3, r0, r1	@ tmp132, first, second
	bmi	.L91		@,
@ matrix_optimized.c:903:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r0, .L89	@ first,
@ matrix_optimized.c:903:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	sdiv	r3, r3, r0	@ _12, tmp125, first
@ matrix_optimized.c:903:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r1, r3	@ second, _12
	bgt	.L91		@,
.L89:
@ matrix_optimized.c:907:     product = first * second;
	mul	r3, r1, r0	@ product_13, second, first
@ matrix_optimized.c:912:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:910:     *result = product >> FRACTION_BITS;
	asrs	r3, r3, #12	@ _14, product_13,
@ matrix_optimized.c:910:     *result = product >> FRACTION_BITS;
	str	r3, [r2]	@ _14, *result_9(D)
@ matrix_optimized.c:912:     return 1;
	bx	lr	@
.L91:
@ matrix_optimized.c:900:         return 0;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:913: }
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
@ matrix_optimized.c:929: {
	mov	r5, r1	@ inverse, tmp131
	mov	r6, r2	@ condition_number, tmp132
@ matrix_optimized.c:930:     int32_t matrix_norm  = matrix_infinity_norm(matrix);
	bl	matrix_infinity_norm(PLT)	@
	mov	r4, r0	@ tmp133,
@ matrix_optimized.c:931:     int32_t inverse_norm = matrix_infinity_norm(inverse);
	mov	r0, r5	@, inverse
	bl	matrix_infinity_norm(PLT)	@
@ matrix_optimized.c:899:     if (first < 0 || second < 0) {
	orrs	r3, r4, r0	@ tmp135, matrix_norm, inverse_norm
	bmi	.L99		@,
@ matrix_optimized.c:903:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r4, .L97	@ matrix_norm,
@ matrix_optimized.c:903:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp127,
	sdiv	r3, r3, r4	@ _16, tmp127, matrix_norm
@ matrix_optimized.c:903:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r0, r3	@ inverse_norm, _16
	bgt	.L99		@,
.L97:
@ matrix_optimized.c:907:     product = first * second;
	mul	r4, r0, r4	@ product_17, inverse_norm, matrix_norm
@ matrix_optimized.c:912:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:910:     *result = product >> FRACTION_BITS;
	asrs	r4, r4, #12	@ _18, product_17,
@ matrix_optimized.c:910:     *result = product >> FRACTION_BITS;
	str	r4, [r6]	@ _18, *condition_number_8(D)
@ matrix_optimized.c:935: }
	pop	{r4, r5, r6, pc}	@
.L99:
@ matrix_optimized.c:900:         return 0;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:935: }
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
