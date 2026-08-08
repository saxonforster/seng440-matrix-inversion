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
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	ldr	r3, .L4	@ tmp131,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r2, r0	@ tmp135, matrix
@ matrix_optimized.c:348: {
	push	{lr}	@
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	lr, r0, #32	@ tmp139, matrix,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
.LPIC0:
	add	r3, pc	@ tmp131
	mov	r1, r3	@ tmp134, tmp131
	add	ip, r3, #32	@ tmp138, tmp131,
	vld1.16	{d16-d17}, [r1:128]!	@ _20, MEM[(const short int[8] *)&identity_q12]
	vld1.16	{d18-d19}, [ip:128]	@ _40, MEM[(const short int[8] *)&identity_q12 + 32B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r2]!	@ _20, MEM[(short int[8] *)matrix_8(D)]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1:128]	@ _30, MEM[(const short int[8] *)&identity_q12 + 16B]
	add	r1, r3, #48	@ tmp142, tmp131,
	add	ip, r3, #64	@ tmp146, tmp131,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d16-d17}, [r2]	@ _30, MEM[(short int[8] *)_27]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1:128]	@ _50, MEM[(const short int[8] *)&identity_q12 + 48B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r2, r0, #48	@ tmp143, matrix,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	add	r1, r3, #80	@ tmp150, tmp131,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [lr]	@ _40, MEM[(short int[8] *)_37]
	vst1.16	{d16-d17}, [r2]	@ _50, MEM[(short int[8] *)_47]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	add	r2, r3, #96	@ tmp154, tmp131,
	adds	r3, r3, #112	@ tmp158, tmp131,
	vld1.16	{d22-d23}, [ip:128]	@ _60, MEM[(const short int[8] *)&identity_q12 + 64B]
	vld1.16	{d20-d21}, [r1:128]	@ _70, MEM[(const short int[8] *)&identity_q12 + 80B]
	vld1.16	{d18-d19}, [r2:128]	@ _80, MEM[(const short int[8] *)&identity_q12 + 96B]
	vld1.16	{d16-d17}, [r3:128]	@ _90, MEM[(const short int[8] *)&identity_q12 + 112B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	ip, r0, #64	@ tmp147, matrix,
	add	r1, r0, #80	@ tmp151, matrix,
	add	r2, r0, #96	@ tmp155, matrix,
	adds	r0, r0, #112	@ tmp159, matrix,
	vst1.16	{d22-d23}, [ip]	@ _60, MEM[(short int[8] *)_57]
	vst1.16	{d20-d21}, [r1]	@ _70, MEM[(short int[8] *)_67]
	vst1.16	{d18-d19}, [r2]	@ _80, MEM[(short int[8] *)_77]
	vst1.16	{d16-d17}, [r0]	@ _90, MEM[(short int[8] *)_87]
@ matrix_optimized.c:355: }
	ldr	pc, [sp], #4	@
.L5:
	.align	2
.L4:
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
@ matrix_optimized.c:365:     int16x8_t first  = vld1q_s16(matrix[row1]);
	add	r1, r0, r1, lsl #4	@ _3, matrix, tmp128,
@ matrix_optimized.c:366:     int16x8_t second = vld1q_s16(matrix[row2]);
	add	r0, r0, r2, lsl #4	@ _6, matrix, tmp129,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1]	@ _12, MEM[(const short int[8] *)_3]
	vld1.16	{d18-d19}, [r0]	@ _11, MEM[(const short int[8] *)_6]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d18-d19}, [r1]	@ _11, MEM[(short int[8] *)_3]
	vst1.16	{d16-d17}, [r0]	@ _12, MEM[(short int[8] *)_6]
@ matrix_optimized.c:370: }
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
	@ args = 0, pretend = 0, frame = 376
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r4, r0	@ tmp940, input
@ matrix_optimized.c:527: {
	vpush.64	{d8, d9, d10, d11, d12, d13, d14, d15}	@
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r4]!	@ _1171, MEM[(const short int[8] *)input_110(D)]
	ldr	r2, .L899	@ tmp938,
@ matrix_optimized.c:527: {
	sub	sp, sp, #380	@,,
@ matrix_optimized.c:527: {
	add	r3, sp, #127	@ tmp931,,
	mov	ip, r1	@ inverse, tmp1752
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r4]	@ _1186, MEM[(const short int[8] *)_1184]
@ matrix_optimized.c:527: {
	bic	r3, r3, #15	@ ivtmp.88_981, tmp931,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
.LPIC8:
	add	r2, pc	@ tmp938
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r4, r3, #32	@ tmp941, ivtmp.88_981,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r1, r2	@ tmp944, tmp938
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r8, r3, #48	@ tmp1741, ivtmp.88_981,
	vst1.16	{d16-d17}, [r4:128]	@ _1186, MEM[(short int[8] *)&augmented + 32B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	add	r4, r0, #32	@ tmp946, input,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	fp, r3, #112	@ tmp1743, ivtmp.88_981,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d16-d17}, [r1:128]!	@ _1176, MEM[(const short int[8] *)&identity_q12]
	vld1.16	{d14-d15}, [r4]	@ _1201, MEM[(const short int[8] *)_1199]
	add	r4, r2, #32	@ tmp950, tmp938,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r5, r3, #240	@ tmp1747, ivtmp.88_981,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d20-d21}, [r1:128]	@ _1191, MEM[(const short int[8] *)&identity_q12 + 16B]
	vld1.16	{d12-d13}, [r4:128]	@ _1206, MEM[(const short int[8] *)&identity_q12 + 32B]
	add	r4, r0, #48	@ tmp952, input,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r1, r3	@ tmp1740, ivtmp.88_981
	vst1.16	{d20-d21}, [r8:128]	@ _1191, MEM[(short int[8] *)&augmented + 48B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d10-d11}, [r4]	@ _1216, MEM[(const short int[8] *)_1214]
	add	r4, r2, #48	@ tmp956, tmp938,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r7, r3, #144	@ tmp1744, ivtmp.88_981,
	vst1.16	{d18-d19}, [r1:128]!	@ _1171, MEM[(short int[8] *)&augmented]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d8-d9}, [r4:128]	@ _1221, MEM[(const short int[8] *)&identity_q12 + 48B]
	add	r4, r0, #64	@ tmp958, input,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r6, r3, #176	@ tmp1745, ivtmp.88_981,
	vst1.16	{d16-d17}, [r1:128]	@ _1176, MEM[(short int[8] *)&augmented + 16B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d30-d31}, [r4]	@ _1231, MEM[(const short int[8] *)_1229]
	add	r4, r2, #64	@ tmp962, tmp938,
	mov	r10, r3	@ ivtmp.92, ivtmp.88_981
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d8-d9}, [fp:128]	@ _1221, MEM[(short int[8] *)&augmented + 112B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d28-d29}, [r4:128]	@ _1236, MEM[(const short int[8] *)&identity_q12 + 64B]
	add	r4, r0, #80	@ tmp964, input,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r9, r3	@ ivtmp.93, ivtmp.88_981
	mov	lr, r3	@ ivtmp.88, ivtmp.88_981
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d26-d27}, [r4]	@ _1246, MEM[(const short int[8] *)_1244]
	add	r4, r2, #80	@ tmp968, tmp938,
	vld1.16	{d24-d25}, [r4:128]	@ _1251, MEM[(const short int[8] *)&identity_q12 + 80B]
	add	r4, r0, #96	@ tmp970, input,
	adds	r0, r0, #112	@ tmp976, input,
	vld1.16	{d16-d17}, [r0]	@ _1276, MEM[(const short int[8] *)_1274]
	add	r0, r2, #96	@ tmp974, tmp938,
	adds	r2, r2, #112	@ tmp980, tmp938,
	vld1.16	{d20-d21}, [r4]	@ _1261, MEM[(const short int[8] *)_1259]
	vld1.16	{d22-d23}, [r2:128]	@ _1281, MEM[(const short int[8] *)&identity_q12 + 112B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	add	r2, r3, #64	@ tmp947, ivtmp.88_981,
	movs	r4, #0	@ ivtmp.83,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r0:128]	@ _1266, MEM[(const short int[8] *)&identity_q12 + 96B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d14-d15}, [r2:128]	@ _1201, MEM[(short int[8] *)&augmented + 64B]
	add	r2, r3, #80	@ tmp1742, ivtmp.88_981,
	add	r0, r3, #208	@ tmp1746, ivtmp.88_981,
	str	r2, [sp]	@ tmp1742, %sfp
	vst1.16	{d12-d13}, [r2:128]	@ _1206, MEM[(short int[8] *)&augmented + 80B]
	add	r2, r3, #96	@ tmp953, ivtmp.88_981,
	vst1.16	{d22-d23}, [r5:128]	@ _1281, MEM[(short int[8] *)&augmented + 240B]
	vst1.16	{d10-d11}, [r2:128]	@ _1216, MEM[(short int[8] *)&augmented + 96B]
	add	r2, r3, #128	@ tmp959, ivtmp.88_981,
	vst1.16	{d30-d31}, [r2:128]	@ _1231, MEM[(short int[8] *)&augmented + 128B]
	add	r2, r3, #160	@ tmp965, ivtmp.88_981,
	vst1.16	{d28-d29}, [r7:128]	@ _1236, MEM[(short int[8] *)&augmented + 144B]
	vst1.16	{d26-d27}, [r2:128]	@ _1246, MEM[(short int[8] *)&augmented + 160B]
	str	fp, [sp, #12]	@ tmp1743, %sfp
	add	r2, r3, #192	@ tmp971, ivtmp.88_981,
	vst1.16	{d24-d25}, [r6:128]	@ _1251, MEM[(short int[8] *)&augmented + 176B]
	vst1.16	{d20-d21}, [r2:128]	@ _1261, MEM[(short int[8] *)&augmented + 192B]
	vst1.16	{d18-d19}, [r0:128]	@ _1266, MEM[(short int[8] *)&augmented + 208B]
	add	r2, r3, #224	@ tmp977, ivtmp.88_981,
	mov	fp, r3	@ ivtmp.88_981, ivtmp.88_981
	strd	r1, r8, [sp, #4]	@ tmp1740, tmp1741,,
	vst1.16	{d16-d17}, [r2:128]	@ _1276, MEM[(short int[8] *)&augmented + 224B]
	mov	r8, ip	@ inverse, inverse
@ matrix_optimized.c:590:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	mov	r2, r4	@ pivot_column, ivtmp.83
	strd	r7, r6, [sp, #16]	@ tmp1744, tmp1745,,
	strd	r0, r5, [sp, #24]	@ tmp1746, tmp1747,,
.L266:
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r1, [lr]	@ widened_value, MEM[(short int *)_1016]
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #7	@ pivot_column,
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	add	ip, r2, #1	@ row, pivot_column,
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asr	r3, r1, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eor	r1, r1, r3	@ _122, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	sub	r1, r1, r3	@ _123, _122, sign_mask
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L844		@,
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r3, [lr, #32]	@ widened_value, MEM[(short int *)_1016 + 32B]
	adds	r6, r2, #2	@ _147, pivot_column,
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r0, r3, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r3, r3, r0	@, _1093, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r3, r3, r0	@ largest_value, _1093, sign_mask
@ matrix_optimized.c:609:             if (current_value > largest_value) {
	cmp	r1, r3	@ _123, largest_value
@ matrix_optimized.c:603:         largest_value = fixed_absolute(augmented[pivot_column][pivot_column]);
	itet	ge
	movge	r3, r1	@ largest_value, _123
@ matrix_optimized.c:611:                 pivot_row     = row;
	movlt	r1, ip	@ pivot_row, row
@ matrix_optimized.c:602:         pivot_row     = pivot_column;
	movge	r1, r2	@ pivot_row, pivot_column
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #6	@ pivot_column,
	beq	.L845		@,
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r0, [lr, #64]	@ widened_value, MEM[(short int *)_1016 + 64B]
	adds	r7, r2, #3	@ _127, pivot_column,
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r5, r0, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r0, r0, r5	@, _1104, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r0, r0, r5	@ _1105, _1104, sign_mask
@ matrix_optimized.c:610:                 largest_value = current_value;
	cmp	r3, r0	@ largest_value, _1105
	itt	lt
	movlt	r1, r6	@ pivot_row, _147
	movlt	r3, r0	@ largest_value, _1105
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #5	@ pivot_column,
	beq	.L846		@,
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r0, [lr, #96]	@ widened_value, MEM[(short int *)_1016 + 96B]
	adds	r6, r2, #4	@ _102, pivot_column,
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r5, r0, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r0, r0, r5	@, _1115, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r0, r0, r5	@ _1116, _1115, sign_mask
@ matrix_optimized.c:610:                 largest_value = current_value;
	cmp	r3, r0	@ largest_value, _1116
	itt	lt
	movlt	r1, r7	@ pivot_row, _127
	movlt	r3, r0	@ largest_value, _1116
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #4	@ pivot_column,
	beq	.L847		@,
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r0, [lr, #128]	@ widened_value, MEM[(short int *)_1016 + 128B]
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r5, r0, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r0, r0, r5	@, _1126, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r0, r0, r5	@ _1127, _1126, sign_mask
@ matrix_optimized.c:609:             if (current_value > largest_value) {
	cmp	r3, r0	@ largest_value, _1127
	blt	.L848		@,
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #3	@ pivot_column,
	add	r5, r2, #5	@ row, pivot_column,
	beq	.L849		@,
.L21:
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r0, [lr, #160]	@ widened_value, MEM[(short int *)_1016 + 160B]
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r6, r0, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r0, r0, r6	@, _1137, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r0, r0, r6	@ _1138, _1137, sign_mask
	adds	r6, r2, #6	@ row, pivot_column,
@ matrix_optimized.c:609:             if (current_value > largest_value) {
	cmp	r0, r3	@ _1138, largest_value
	ble	.L22		@,
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #2	@ pivot_column,
@ matrix_optimized.c:611:                 pivot_row     = row;
	it	ne
	movne	r1, r5	@ pivot_row, row
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L850		@,
.L23:
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r3, [lr, #192]	@ widened_value, MEM[(short int *)_1016 + 192B]
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r5, r3, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r3, r3, r5	@, _1148, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r3, r3, r5	@ _1149, _1148, sign_mask
@ matrix_optimized.c:609:             if (current_value > largest_value) {
	cmp	r3, r0	@ _1149, _1138
	ble	.L24		@,
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r4, #1	@ ivtmp.83,
@ matrix_optimized.c:610:                 largest_value = current_value;
	itt	ne
	movne	r0, r3	@ _1138, _1149
@ matrix_optimized.c:611:                 pivot_row     = row;
	movne	r1, r6	@ pivot_row, row
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	beq	.L851		@,
.L25:
@ matrix_optimized.c:180:     int32_t widened_value = value;
	ldrsh	r3, [fp, #224]	@ widened_value, augmented[7][0]
@ matrix_optimized.c:181:     int32_t sign_mask     = widened_value >> 31;
	asrs	r5, r3, #31	@ sign_mask, widened_value,
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	eors	r3, r3, r5	@, _1159, widened_value, sign_mask
@ matrix_optimized.c:183:     return (widened_value ^ sign_mask) - sign_mask;
	subs	r3, r3, r5	@ _1160, _1159, sign_mask
@ matrix_optimized.c:609:             if (current_value > largest_value) {
	cmp	r3, r0	@ _1160, _1138
	ble	.L27		@,
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cbz	r3, .L14	@ _1160,
	movs	r3, #240	@ _1384,
	movs	r1, #224	@ prephitmp_1385,
.L28:
@ matrix_optimized.c:634:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r3, r3, fp	@ _396, ivtmp.88_981
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r0, r9	@ _1227, ivtmp.93
@ matrix_optimized.c:633:             int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
	add	r1, r1, fp	@ _350, ivtmp.88_981
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r0:128]!	@ _1203, MEM[(const short int[8] *)_1181]
	vld1.16	{d16-d17}, [r3:128]	@ _1178, MEM[(const short int[8] *)_396]
	vld1.16	{d18-d19}, [r1:128]	@ _376, MEM[(const short int[8] *)_350]
	vld1.16	{d20-d21}, [r0:128]	@ _1249, MEM[(const short int[8] *)_1227]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [r1:128]	@ _1203, MEM[(short int[8] *)_350]
	vst1.16	{d20-d21}, [r3:128]	@ _1249, MEM[(short int[8] *)_396]
	vst1.16	{d18-d19}, [r9:128]	@ _376, MEM[(short int[8] *)_1181]
	vst1.16	{d16-d17}, [r0:128]	@ _1178, MEM[(short int[8] *)_1227]
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [lr]	@ pivot_value, MEM[(short int *)_1016]
@ matrix_optimized.c:271:     if (denominator == 0) {
	cbnz	r3, .L749	@ pivot_value,
.L14:
@ matrix_optimized.c:620:             return MATRIX_SINGULAR;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:813: }
	add	sp, sp, #380	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L848:
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #3	@ pivot_column,
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	mov	r1, r6	@ pivot_row, _102
	add	r5, r2, #5	@ row, pivot_column,
@ matrix_optimized.c:610:                 largest_value = current_value;
	it	ne
	movne	r3, r0	@ largest_value, _1127
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	bne	.L21		@,
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r0, #0	@ _1127
	bne	.L15	@
	b	.L14		@
.L749:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #2]	@ _452,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _452
	beq	.L852	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L53		@,
.L290:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r5, #0	@ _602, _452
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L70		@,
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _594, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _595, _594, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, _452,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _599, quotient_sign_mask, _595,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_600, _599, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5, lsl #12	@ _601, rounding_term_600, _452,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r0, r3	@ _602, _601, pivot_value
.L70:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _587, _602,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _587,
	bcc	.L853		@,
.L43:
@ matrix_optimized.c:671:                 return MATRIX_OVERFLOW;
	mov	r0, #-1	@ <retval>,
@ matrix_optimized.c:813: }
	add	sp, sp, #380	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L22:
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r2, #2	@ pivot_column,
	it	ne
	movne	r0, r3	@ _1138, largest_value
	bne	.L23		@,
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r3, #0	@ largest_value
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cmp	r1, #2	@ pivot_row,
	bne	.L15		@,
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [fp, #68]	@ pivot_value, augmented[2][2]
.L11:
@ matrix_optimized.c:271:     if (denominator == 0) {
	cmp	r3, #0	@ pivot_value
	beq	.L14	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9]	@ _546, MEM[(short int *)_1257]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _546
	beq	.L854	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L47		@,
.L33:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r5, #0	@ _568, _546
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L49		@,
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _560, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _561, _560, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, _546,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _565, quotient_sign_mask, _561,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_566, _565, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5, lsl #12	@ _567, rounding_term_566, _546,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r0, r3	@ _568, _567, pivot_value
.L49:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _553, _568,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _553,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9]	@ movhi	@ _568, MEM[(short int *)_2676]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #1	@ ivtmp.83,
	bne	.L855		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #4]	@ _150, MEM[(short int *)_2676 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _150
	beq	.L856	@
.L83:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2614, _150
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L857		@,
.L42:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r5, r5, #12	@ scaled_numerator, _2614,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _628, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _629, _628, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _633, quotient_sign_mask, _629,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_634, _633, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5	@ _635, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r0, r3	@ _636, _635, pivot_value
.L101:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _621, _636,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _621,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _636, MEM[(short int *)_1308 + 4B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #3	@ ivtmp.83,
	bne	.L44		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1555, MEM[(short int *)_1308 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1555
	beq	.L858	@
.L135:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _649, _1555
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L859		@,
.L96:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r5, r5, #12	@ scaled_numerator, _649,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _696, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _697, _696, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _701, quotient_sign_mask, _697,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_702, _701, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	adds	r1, r0, r5	@ _703, rounding_term_702, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r1, r3	@ _704, _703, pivot_value
.L144:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _689, _704,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _689,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _704, MEM[(short int *)_1346 + 8B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #5	@ ivtmp.83,
	bne	.L97		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _918, MEM[(short int *)_1346 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _918
	beq	.L860	@
.L174:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2073, _918
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L861		@,
.L139:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r5, r5, #12	@ scaled_numerator, _2073,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _764, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _765, _764, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _769, quotient_sign_mask, _765,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_770, _769, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	adds	r1, r0, r5	@ _771, rounding_term_770, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r1, r3	@ _772, _771, pivot_value
.L179:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _757, _772,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _757,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _772, MEM[(short int *)_1373 + 12B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #7	@ ivtmp.83,
	bne	.L156		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #240]	@ _754, augmented[7][8]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	beq	.L862	@
.L183:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _685, _754
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L190		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
.L305:
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r5, r5, #12	@ scaled_numerator, _685,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _832, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _833, _832, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r6, r0, asr #1	@ _837, quotient_sign_mask, _833,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r6	@ rounding_term_838, _837, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5	@ _839, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r0, r3	@ _840, _839, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _825, _840,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _825,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #16]	@ movhi	@ _840, MEM[(short int *)_1437 + 16B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #18]	@ _1469, MEM[(short int *)_1437 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1469
	beq	.L195	@
.L196:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r5, r3, r1	@ _866, pivot_value, denominator_mask
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r0, r0, #12	@ scaled_numerator, _717,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r5, r5, r1	@ _867, _866, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r0, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r5, #1	@ half_denominator, _867,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r5, r7, r6	@ _871, half_denominator, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	subs	r5, r5, r6	@ rounding_term_872, _871, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r5, r5, r0	@ _873, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r5, r3	@ _874, _873, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _1121, _874,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _1121,
	bcs	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_643 + 20B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #18]	@ movhi	@ _874, MEM[(short int *)_643 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	beq	.L863	@
.L209:
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, _745,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r6, r7	@ _905, quotient_sign_mask, half_denominator
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r6	@ rounding_term_906, _905, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5, lsl #12	@ _907, rounding_term_906, _745,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r0, r3	@ _908, _907, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _267, _908,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _267,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #20]	@ movhi	@ _908, MEM[(short int *)_571 + 20B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_571 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	beq	.L864	@
.L218:
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r0, asr #31	@ quotient_sign_mask, denominator_mask, _173,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r5, r6, r7	@ _939, quotient_sign_mask, half_denominator
@ matrix_optimized.c:318:     rounding_term =
	subs	r5, r5, r6	@ rounding_term_940, _939, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r5, r5, r0, lsl #12	@ _941, rounding_term_940, _173,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r5, r3	@ _942, _941, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _66, _942,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _66,
	bcs	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_528 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _942, MEM[(short int *)_528 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	beq	.L865	@
.L227:
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, _415,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r7, r6	@ _973, half_denominator, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r6	@ rounding_term_974, _973, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5, lsl #12	@ _975, rounding_term_974, _415,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r0, r3	@ _976, _975, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _364, _976,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _364,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #24]	@ movhi	@ _976, MEM[(short int *)_448 + 24B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_448 + 26B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	beq	.L235	@
.L236:
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r0, asr #31	@ quotient_sign_mask, denominator_mask, _236,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r5, r7, r6	@ _1007, half_denominator, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	subs	r5, r5, r6	@ rounding_term_1008, _1007, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r5, r5, r0, lsl #12	@ _1009, rounding_term_1008, _236,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r5, r3	@ _1010, _1009, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _1167, _1010,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _1167,
	bcs	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336, MEM[(short int *)_408 + 28B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #26]	@ movhi	@ _1010, MEM[(short int *)_408 + 26B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _336
	beq	.L866	@
.L247:
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, _336,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r7, r6	@ _1041, half_denominator, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r6	@ rounding_term_1042, _1041, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r0, r0, r5, lsl #12	@ _1043, rounding_term_1042, _336,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r0, r3	@ _1044, _1043, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _51, _1044,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _51,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #28]	@ movhi	@ _1044, MEM[(short int *)_377 + 28B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #30]	@ _1226, MEM[(short int *)_377 + 30B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1226
	beq	.L248	@
.L253:
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r0, asr #31	@ quotient_sign_mask, denominator_mask, _1226,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r5, r7, r1	@ _1075, half_denominator, quotient_sign_mask
@ matrix_optimized.c:318:     rounding_term =
	subs	r5, r5, r1	@ rounding_term_1076, _1075, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r5, r5, r0, lsl #12	@ _1077, rounding_term_1076, _1226,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r3, r5, r3	@ division_result, _1077, pivot_value
.L256:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r1, r3, #32768	@ _1063, division_result,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r1, #65536	@ _1063,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	sxth	r0, r3	@ _1226, division_result
.L252:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #30]	@ movhi	@ _1226, MEM[(short int *)_355 + 30B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, r9	@ tmp1383, ivtmp.93
@ matrix_optimized.c:678:         augmented[pivot_column][pivot_column] = FIXED_ONE;
	mov	r1, #4096	@ tmp1382,
	strh	r1, [lr]	@ movhi	@ tmp1382, MEM[(short int *)_1016]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d10-d11}, [r3:128]!	@ _114, MEM[(const short int[8] *)_355]
	vld1.16	{d8-d9}, [r3:128]	@ _113, MEM[(const short int[8] *)_19]
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r3, [r10], #2	@ factor, MEM[(short int *)_1088]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r3, #0	@ factor,
	it	ne		@
	cmpne	r4, #0	@, ivtmp.83,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	ittte	ne
	strhne	r3, [sp, #68]	@ movhi	@ factor, target_factor[0]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	movne	r1, #0	@ tmp1390,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	strne	r1, [sp, #84]	@ tmp1390, target_row[0]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	moveq	r1, #1	@ tmp1390,
@ matrix_optimized.c:711:             target_count++;
	it	ne
	movne	r3, #1	@ target_count,
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	beq	.L867		@,
.L254:
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r5, [r10, #30]	@ factor, MEM[(short int *)_1098 + 30B]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r5, #0	@ factor,
	it	ne		@
	cmpne	r4, #1	@, ivtmp.83,
	beq	.L257		@,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	add	r0, sp, #84	@ tmp1739,,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r5, [r1, r3, lsl #1]	@ movhi	@ factor, target_factor[target_count_449]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r1, #1	@ tmp1418,
	str	r1, [r0, r3, lsl #2]	@ tmp1418, target_row[target_count_449]
@ matrix_optimized.c:711:             target_count++;
	add	r3, r3, r1	@ target_count,
.L257:
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r5, [r10, #62]	@ factor, MEM[(short int *)_1098 + 62B]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r5, #0	@ factor,
	it	ne		@
	cmpne	r4, #2	@, ivtmp.83,
	beq	.L258		@,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	add	r0, sp, #84	@ tmp1739,,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r5, [r1, r3, lsl #1]	@ movhi	@ factor, target_factor[target_count_462]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r1, #2	@ tmp1433,
	str	r1, [r0, r3, lsl #2]	@ tmp1433, target_row[target_count_462]
@ matrix_optimized.c:711:             target_count++;
	adds	r3, r3, #1	@ target_count, target_count,
.L258:
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r5, [r10, #94]	@ factor, MEM[(short int *)_1098 + 94B]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r5, #0	@ factor,
	it	ne		@
	cmpne	r4, #3	@, ivtmp.83,
	beq	.L259		@,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	add	r0, sp, #84	@ tmp1739,,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r5, [r1, r3, lsl #1]	@ movhi	@ factor, target_factor[target_count_475]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r1, #3	@ tmp1448,
	str	r1, [r0, r3, lsl #2]	@ tmp1448, target_row[target_count_475]
@ matrix_optimized.c:711:             target_count++;
	adds	r3, r3, #1	@ target_count, target_count,
.L259:
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r5, [r10, #126]	@ factor, MEM[(short int *)_1098 + 126B]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r5, #0	@ factor,
	it	ne		@
	cmpne	r4, #4	@, ivtmp.83,
	beq	.L260		@,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	add	r0, sp, #84	@ tmp1739,,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r5, [r1, r3, lsl #1]	@ movhi	@ factor, target_factor[target_count_488]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r1, #4	@ tmp1463,
	str	r1, [r0, r3, lsl #2]	@ tmp1463, target_row[target_count_488]
@ matrix_optimized.c:711:             target_count++;
	adds	r3, r3, #1	@ target_count, target_count,
.L260:
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r5, [r10, #158]	@ factor, MEM[(short int *)_1098 + 158B]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r5, #0	@ factor,
	it	ne		@
	cmpne	r4, #5	@, ivtmp.83,
	beq	.L261		@,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	add	r0, sp, #84	@ tmp1739,,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r5, [r1, r3, lsl #1]	@ movhi	@ factor, target_factor[target_count_501]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r1, #5	@ tmp1478,
	str	r1, [r0, r3, lsl #2]	@ tmp1478, target_row[target_count_501]
@ matrix_optimized.c:711:             target_count++;
	adds	r3, r3, #1	@ target_count, target_count,
.L261:
@ matrix_optimized.c:703:             int16_t factor = augmented[row][pivot_column];
	ldrsh	r5, [r10, #222]	@ pretmp_752, MEM[(short int *)_1098 + 222B]
	ldrsh	r6, [r10, #190]	@ factor, MEM[(short int *)_1098 + 190B]
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r5, #0	@ pretmp_752,
	it	ne		@
	cmpne	r4, #7	@, ivtmp.83,
	ite	eq
	moveq	r7, #1	@ _718,
	movne	r7, #0	@ _718,
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r6, #0	@ factor,
	it	ne		@
	cmpne	r4, #6	@, ivtmp.83,
	beq	.L262		@,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	add	r0, sp, #84	@ tmp1739,,
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r6, [r1, r3, lsl #1]	@ movhi	@ factor, target_factor[target_count_514]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r6, #6	@ tmp1498,
	str	r6, [r0, r3, lsl #2]	@ tmp1498, target_row[target_count_514]
@ matrix_optimized.c:711:             target_count++;
	adds	r3, r3, #1	@ target_count, target_count,
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cbnz	r7, .L263	@ _718,
.L264:
@ matrix_optimized.c:710:             target_factor[target_count] = factor;
	strh	r5, [r1, r3, lsl #1]	@ movhi	@ pretmp_752, target_factor[target_count_1439]
@ matrix_optimized.c:709:             target_row[target_count]    = row;
	movs	r5, #7	@ tmp1506,
	str	r5, [r0, r3, lsl #2]	@ tmp1506, target_row[target_count_1439]
@ matrix_optimized.c:711:             target_count++;
	adds	r3, r3, #1	@ target_count, target_count,
.L263:
@ matrix_optimized.c:738:             stage_pointer = &augmented[target_row[0]][0];
	ldr	r5, [r0]	@ _23, target_row[0]
@ matrix_optimized.c:744:             for (index = 1; index < target_count; index++) {
	cmp	r3, #1	@ target_count,
@ matrix_optimized.c:741:             stage_factor  = target_factor[0];
	ldrsh	r6, [r1]	@ next_factor, target_factor[0]
@ matrix_optimized.c:738:             stage_pointer = &augmented[target_row[0]][0];
	add	r7, fp, r5, lsl #5	@ next_pointer, ivtmp.88_981, _23,
@ matrix_optimized.c:741:             stage_factor  = target_factor[0];
	str	r6, [sp, #40]	@ next_factor, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r6, r7	@ _26, next_pointer
@ matrix_optimized.c:744:             for (index = 1; index < target_count; index++) {
	vmov.i32	q8, #0  @ v4si	@ prephitmp_753,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d28-d29}, [r6:128]!	@ _118, MEM[(const short int[8] *)stage_pointer_82]
	vld1.16	{d18-d19}, [r6:128]	@ _117, MEM[(const short int[8] *)_24]
@ matrix_optimized.c:744:             for (index = 1; index < target_count; index++) {
	beq	.L268		@,
@ matrix_optimized.c:715:         overflow_b = vdupq_n_s32(0);
	vmov.i32	q6, #0  @ v4si	@ overflow_b,
	add	r6, r0, r3, lsl #2	@ _920, tmp1739, target_count,
	str	r1, [sp, #44]	@ tmp1738, %sfp
	add	r1, sp, #88	@ ivtmp.75,,
@ matrix_optimized.c:714:         overflow_a = vdupq_n_s32(0);
	vmov	q15, q6  @ v4si	@ overflow_a, overflow_b
	strd	r5, ip, [sp, #48]	@ _23, row,,
	str	lr, [sp, #60]	@ ivtmp.88, %sfp
	mov	lr, r6	@ _920, _920
	ldr	r5, [sp, #40]	@ next_factor, %sfp
	ldr	ip, [sp, #44]	@ ivtmp.78, %sfp
	str	r3, [sp, #56]	@ target_count, %sfp
	str	r4, [sp, #44]	@ ivtmp.83, %sfp
.L269:
@ matrix_optimized.c:747:                 next_pointer = &augmented[target_row[index]][0];
	ldr	r6, [r1], #4	@ _25, MEM[(int *)_808]
	mov	r4, r5	@ stage_factor, next_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q12, d28, #12	@ _207, stage_low,
	vshll.s16	q10, d29, #12	@ _209, stage_low,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d6[0], r4	@ tmp1522,, stage_factor
	vmov.16	d5[0], r4	@ tmp1523,, stage_factor
	vmlsl.s16	q12, d10, d6[0]	@ _211, _114, tmp1522,
	vmov.16	d3[0], r4	@ tmp1528,, stage_factor
	vmlsl.s16	q10, d11, d5[0]	@ _213, _114, tmp1523,
	vmov.16	d4[0], r4	@ tmp1527,, stage_factor
@ matrix_optimized.c:750:                 next_factor  = target_factor[index];
	ldrsh	r5, [ip, #2]!	@ next_factor, MEM[(short int *)_809]
	mov	r3, r7	@ stage_pointer, next_pointer
@ matrix_optimized.c:747:                 next_pointer = &augmented[target_row[index]][0];
	add	r7, fp, r6, lsl #5	@ next_pointer, ivtmp.88_981, _25,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q12, q12, #12	@ _214, _211,
@ matrix_optimized.c:744:             for (index = 1; index < target_count; index++) {
	cmp	r1, lr	@ ivtmp.75, _920
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r6, r7	@ _26, next_pointer
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q10, q10, #12	@ _215, _213,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d17, q12	@ _223, _214
	vmovn.i32	d14, q10	@ _224, _215
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d28-d29}, [r6:128]!	@ _118, MEM[(const short int[8] *)next_pointer_88]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d15, d14  @ v4hi	@ _225, _224
	vmov	d14, d17  @ v4hi	@ _225, _223
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q8, d18, #12	@ _187, stage_high,
	vshll.s16	q9, d19, #12	@ _189, stage_high,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q8, d8, d4[0]	@ _191, _113, tmp1527,
	vmlsl.s16	q9, d9, d3[0]	@ _193, _113, tmp1528,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q8, q8, #12	@ _194, _191,
	vrshr.s32	q9, q9, #12	@ _195, _193,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d26, q8	@ _203, _194
	vmovn.i32	d23, q9	@ _204, _195
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d27, d23  @ v4hi	@ _205, _204
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q11, q12, #31	@ _217, _214,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q12, q12, q11	@ _218, _214, _217
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q11, q10, #31	@ _219, _215,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q10, q10, q11	@ _220, _215, _219
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q10, q12, q10	@ _221, _218, _220
	vorr	q15, q15, q10	@ overflow_a, overflow_a, _221
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q8, #31	@ _197, _194,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q8, q8, q10	@ _198, _194, _197
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q10, q9, #31	@ _199, _195,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q10	@ _200, _195, _199
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q9	@ _201, _198, _200
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d18-d19}, [r6:128]	@ _117, MEM[(const short int[8] *)_26]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d14-d15}, [r3]!	@ _225, MEM[(short int[8] *)stage_pointer_2588]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q6, q6, q8	@ overflow_b, overflow_b, _201
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d26-d27}, [r3:128]	@ _205, MEM[(short int[8] *)_28]
@ matrix_optimized.c:744:             for (index = 1; index < target_count; index++) {
	bne	.L269		@,
	vorr	q8, q6, q15	@ prephitmp_753, overflow_b, overflow_a
	str	r5, [sp, #40]	@ next_factor, %sfp
	ldr	ip, [sp, #52]	@ row, %sfp
	ldr	r5, [sp, #48]	@ _23, %sfp
	ldr	r3, [sp, #56]	@ target_count, %sfp
	ldr	r4, [sp, #44]	@ ivtmp.83, %sfp
	ldr	lr, [sp, #60]	@ ivtmp.88, %sfp
.L268:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	ldr	r1, [sp, #40]	@ next_factor, %sfp
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	cmp	r3, #1	@ target_count,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q12, d28, #12	@ _247, _118,
	vshll.s16	q10, d29, #12	@ _249, _118,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmov.16	d2[0], r1	@ tmp1533,, next_factor
	vmov.16	d1[0], r1	@ tmp1534,, next_factor
	vmlsl.s16	q12, d10, d2[0]	@ _251, _114, tmp1533,
	vldr	d7, [sp, #32]	@, %sfp
	vmlsl.s16	q10, d11, d1[0]	@ _253, _114, tmp1534,
	vmov.16	d0[0], r1	@ tmp1535,, next_factor
	vmov.16	d7[0], r1	@ tmp1536,, next_factor
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q12, q12, #12	@ _254, _251,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	add	r5, r2, r5, lsl #4	@ tmp1540, pivot_column, _23,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q10, q10, #12	@ _255, _253,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q15, q12, #31	@ _257, _254,
	vshr.s32	q13, q10, #31	@ _259, _255,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d23, q12	@ _263, _254
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q14, q10, q13	@ _260, _255, _259
	veor	q15, q12, q15	@ _258, _254, _257
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q13, d19, #12	@ _229, _117,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d24, q10	@ _264, _255
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:5177:   return (int32x4_t)__builtin_neon_vshlls_nv4hi (__a, __b);
	vshll.s16	q10, d18, #12	@ _227, _117,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q13, d9, d7[0]	@ _233, _113, tmp1536,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d25, d24  @ v4hi	@ _265, _264
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vmlsl.s16	q10, d8, d0[0]	@ _231, _113, tmp1535,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d24, d23  @ v4hi	@ _265, _263
	vorr	q15, q15, q14	@ _1447, _258, _260
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [r7:128]	@ _265, MEM[(short int[8] *)stage_pointer_1395]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:8734:   return (int32x4_t)__builtin_neon_vmlsls_nv4hi (__a, __b, (__builtin_neon_hi) __c);
	vstr	d7, [sp, #32]	@, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4638:   return (int32x4_t)__builtin_neon_vrshrs_nv4si (__a, __b);
	vrshr.s32	q9, q10, #12	@ _234, _231,
	vrshr.s32	q10, q13, #12	@ _235, _233,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d23, q9	@ _243, _234
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:4526:   return (int32x4_t)__builtin_neon_vshrs_nv4si (__a, __b);
	vshr.s32	q12, q10, #31	@ _239, _235,
	vshr.s32	q14, q9, #31	@ _237, _234,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q12, q10, q12	@ _240, _235, _239
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7600:   return (int16x4_t)__builtin_neon_vmovnv4si (__a);
	vmovn.i32	d20, q10	@ _244, _235
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15436:   return __a ^ __b;
	veor	q9, q9, q14	@ _238, _234, _237
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7189:   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
	vmov	d21, d20  @ v4hi	@ _245, _244
	vmov	d20, d23  @ v4hi	@ _245, _243
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d20-d21}, [r6:128]	@ _245, MEM[(short int[8] *)prephitmp_786]
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	mov	r6, #0	@ tmp1542,
	strh	r6, [fp, r5, lsl #1]	@ movhi	@ tmp1542, augmented[_23][pivot_column_2617]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	beq	.L271		@,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r1, [r0, #4]	@ target_row[1], target_row[1]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	cmp	r3, #2	@ target_count,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	add	r1, r2, r1, lsl #4	@ tmp1548, pivot_column, target_row[1],
	strh	r6, [fp, r1, lsl #1]	@ movhi	@ tmp1542, augmented[_411][pivot_column_2617]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	beq	.L271		@,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r1, [r0, #8]	@ target_row[2], target_row[2]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	cmp	r3, #3	@ target_count,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	add	r1, r2, r1, lsl #4	@ tmp1556, pivot_column, target_row[2],
	strh	r6, [fp, r1, lsl #1]	@ movhi	@ tmp1542, augmented[_416][pivot_column_2617]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	beq	.L271		@,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r1, [r0, #12]	@ target_row[3], target_row[3]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	cmp	r3, #4	@ target_count,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	add	r1, r2, r1, lsl #4	@ tmp1564, pivot_column, target_row[3],
	strh	r6, [fp, r1, lsl #1]	@ movhi	@ tmp1542, augmented[_421][pivot_column_2617]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	beq	.L271		@,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r1, [r0, #16]	@ target_row[4], target_row[4]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	cmp	r3, #5	@ target_count,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	add	r1, r2, r1, lsl #4	@ tmp1572, pivot_column, target_row[4],
	strh	r6, [fp, r1, lsl #1]	@ movhi	@ tmp1542, augmented[_426][pivot_column_2617]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	beq	.L271		@,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	ldr	r1, [r0, #20]	@ target_row[5], target_row[5]
@ matrix_optimized.c:787:             for (index = 0; index < target_count; index++) {
	cmp	r3, #7	@ target_count,
@ matrix_optimized.c:788:                 augmented[target_row[index]][pivot_column] = 0;
	it	eq
	ldreq	r3, [r0, #24]	@ target_row[6], target_row[6]
	add	r1, r2, r1, lsl #4	@ tmp1580, pivot_column, target_row[5],
	it	eq
	addeq	r3, r2, r3, lsl #4	@ tmp1588, pivot_column, target_row[6],
	strh	r6, [fp, r1, lsl #1]	@ movhi	@ tmp1542, augmented[_431][pivot_column_2617]
	it	eq
	strheq	r6, [fp, r3, lsl #1]	@ movhi	@ tmp1542, augmented[_436][pivot_column_2617]
.L271:
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15324:   return __a | __b;
	vorr	q8, q8, q15	@ _1477, prephitmp_753, _1447
	vorr	q8, q8, q9	@ _1473, _1477, _238
	vorr	q8, q8, q12	@ _130, _1473, _240
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:15289:   return __a | __b;
	vorr	d7, d17, d16	@ _135, _130, _130
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3924:   return (uint32x2_t)__builtin_neon_vpmaxuv2si ((int32x2_t) __a, (int32x2_t) __b);
	vpmax.u32	d7, d7, d7	@ _137, _135, _135
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6233:   return (uint32_t)__builtin_neon_vget_laneuv2si ((int32x2_t) __a, __b);
	vmov	r3, s14	@ int	@ _138, _137
@ matrix_optimized.c:796:             if (reduce_overflow(overflow_a, overflow_b)
	cmp	r3, #32768	@ _138,
	bcs	.L43		@,
.L273:
@ matrix_optimized.c:590:     for (pivot_column = 0; pivot_column < N; pivot_column++) {
	cmp	ip, #8	@ row,
	add	r4, r4, #1	@ ivtmp.83, ivtmp.83,
	add	lr, lr, #34	@ ivtmp.88, ivtmp.88,
	add	r9, r9, #32	@ ivtmp.93, ivtmp.93,
	bne	.L868		@,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	ldr	r3, [sp]	@ tmp1742, %sfp
	mov	ip, r8	@ inverse, inverse
	ldrd	r1, r8, [sp, #4]	@ tmp1740, tmp1741,,
	vld1.16	{d26-d27}, [r3:128]	@ _79, MEM[(const short int[8] *)&augmented + 80B]
	vld1.16	{d30-d31}, [r1:128]	@ _323, MEM[(const short int[8] *)&augmented + 16B]
	ldr	r5, [sp, #28]	@ tmp1747, %sfp
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	mov	r3, ip	@ tmp1596, inverse
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	ldrd	r6, r0, [sp, #20]	@ tmp1745, tmp1746,,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d30-d31}, [r3]!	@ _323, MEM[(short int[8] *)inverse_72(D)]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	ldrd	fp, r7, [sp, #12]	@ tmp1743, tmp1744,,
	vld1.16	{d28-d29}, [r8:128]	@ _27, MEM[(const short int[8] *)&augmented + 48B]
	vld1.16	{d16-d17}, [r5:128]	@ _401, MEM[(const short int[8] *)&augmented + 240B]
	vld1.16	{d18-d19}, [r0:128]	@ _391, MEM[(const short int[8] *)&augmented + 208B]
	vld1.16	{d24-d25}, [fp:128]	@ _361, MEM[(const short int[8] *)&augmented + 112B]
	vld1.16	{d22-d23}, [r7:128]	@ _371, MEM[(const short int[8] *)&augmented + 144B]
	vld1.16	{d20-d21}, [r6:128]	@ _381, MEM[(const short int[8] *)&augmented + 176B]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d28-d29}, [r3]	@ _27, MEM[(short int[8] *)_32]
	add	r5, ip, #64	@ tmp1602, inverse,
	add	r4, ip, #80	@ tmp1604, inverse,
	add	r1, ip, #96	@ tmp1606, inverse,
	add	r2, ip, #112	@ tmp1608, inverse,
	add	r3, ip, #32	@ tmp1598, inverse,
	add	ip, ip, #48	@ tmp1600, inverse,
@ matrix_optimized.c:812:     return MATRIX_SUCCESS;
	movs	r0, #1	@ <retval>,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d26-d27}, [r3]	@ _79, MEM[(short int[8] *)_302]
	vst1.16	{d24-d25}, [ip]	@ _361, MEM[(short int[8] *)_90]
	vst1.16	{d22-d23}, [r5]	@ _371, MEM[(short int[8] *)_368]
	vst1.16	{d20-d21}, [r4]	@ _381, MEM[(short int[8] *)_378]
	vst1.16	{d18-d19}, [r1]	@ _391, MEM[(short int[8] *)_388]
	vst1.16	{d16-d17}, [r2]	@ _401, MEM[(short int[8] *)_398]
@ matrix_optimized.c:813: }
	add	sp, sp, #380	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L24:
@ matrix_optimized.c:606:         for (row = pivot_column + 1; row < N; row++) {
	cmp	r4, #1	@ ivtmp.83,
	bne	.L25		@,
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r0, #0	@ _1138
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cmp	r1, #1	@ pivot_row,
	bne	.L15		@,
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [fp, #34]	@ pivot_value, augmented[1][1]
@ matrix_optimized.c:271:     if (denominator == 0) {
	cmp	r3, #0	@ pivot_value
	beq	.L14	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9]	@ _546, MEM[(short int *)_2640]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _546
	beq	.L31	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L33		@,
.L32:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #36]	@ _1655, augmented[1][2]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #4]	@ movhi	@ _1655, MEM[(short int *)_2677 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1655
	beq	.L51	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #6]	@ _2455,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2455
	beq	.L45	@
.L747:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #6]	@ movhi	@ _2463,
.L126:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_1726 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1248
	beq	.L869	@
.L82:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _1248, MEM[(short int *)_1334 + 8B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #5	@ ivtmp.83,
	bne	.L116		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #172]	@ _1052, augmented[5][6]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1052
	beq	.L145	@
.L802:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #12]	@ movhi	@ _1915,
.L121:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #14]	@ _493, MEM[(short int *)_1731 + 14B]
.L162:
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	bne	.L133	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #16]	@ _754, MEM[(short int *)_1081 + 16B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #14]	@ movhi	@ _493, MEM[(short int *)_1081 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L152	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #16]	@ movhi	@ _493, MEM[(short int *)_1037 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	bne	.L173	@
.L172:
	mov	r3, #4096	@ pivot_value,
.L198:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_645 + 20B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1258,
	strh	r1, [r9, #18]	@ movhi	@ tmp1258, MEM[(short int *)_645 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	beq	.L205	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L204		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L210		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
.L206:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r1, r3	@ _1423, denominator_mask, pivot_value
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _1284, _1423, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r0, #1	@ half_denominator, _1284,
	b	.L209		@
.L27:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r0, #0	@ _1138
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cbz	r1, .L29	@ pivot_row,
	lsls	r1, r1, #5	@ prephitmp_1385, pivot_row,
	add	r3, r1, #16	@ _1384, prephitmp_1385,
	b	.L28		@
.L29:
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [fp]	@ pivot_value, augmented[0][0]
@ matrix_optimized.c:271:     if (denominator == 0) {
	cmp	r3, #0	@ pivot_value
	beq	.L14	@
	b	.L749		@
.L852:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #2]	@ movhi	@ _452, MEM[(short int *)_1289 + 2B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #2	@ ivtmp.83,
	bne	.L62		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #70]	@ _1605, augmented[2][3]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1605
	beq	.L63	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L782		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #8]	@ _2308,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _1605, MEM[(short int *)_1289 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2308
	beq	.L67	@
.L783:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ _2316,
.L116:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_1728 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	bne	.L112	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _1715, MEM[(short int *)_9 + 10B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #6	@ ivtmp.83,
	bne	.L150		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [fp, #206]	@ _493, augmented[6][7]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	beq	.L806	@
.L133:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #16]	@ _754, MEM[(short int *)_1376 + 16B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #14]	@ movhi	@ _493, MEM[(short int *)_1376 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	beq	.L870	@
.L152:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #16]	@ movhi	@ _754, MEM[(short int *)_1407 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	beq	.L820	@
.L173:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_741 + 20B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r6, [r9, #18]	@ movhi	@ _1382, MEM[(short int *)_741 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	beq	.L871	@
.L204:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_639 + 22B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #20]	@ movhi	@ _745, MEM[(short int *)_639 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	beq	.L872	@
.L214:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_551 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _173, MEM[(short int *)_551 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	beq	.L838	@
.L222:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_519 + 26B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_519 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	beq	.L873	@
.L231:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336, MEM[(short int *)_439 + 28B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #26]	@ movhi	@ _236, MEM[(short int *)_439 + 26B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r5, .L811	@ _336,
.L239:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #28]	@ movhi	@ _336,
.L811:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #30]	@ _1226,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1226
	bne	.L252	@
.L248:
	movs	r0, #0	@ _1226,
	b	.L252		@
.L853:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #2]	@ movhi	@ _602, MEM[(short int *)_1295 + 2B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #2	@ ivtmp.83,
	bne	.L874		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1794, MEM[(short int *)_1793 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1794
	bne	.L782	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_2338 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1248
	bne	.L113	@
.L283:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _1248,
.L114:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_1351 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	beq	.L111	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L137		@,
	b	.L112		@
.L844:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r1, #0	@ _123
	beq	.L14	@
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [fp, #238]	@ pivot_value, augmented[7][7]
	b	.L11		@
.L854:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #1	@ ivtmp.83,
	bne	.L749		@,
.L31:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #36]	@ _1664, augmented[1][2]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1664
	beq	.L40	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L83		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #6]	@ _2463,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _1664, MEM[(short int *)_2675 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2463
	bne	.L747	@
.L45:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r3, #0	@ tmp1727,
	strh	r3, [r9, #6]	@ movhi	@ tmp1727, MEM[(short int *)_1778 + 6B]
.L315:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_1839 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1248
	bne	.L82	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _1248, MEM[(short int *)_2232 + 8B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #5	@ ivtmp.83,
	bne	.L108		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #172]	@ _319, augmented[5][6]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _319
	bne	.L803	@
	mov	r3, #4096	@ pivot_value,
.L109:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1615,
.L801:
	strh	r1, [r9, #12]	@ movhi	@ tmp1615,
.L167:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #14]	@ _493, MEM[(short int *)_1389 + 14B]
.L157:
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	beq	.L134	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L175		@,
	b	.L133		@
.L845:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r3, #0	@ largest_value
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cmp	r1, #6	@ pivot_row,
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	it	eq
	ldrsheq	r3, [fp, #204]	@ pivot_value, augmented[6][6]
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	beq	.L11		@,
.L15:
	lsls	r1, r1, #5	@ _612, pivot_row,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, r9	@ _1023, ivtmp.93
@ matrix_optimized.c:634:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r0, r1, #16	@ _347, _612,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r3:128]!	@ _844, MEM[(const short int[8] *)_708]
@ matrix_optimized.c:633:             int16x8_t a_low  = vld1q_s16(&augmented[pivot_row][0]);
	add	r1, r1, fp	@ _887, ivtmp.88_981
@ matrix_optimized.c:634:             int16x8_t a_high = vld1q_s16(&augmented[pivot_row][N]);
	add	r0, r0, fp	@ _709, ivtmp.88_981
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d20-d21}, [r3:128]	@ _1083, MEM[(const short int[8] *)_1023]
	vld1.16	{d18-d19}, [r1:128]	@ _640, MEM[(const short int[8] *)_887]
	vld1.16	{d16-d17}, [r0:128]	@ _743, MEM[(const short int[8] *)_709]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:12148:   __builtin_neon_vst1v8hi ((__builtin_neon_hi *) __a, __b);
	vst1.16	{d24-d25}, [r1:128]	@ _844, MEM[(short int[8] *)_887]
	vst1.16	{d20-d21}, [r0:128]	@ _1083, MEM[(short int[8] *)_709]
	vst1.16	{d18-d19}, [r9:128]	@ _640, MEM[(short int[8] *)_708]
	vst1.16	{d16-d17}, [r3:128]	@ _743, MEM[(short int[8] *)_1023]
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [lr]	@ pivot_value, MEM[(short int *)_1016]
	b	.L11		@
.L846:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r3, #0	@ largest_value
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cmp	r1, #5	@ pivot_row,
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	it	eq
	ldrsheq	r3, [fp, #170]	@ pivot_value, augmented[5][5]
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	bne	.L15		@,
	b	.L11		@
.L847:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r3, #0	@ largest_value
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cmp	r1, #4	@ pivot_row,
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	it	eq
	ldrsheq	r3, [fp, #136]	@ pivot_value, augmented[4][4]
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	bne	.L15		@,
	b	.L11		@
.L782:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2572, _1794
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L875		@,
.L65:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r5, r5, #12	@ scaled_numerator, _2572,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _662, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _663, _662, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _667, quotient_sign_mask, _663,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_668, _667, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	adds	r1, r0, r5	@ _669, rounding_term_668, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r1, r3	@ _670, _669, pivot_value
.L125:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _655, _670,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _655,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _670, MEM[(short int *)_1333 + 6B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #4	@ ivtmp.83,
	bne	.L66		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1357, MEM[(short int *)_1333 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1357
	beq	.L876	@
.L153:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2275, _1357
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L877		@,
.L118:
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:304:     scaled_numerator =
	lsls	r5, r5, #12	@ scaled_numerator, _2275,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r3, r1	@ _730, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _731, _730, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r1, r1, r5, asr #31	@ quotient_sign_mask, denominator_mask, scaled_numerator,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r0, r1, r0, asr #1	@ _735, quotient_sign_mask, _731,
@ matrix_optimized.c:318:     rounding_term =
	subs	r0, r0, r1	@ rounding_term_736, _735, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	adds	r1, r0, r5	@ _737, rounding_term_736, scaled_numerator
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r1, r1, r3	@ _738, _737, pivot_value
.L161:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r0, r1, #32768	@ _723, _738,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r0, #65536	@ _723,
	bcs	.L43		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _738, MEM[(short int *)_1353 + 10B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #6	@ ivtmp.83,
	bne	.L119		@,
.L156:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #14]	@ _493, MEM[(short int *)_1388 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	beq	.L878	@
.L175:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L187		@,
@ matrix_optimized.c:308:     denominator_mask = denominator_32 >> 31;
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r5, r3, r1	@ _798, pivot_value, denominator_mask
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r5, r5, r1	@ _799, _798, denominator_mask
@ matrix_optimized.c:317:     quotient_sign_mask = (scaled_numerator >> 31) ^ denominator_mask;
	eor	r6, r1, r0, asr #31	@ quotient_sign_mask, denominator_mask, _493,
@ matrix_optimized.c:319:         (half_denominator ^ quotient_sign_mask) - quotient_sign_mask;
	eor	r5, r6, r5, asr #1	@ _803, quotient_sign_mask, _799,
@ matrix_optimized.c:318:     rounding_term =
	subs	r5, r5, r6	@ rounding_term_804, _803, quotient_sign_mask
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	add	r5, r5, r0, lsl #12	@ _805, rounding_term_804, _493,
@ matrix_optimized.c:321:     *result = (scaled_numerator + rounding_term) / denominator_32;
	sdiv	r0, r5, r3	@ _806, _805, pivot_value
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	add	r5, r0, #32768	@ _791, _806,
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmp	r5, #65536	@ _791,
	bcs	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #16]	@ _712, MEM[(short int *)_1397 + 16B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #14]	@ movhi	@ _806, MEM[(short int *)_1397 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _712
	bne	.L305	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382, MEM[(short int *)_1154 + 18B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #16]	@ movhi	@ _712, MEM[(short int *)_1154 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	beq	.L198	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L173		@,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r0, r6	@ _717, _1382
	b	.L196		@
.L855:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #2]	@ _452, MEM[(short int *)_2676 + 2B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _452
	bne	.L290	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #2]	@ movhi	@ _452, MEM[(short int *)_2595 + 2B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #2	@ ivtmp.83,
	bne	.L291		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #70]	@ _1605, augmented[2][3]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1605
	bne	.L782	@
.L63:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_2372 + 8B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r0, #0	@ tmp1646,
	strh	r0, [r9, #6]	@ movhi	@ tmp1646, MEM[(short int *)_2678 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1248
	beq	.L283	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	it	eq
	strheq	r1, [r9, #8]	@ movhi	@ _1248, MEM[(short int *)_2381 + 8B]
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	beq	.L116		@,
.L113:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _649, _1248
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r1, #0	@ _704, _1248
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	bne	.L96		@,
	b	.L144		@
.L874:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #4]	@ _614, MEM[(short int *)_1295 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _614
	beq	.L879	@
.L87:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2614, _614
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r1, #0	@ _636, _614
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	bne	.L42		@,
	b	.L101		@
.L47:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #1	@ ivtmp.83,
	beq	.L32		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #2]	@ _452, MEM[(short int *)_1257 + 2B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _452
	beq	.L880	@
.L53:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #2]	@ movhi	@ _452, MEM[(short int *)_1269 + 2B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #2	@ ivtmp.83,
	bne	.L71		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #70]	@ _405, augmented[2][3]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _405
	beq	.L881	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #6]	@ movhi	@ _405, MEM[(short int *)_1774 + 6B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #8]	@ _2324, MEM[(short int *)_1774 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2324
	bne	.L783	@
.L789:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ tmp1719,
.L130:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_1836 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	beq	.L882	@
.L112:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _1715, MEM[(short int *)_1347 + 10B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #6	@ ivtmp.83,
	bne	.L99		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [fp, #206]	@ _493, augmented[6][7]
	b	.L162		@
.L858:
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_2200 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	beq	.L797	@
.L137:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2275, _1715
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r1, #0	@ _738, _1715
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	bne	.L118		@,
	b	.L161		@
.L900:
	.align	2
.L899:
	.word	.LANCHOR0-(.LPIC8+4)
.L879:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _614, MEM[(short int *)_2515 + 4B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #3	@ ivtmp.83,
	bne	.L44		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #104]	@ _1540, augmented[3][4]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1540
	bne	.L135	@
.L90:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_2218 + 10B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r0, #0	@ tmp1638,
	strh	r0, [r9, #8]	@ movhi	@ tmp1638, MEM[(short int *)_2214 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	beq	.L797	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L137		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _1715, MEM[(short int *)_2227 + 10B]
.L99:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_1730 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	beq	.L883	@
.L163:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _1717, MEM[(short int *)_1361 + 12B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #7	@ ivtmp.83,
	bne	.L121		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #240]	@ _754, augmented[7][8]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L152	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382, MEM[(short int *)_1361 + 18B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #16]	@ movhi	@ _754, MEM[(short int *)_1361 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	bne	.L173	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_1241 + 20B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r6, [r9, #18]	@ movhi	@ _1382, MEM[(short int *)_1241 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	bne	.L204	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_506 + 22B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #20]	@ movhi	@ _745, MEM[(short int *)_506 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	bne	.L214	@
	mov	r3, #4096	@ pivot_value,
.L215:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_543 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1300,
	strh	r1, [r9, #22]	@ movhi	@ tmp1300, MEM[(short int *)_543 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	beq	.L223	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L222		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L220		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
.L224:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r1, r3	@ _962, denominator_mask, pivot_value
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _960, _962, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r0, #1	@ half_denominator, _960,
	b	.L227		@
.L876:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_2003 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	beq	.L801	@
.L276:
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L803		@,
.L168:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2073, _1717
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r1, #0	@ _772, _1717
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	bne	.L139		@,
	b	.L179		@
.L877:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r1, #32768	@ _1357,
	beq	.L43		@,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r1, r1, #0	@ _2276, _1357
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _2276,
.L119:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_2683 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	bne	.L168	@
.L169:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #7	@ ivtmp.83,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	mov	r1, #0	@ tmp1193,
	strh	r1, [r9, #12]	@ movhi	@ tmp1193, MEM[(short int *)_1371 + 12B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	bne	.L167		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #240]	@ _754, augmented[7][8]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	beq	.L165	@
.L177:
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L183		@,
	b	.L152		@
.L868:
	mov	r2, ip	@ pivot_column, row
	b	.L266		@
.L262:
@ matrix_optimized.c:705:             if (row == pivot_column || factor == 0) {
	cmp	r7, #0	@ _718
	bne	.L265	@
	add	r0, sp, #84	@ tmp1739,,
	add	r1, sp, #68	@ tmp1738,,
	b	.L264		@
.L867:
@ matrix_optimized.c:699:         target_count = 0;
	movs	r3, #0	@ target_count,
	b	.L254		@
.L857:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r1, #32768	@ _150,
	beq	.L43		@,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r1, r1, #0	@ _2615, _150
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _2615,
.L44:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1712
	beq	.L92	@
.L85:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r5, r1	@ _2572, _1712
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	it	eq
	rsbeq	r1, r1, #0	@ _670, _1712
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	bne	.L65		@,
	b	.L125		@
.L856:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712, MEM[(short int *)_2471 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1712
	bne	.L85	@
.L788:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _1712,
.L105:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_1339 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r1, .L81	@ _1248,
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L113		@,
	b	.L82		@
.L849:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r3, #0	@ largest_value
	beq	.L14	@
@ matrix_optimized.c:632:         if (pivot_row != pivot_column) {
	cmp	r1, #3	@ pivot_row,
	bne	.L15		@,
@ matrix_optimized.c:656:         pivot_value = augmented[pivot_column][pivot_column];
	ldrsh	r3, [fp, #102]	@ pivot_value, augmented[3][3]
	b	.L11		@
.L875:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r1, #32768	@ _1794,
	beq	.L43		@,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r1, r1, #0	@ _2573, _1794
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _2573,
.L66:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_2681 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1248
	bne	.L113	@
.L81:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #5	@ ivtmp.83,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	mov	r1, #0	@ tmp1121,
	strh	r1, [r9, #8]	@ movhi	@ tmp1121, MEM[(short int *)_1345 + 8B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	bne	.L114		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #172]	@ _319, augmented[5][6]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _319
	beq	.L109	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L174		@,
.L803:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _1717,
	b	.L121		@
.L850:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r0, #0	@ _1138
	beq	.L14	@
@ matrix_optimized.c:611:                 pivot_row     = row;
	mov	r1, r5	@ pivot_row, row
	b	.L15		@
.L62:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #4]	@ _614, MEM[(short int *)_1289 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _614
	beq	.L74	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L87		@,
.L56:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _614, MEM[(short int *)_1296 + 4B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #3	@ ivtmp.83,
	bne	.L102		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #104]	@ _369, augmented[3][4]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _369
	beq	.L884	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ _369, MEM[(short int *)_2142 + 8B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #10]	@ _2147,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2147
	bne	.L798	@
.L286:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _2160,
.L150:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_1805 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	bne	.L163	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _1717, MEM[(short int *)_1565 + 12B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #7	@ ivtmp.83,
	bne	.L793		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #240]	@ _754, augmented[7][8]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L152	@
.L330:
	mov	r3, #4096	@ pivot_value,
.L165:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1241,
	strh	r1, [r9, #16]	@ movhi	@ tmp1241,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	beq	.L198	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L173		@,
.L200:
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
@ matrix_optimized.c:305:         (int32_t)((uint32_t)(int32_t)numerator << FRACTION_BITS);
	mov	r0, r6	@ _717, _1382
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	beq	.L197		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
	b	.L196		@
.L851:
@ matrix_optimized.c:619:         if (largest_value == 0) {
	cmp	r3, #0	@ _1149
	beq	.L14	@
@ matrix_optimized.c:611:                 pivot_row     = row;
	mov	r1, r6	@ pivot_row, row
	b	.L15		@
.L859:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r1, #32768	@ _1555,
	beq	.L43		@,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r1, r1, #0	@ _2427, _1555
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _2427,
.L97:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_2682 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	bne	.L137	@
.L111:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #6	@ ivtmp.83,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	mov	r1, #0	@ tmp1159,
	strh	r1, [r9, #10]	@ movhi	@ tmp1159, MEM[(short int *)_1358 + 10B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	bne	.L148		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [fp, #206]	@ _493, augmented[6][7]
	b	.L157		@
.L40:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _1664, MEM[(short int *)_2675 + 4B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712, MEM[(short int *)_2501 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1712
	beq	.L788	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L85		@,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _1712, MEM[(short int *)_2510 + 6B]
	b	.L126		@
.L265:
	add	r0, sp, #84	@ tmp1739,,
	add	r1, sp, #68	@ tmp1738,,
@ matrix_optimized.c:717:         if (target_count > 0) {
	cmp	r3, #0	@ target_count
	beq	.L273	@
	b	.L263		@
.L71:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #4]	@ _614, MEM[(short int *)_1269 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _614
	bne	.L56	@
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #3	@ ivtmp.83,
	bne	.L885		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #104]	@ _1766, augmented[3][4]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1766
	bne	.L886	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ _1766, MEM[(short int *)_2182 + 8B]
.L834:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #10]	@ _2187,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2187
	beq	.L887	@
.L798:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _2112,
	b	.L99		@
.L878:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #16]	@ _754, MEM[(short int *)_1624 + 16B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #14]	@ movhi	@ _493, MEM[(short int *)_1624 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L183	@
	b	.L165		@
.L860:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #14]	@ _493, MEM[(short int *)_1884 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	bne	.L175	@
.L134:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #16]	@ _754, MEM[(short int *)_1403 + 16B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r0, #0	@ tmp1213,
	strh	r0, [r9, #14]	@ movhi	@ tmp1213, MEM[(short int *)_1403 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L177	@
	b	.L165		@
.L291:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #4]	@ _614, MEM[(short int *)_2595 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _614
	bne	.L87	@
.L74:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #3	@ ivtmp.83,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	mov	r1, #0	@ tmp1041,
	strh	r1, [r9, #4]	@ movhi	@ tmp1041, MEM[(short int *)_1304 + 4B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	bne	.L95		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #104]	@ _1540, augmented[3][4]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1540
	beq	.L90	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L135		@,
.L94:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #10]	@ _2126,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _1540, MEM[(short int *)_2121 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2126
	bne	.L798	@
.L98:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r3, #0	@ tmp1711,
	strh	r3, [r9, #10]	@ movhi	@ tmp1711,
	b	.L150		@
.L51:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #6]	@ _2487,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2487
	bne	.L747	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #6]	@ movhi	@ _2487, MEM[(short int *)_2561 + 6B]
	mov	r3, #4096	@ pivot_value,
	b	.L105		@
.L881:
	strh	r3, [r9, #6]	@ movhi	@ _405, MEM[(short int *)_1269 + 6B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #8]	@ _1578, MEM[(short int *)_1269 + 8B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ _1578,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1578
	beq	.L834	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #10]	@ _2160,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2160
	beq	.L286	@
	b	.L798		@
.L880:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #2	@ ivtmp.83,
	bne	.L888		@,
@ matrix_optimized.c:276:     if (numerator == 0) {
	ldrsh	r1, [r9, #6]	@ MEM[(short int *)_1799 + 6B], MEM[(short int *)_1799 + 6B]
	cmp	r1, #0	@ MEM[(short int *)_1799 + 6B]
	beq	.L889	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #8]	@ _2316,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2316
	bne	.L783	@
.L67:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r3, #0	@ tmp1719,
	b	.L789		@
.L861:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r1, #32768	@ _918,
	beq	.L43		@,
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r1, r1, #0	@ _2074, _918
@ matrix_optimized.c:276:     if (numerator == 0) {
	mov	r3, #61440	@ pivot_value,
	movt	r3, 65535	@ pivot_value,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _2074,
	b	.L156		@
.L187:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r0, #32768	@ _493,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #16]	@ _754, MEM[(short int *)_1404 + 16B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r0, r0, #0	@ _1405, _493
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #14]	@ movhi	@ _1405, MEM[(short int *)_1404 + 14B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	beq	.L890	@
.L190:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r1, #32768	@ _754,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382, MEM[(short int *)_1505 + 18B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r1, r1, #0	@ _842, _754
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #16]	@ movhi	@ _842, MEM[(short int *)_1505 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	beq	.L193	@
.L197:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r6, #32768	@ _1382,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_642 + 20B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r6, r6, #0	@ _876, _1382
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r6, [r9, #18]	@ movhi	@ _876, MEM[(short int *)_642 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	beq	.L891	@
.L210:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r5, #32768	@ _745,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_572 + 22B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r5, r5, #0	@ _910, _745
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #20]	@ movhi	@ _910, MEM[(short int *)_572 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	beq	.L892	@
.L212:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r0, #32768	@ _173,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_529 + 24B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r0, r0, #0	@ _944, _173
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _944, MEM[(short int *)_529 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	beq	.L836	@
.L220:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r5, #32768	@ _415,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_451 + 26B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r5, r5, #0	@ _978, _415
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _978, MEM[(short int *)_451 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	beq	.L893	@
.L229:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r0, #32768	@ _236,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336, MEM[(short int *)_413 + 28B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r0, r0, #0	@ _1012, _236
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #26]	@ movhi	@ _1012, MEM[(short int *)_413 + 26B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _336
	beq	.L813	@
.L238:
@ matrix_optimized.c:191:     if (value < INT16_MIN || value > INT16_MAX) {
	cmn	r5, #32768	@ _336,
	beq	.L43		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #30]	@ _1226, MEM[(short int *)_383 + 30B]
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r5, r5, #0	@ _1046, _336
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #28]	@ movhi	@ _1046, MEM[(short int *)_383 + 28B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1226
	beq	.L248	@
.L249:
@ matrix_optimized.c:287:         *result = -(int32_t)numerator;
	rsbs	r3, r0, #0	@ division_result, _1226
	b	.L256		@
.L862:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382, MEM[(short int *)_167 + 18B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #16]	@ movhi	@ _754, MEM[(short int *)_167 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	bne	.L200	@
	b	.L198		@
.L884:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ _369, MEM[(short int *)_1296 + 8B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #10]	@ _1513, MEM[(short int *)_1296 + 10B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _1513,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1513
	beq	.L832	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #12]	@ _1963,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1963
	bne	.L802	@
.L145:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #12]	@ movhi	@ _1052,
.L816:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #14]	@ _493,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	bne	.L133	@
.L806:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #16]	@ _754,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #14]	@ movhi	@ _493,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L152	@
	b	.L330		@
.L869:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _1248, MEM[(short int *)_1522 + 8B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #5	@ ivtmp.83,
	bne	.L130		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #172]	@ _319, augmented[5][6]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _319
	bne	.L803	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _319, MEM[(short int *)_1891 + 12B]
.L793:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #14]	@ _493,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	bne	.L133	@
.L181:
	mov	r3, #4096	@ pivot_value,
	b	.L134		@
.L870:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	bne	.L173	@
.L820:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	bne	.L204	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_1488 + 22B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r3, #0	@ tmp1690,
	strh	r3, [r9, #20]	@ movhi	@ tmp1690, MEM[(short int *)_1488 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	bne	.L214	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_78 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _173, MEM[(short int *)_78 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L222	@
	mov	r3, #4096	@ pivot_value,
.L223:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_504 + 26B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1323,
	strh	r1, [r9, #24]	@ movhi	@ tmp1323, MEM[(short int *)_504 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	beq	.L232	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L231		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L229		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
.L233:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r5, r1, r3	@ _922, denominator_mask, pivot_value
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r5, r5, r1	@ _894, _922, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r5, #1	@ half_denominator, _894,
	b	.L236		@
.L888:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #4]	@ _614, MEM[(short int *)_1257 + 4B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _614
	bne	.L56	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #4]	@ movhi	@ _614, MEM[(short int *)_2529 + 4B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #3	@ ivtmp.83,
	bne	.L93		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #104]	@ _1540, augmented[3][4]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1540
	bne	.L94	@
	b	.L90		@
.L863:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_14 + 22B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #20]	@ movhi	@ _745, MEM[(short int *)_14 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	beq	.L894	@
.L301:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r5, r1, r3	@ _1025, denominator_mask, pivot_value
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r5, r5, r1	@ _1020, _1025, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r5, #1	@ half_denominator, _1020,
	b	.L218		@
.L883:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #12]	@ movhi	@ _1717, MEM[(short int *)_1495 + 12B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #7	@ ivtmp.83,
	bne	.L816		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #240]	@ _754, augmented[7][8]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _754
	bne	.L152	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #16]	@ movhi	@ _754, MEM[(short int *)_1535 + 16B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	bne	.L173	@
	b	.L172		@
.L864:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_933 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _173, MEM[(short int *)_933 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L224	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_1620 + 26B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_1620 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	bne	.L233	@
.L232:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336, MEM[(short int *)_425 + 28B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1346,
	strh	r1, [r9, #26]	@ movhi	@ tmp1346, MEM[(short int *)_425 + 26B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r5, .L241	@ _336,
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L239		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L238		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
.L242:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r0, r1, r3	@ _882, denominator_mask, pivot_value
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r0, r0, r1	@ _880, _882, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r0, #1	@ half_denominator, _880,
	b	.L247		@
.L865:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_1355 + 26B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_1355 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	bne	.L233	@
.L235:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #26]	@ movhi	@ _236,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _336
	bne	.L242	@
.L241:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #30]	@ _1226, MEM[(short int *)_357 + 30B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1363,
	strh	r1, [r9, #28]	@ movhi	@ tmp1363, MEM[(short int *)_357 + 28B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1226
	beq	.L248	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L252		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L249		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
.L293:
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	eor	r5, r1, r3	@ _826, denominator_mask, pivot_value
@ matrix_optimized.c:310:         ((denominator_32 ^ denominator_mask) - denominator_mask) >> 1;
	subs	r5, r5, r1	@ _820, _826, denominator_mask
@ matrix_optimized.c:309:     half_denominator =
	asrs	r7, r5, #1	@ half_denominator, _820,
	b	.L253		@
.L872:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_639 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L222	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_1529 + 24B]
.L838:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	bne	.L231	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #26]	@ movhi	@ _236,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _336
	bne	.L239	@
	mov	r3, #4096	@ pivot_value,
	b	.L241		@
.L871:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_741 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	bne	.L214	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_367 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _173, MEM[(short int *)_367 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L222	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_1676 + 26B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_1676 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	bne	.L231	@
	mov	r3, #4096	@ pivot_value,
	b	.L232		@
.L898:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _1771, MEM[(short int *)_1985 + 10B]
.L832:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #12]	@ _1990,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1990
	bne	.L802	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #12]	@ movhi	@ _1990,
@ matrix_optimized.c:276:     if (numerator == 0) {
	mov	r3, #4096	@ pivot_value,
	b	.L167		@
.L891:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_642 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	bne	.L212	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_1024 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _173, MEM[(short int *)_1024 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L220	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236, MEM[(short int *)_1391 + 26B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_1391 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	bne	.L229	@
	mov	r3, #61440	@ pivot_value,
	movt	r3, 65535	@ pivot_value,
	b	.L232		@
.L205:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_606 + 22B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r1, #0	@ tmp1279,
	strh	r1, [r9, #20]	@ movhi	@ tmp1279, MEM[(short int *)_606 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	beq	.L215	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	beq	.L214		@,
@ matrix_optimized.c:286:     if (denominator == -FIXED_ONE) {
	cmn	r3, #4096	@ pivot_value,
	beq	.L212		@,
	asrs	r1, r3, #31	@ denominator_mask, pivot_value,
	b	.L301		@
.L893:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336, MEM[(short int *)_451 + 28B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _336
	bne	.L238	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #28]	@ movhi	@ _336, MEM[(short int *)_829 + 28B]
.L813:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #30]	@ _1226,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1226
	bne	.L249	@
	b	.L248		@
.L873:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336, MEM[(short int *)_519 + 28B]
	b	.L239		@
.L866:
	ldrsh	r0, [r9, #30]	@ _1226, MEM[(short int *)_1579 + 30B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #28]	@ movhi	@ _336, MEM[(short int *)_1579 + 28B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _1226
	bne	.L293	@
	b	.L248		@
.L892:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_572 + 24B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L220	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #24]	@ movhi	@ _415, MEM[(short int *)_1543 + 24B]
.L836:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #26]	@ _236,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _236
	bne	.L229	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #28]	@ _336,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #26]	@ movhi	@ _236,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _336
	bne	.L238	@
	mov	r3, #61440	@ pivot_value,
	movt	r3, 65535	@ pivot_value,
	b	.L241		@
.L894:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #24]	@ _415, MEM[(short int *)_99 + 24B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #22]	@ movhi	@ _173, MEM[(short int *)_99 + 22B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _415
	bne	.L224	@
	b	.L223		@
.L886:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #8]	@ movhi	@ _1766, MEM[(short int *)_2107 + 8B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #10]	@ _2112,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _2112
	bne	.L798	@
	b	.L98		@
.L885:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712, MEM[(short int *)_1269 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r1, .L895	@ _1712,
.L77:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _1712, MEM[(short int *)_1311 + 6B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #4	@ ivtmp.83,
	bne	.L126		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #138]	@ _1189, augmented[4][5]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r3, .L896	@ _1189,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _1189, MEM[(short int *)_1945 + 10B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #12]	@ _1950,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1950
	bne	.L802	@
	b	.L145		@
.L896:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _1189, MEM[(short int *)_1311 + 10B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #12]	@ _1052, MEM[(short int *)_1311 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1052
	bne	.L802	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #12]	@ movhi	@ _1052, MEM[(short int *)_1570 + 12B]
	b	.L793		@
.L895:
	strh	r1, [r9, #6]	@ movhi	@ _1712, MEM[(short int *)_2386 + 6B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #4	@ ivtmp.83,
	bne	.L78		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #138]	@ _1001, augmented[4][5]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r1, .L897	@ _1001,
.L80:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #12]	@ _1929,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _1001, MEM[(short int *)_1924 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1929
	bne	.L802	@
.L120:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r3, #0	@ tmp1701,
	strh	r3, [r9, #12]	@ movhi	@ tmp1701,
	b	.L816		@
.L93:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712, MEM[(short int *)_2534 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1712
	bne	.L77	@
.L92:
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #4	@ ivtmp.83,
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	mov	r1, #0	@ tmp1081,
	strh	r1, [r9, #6]	@ movhi	@ tmp1081, MEM[(short int *)_1330 + 6B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	bne	.L105		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [fp, #138]	@ _1001, augmented[4][5]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cbz	r1, .L79	@ _1001,
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L153		@,
	b	.L80		@
.L897:
@ matrix_optimized.c:276:     if (numerator == 0) {
	mov	r3, #4096	@ pivot_value,
.L79:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_2021 + 12B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r0, #0	@ tmp1626,
	strh	r0, [r9, #10]	@ movhi	@ tmp1626, MEM[(short int *)_2017 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	bne	.L276	@
	b	.L801		@
.L890:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r6, [r9, #18]	@ _1382, MEM[(short int *)_1404 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r6, #0	@ _1382
	bne	.L197	@
.L193:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_1501 + 20B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	movs	r3, #0	@ tmp1692,
	strh	r3, [r9, #18]	@ movhi	@ tmp1692, MEM[(short int *)_1501 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	bne	.L210	@
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [r9, #22]	@ _173, MEM[(short int *)_1047 + 22B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r5, [r9, #20]	@ movhi	@ _745, MEM[(short int *)_1047 + 20B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _173
	bne	.L212	@
	mov	r3, #61440	@ pivot_value,
	movt	r3, 65535	@ pivot_value,
	b	.L215		@
.L797:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _1715,
.L148:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_1369 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	beq	.L169	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L168		@,
	b	.L163		@
.L889:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _2359, MEM[(short int *)_2358 + 8B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #8]	@ movhi	@ _2359,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _2359
	bne	.L116	@
	b	.L114		@
.L882:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #10]	@ movhi	@ _1715, MEM[(short int *)_1868 + 10B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #6	@ ivtmp.83,
	bne	.L132		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r0, [fp, #206]	@ _493, augmented[6][7]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r0, #0	@ _493
	bne	.L133	@
	b	.L181		@
.L132:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #12]	@ _1717, MEM[(short int *)_2035 + 12B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1717
	bne	.L163	@
	mov	r3, #4096	@ pivot_value,
	b	.L169		@
.L108:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #10]	@ _1715, MEM[(short int *)_2237 + 10B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1715
	bne	.L112	@
	mov	r3, #4096	@ pivot_value,
	b	.L111		@
.L887:
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _2187,
@ matrix_optimized.c:276:     if (numerator == 0) {
	mov	r3, #4096	@ pivot_value,
	b	.L148		@
.L195:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r5, [r9, #20]	@ _745, MEM[(short int *)_414 + 20B]
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r0, [r9, #18]	@ movhi	@ _1469, MEM[(short int *)_414 + 18B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r5, #0	@ _745
	beq	.L205	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L206		@,
	b	.L204		@
.L95:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712, MEM[(short int *)_1328 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1712
	beq	.L92	@
@ matrix_optimized.c:281:     if (denominator == FIXED_ONE) {
	cmp	r3, #4096	@ pivot_value,
	bne	.L85		@,
	b	.L77		@
.L102:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #6]	@ _1712, MEM[(short int *)_1296 + 6B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1712
	bne	.L77	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r1, [r9, #6]	@ movhi	@ _1712, MEM[(short int *)_1587 + 6B]
@ matrix_optimized.c:661:             if (column == pivot_column) {
	cmp	r4, #4	@ ivtmp.83,
	bne	.L315		@,
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [fp, #138]	@ _1771, augmented[4][5]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1771
	beq	.L898	@
@ matrix_optimized.c:674:             augmented[pivot_column][column] = (int16_t)division_result;
	strh	r3, [r9, #10]	@ movhi	@ _1771, MEM[(short int *)_1910 + 10B]
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r3, [r9, #12]	@ _1915,
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r3, #0	@ _1915
	bne	.L802	@
	b	.L120		@
.L78:
@ matrix_optimized.c:665:             if (!fixed_divide(augmented[pivot_column][column],
	ldrsh	r1, [r9, #8]	@ _1248, MEM[(short int *)_2391 + 8B]
@ matrix_optimized.c:276:     if (numerator == 0) {
	cmp	r1, #0	@ _1248
	bne	.L82	@
	mov	r3, #4096	@ pivot_value,
	b	.L81		@
	.size	invert_matrix, .-invert_matrix
	.align	1
	.p2align 2,,3
	.global	multiply_matrices
	.syntax unified
	.thumb
	.thumb_func
	.type	multiply_matrices, %function
multiply_matrices:
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0	@ tmp517, first
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	mov	r0, r1	@ tmp356, second
@ matrix_optimized.c:830: {
	push	{lr}	@
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	add	lr, r1, #32	@ tmp358, second,
	vld1.16	{q9}, [r0]!	@ vect__65.113, MEM <const vector(8) short int> [(short int *)second_24(D)]
@ matrix_optimized.c:830: {
	vpush.64	{d8, d9, d10, d11, d12, d13, d14, d15}	@
	sub	sp, sp, #132	@,,
@ matrix_optimized.c:830: {
	mov	ip, r1	@ second, tmp518
	mov	r1, r2	@ tmp519, result
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	add	r2, ip, #48	@ tmp360, second,
	vst1.64	{d18-d19}, [sp:64]	@ vect__65.113, %sfp
	vld1.16	{q9}, [lr]	@ vect__31.146, MEM <const vector(8) short int> [(short int *)second_24(D) + 32B]
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vmov.i32	q8, #2048  @ v4si	@ tmp386,
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vstr	d18, [sp, #32]	@, %sfp
	vstr	d19, [sp, #40]	@, %sfp
	vld1.16	{q9}, [r2]	@ vect__14.163, MEM <const vector(8) short int> [(short int *)second_24(D) + 48B]
	add	r2, ip, #64	@ tmp362, second,
	add	lr, r3, #128	@ _572, ivtmp.255,
	vstr	d18, [sp, #48]	@, %sfp
	vstr	d19, [sp, #56]	@, %sfp
	vld1.16	{q9}, [r0]	@ vect__41.129, MEM <const vector(8) short int> [(short int *)second_24(D) + 16B]
	vstr	d18, [sp, #16]	@, %sfp
	vstr	d19, [sp, #24]	@, %sfp
	vld1.16	{q9}, [r2]	@ vect__229.180, MEM <const vector(8) short int> [(short int *)second_24(D) + 64B]
	add	r2, ip, #80	@ tmp364, second,
	vstr	d18, [sp, #64]	@, %sfp
	vstr	d19, [sp, #72]	@, %sfp
	vld1.16	{q9}, [r2]	@ vect__239.197, MEM <const vector(8) short int> [(short int *)second_24(D) + 80B]
	add	r2, ip, #96	@ tmp366, second,
	add	ip, ip, #112	@ tmp368, second,
	vstr	d18, [sp, #80]	@, %sfp
	vstr	d19, [sp, #88]	@, %sfp
	vld1.16	{q9}, [r2]	@ vect__249.214, MEM <const vector(8) short int> [(short int *)second_24(D) + 96B]
	vstr	d18, [sp, #96]	@, %sfp
	vstr	d19, [sp, #104]	@, %sfp
	vld1.16	{q9}, [ip]	@ vect__259.231, MEM <const vector(8) short int> [(short int *)second_24(D) + 112B]
	vstr	d18, [sp, #112]	@, %sfp
	vstr	d19, [sp, #120]	@, %sfp
.L902:
	vld1.16	{d2[], d3[]}, [r3]	@ tmp369, MEM[(const int16_t *)_571]
	vld1.64	{d26-d27}, [sp:64]	@ vect__65.113, %sfp
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r2, [r3, #2]	@ _170, MEM[(const int16_t *)_571 + 2B]
@ matrix_optimized.c:838:     for (row = 0; row < N; row++) {
	adds	r3, r3, #16	@ ivtmp.255, ivtmp.255,
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	ip, [r3, #-12]	@ _163, MEM[(const int16_t *)_571 + 4B]
	vmull.s16 q2, d2, d26	@ vect_patt_451.114, tmp369, tmp529
	vdup.16	q10, r2	@ tmp371, _170
	vmull.s16 q1, d3, d27	@ vect_patt_451.114, tmp369, vect__65.113
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q5, q8, q2	@ vect__428.120_479, tmp386, vect_patt_451.114
	vldr	d26, [sp, #16]	@, %sfp
	vldr	d27, [sp, #24]	@, %sfp
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r0, [r3, #-10]	@ _144, MEM[(const int16_t *)_571 + 6B]
	vdup.16	q15, ip	@ tmp373, _163
	vmull.s16 q3, d26, d20	@ vect_patt_332.130, tmp531, tmp371
	vdup.16	q12, r0	@ tmp375, _144
	vldr	d0, [sp, #32]	@, %sfp
	vldr	d1, [sp, #40]	@, %sfp
	vldr	d8, [sp, #48]	@, %sfp
	vldr	d9, [sp, #56]	@, %sfp
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q6, q2, q8	@ vect__426.116_211, vect_patt_451.114, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q5, q5, #12	@ vect__56.122_484, vect__428.120_479,
	vmull.s16 q10, d27, d21	@ vect_patt_332.130, vect__41.129, tmp371
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q5, q5	@ vect__430.124_488, vect__56.122_484
	vmull.s16 q13, d0, d30	@ vect_patt_457.147, tmp533, tmp373
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q6, q6, #12	@ vect__58.118_473, vect__426.116_211,
	vmull.s16 q15, d1, d31	@ vect_patt_457.147, vect__31.146, tmp373
	vcge.s32	q2, q2, #0	@ tmp392, vect_patt_451.114
	vmull.s16 q0, d8, d24	@ vect_patt_334.164, tmp535, tmp375
	vmull.s16 q12, d9, d25	@ vect_patt_334.164, vect__14.163, tmp375
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q4, q8, q3	@ vect__434.136_515, tmp386, vect_patt_332.130
	vbsl	q2, q6, q5	@ vect__44.126, vect__58.118_473, vect__430.124_488
	vshr.s32	q4, q4, #12	@ vect__35.138_520, vect__434.136_515,
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q5, q3, q8	@ vect__432.132_504, vect_patt_332.130, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q4, q4	@ vect__436.140_524, vect__35.138_520
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q5, q5, #12	@ vect__37.134_509, vect__432.132_504,
	vcge.s32	q3, q3, #0	@ tmp408, vect_patt_332.130
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r2, [r3, #-8]	@ _128, MEM[(const int16_t *)_571 + 8B]
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q7, q8, q1	@ vect__428.120_480, tmp386, vect_patt_451.114
	vbsl	q3, q5, q4	@ vect__33.142, vect__37.134_509, vect__436.140_524
	vdup.16	q11, r2	@ tmp377, _128
	vldr	d10, [sp, #64]	@, %sfp
	vldr	d11, [sp, #72]	@, %sfp
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q2, q2, q3	@ vect_sum_32.143, vect__44.126, vect__33.142
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q7, q7, #12	@ vect__56.122_485, vect__428.120_480,
	vmull.s16 q3, d10, d22	@ vect_patt_463.181, tmp537, tmp377
	vmull.s16 q11, d11, d23	@ vect_patt_463.181, vect__229.180, tmp377
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q5, q1, q8	@ vect__426.116_313, vect_patt_451.114, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q6, q8, q10	@ vect__434.136_516, tmp386, vect_patt_332.130
	vcge.s32	q1, q1, #0	@ tmp400, vect_patt_451.114
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q7, q7	@ vect__430.124_489, vect__56.122_485
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q5, q5, #12	@ vect__58.118_474, vect__426.116_313,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q6, q6, #12	@ vect__35.138_521, vect__434.136_516,
	vbif	q5, q7, q1	@ vect__44.126, vect__430.124_489, tmp400
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q1, q10, q8	@ vect__432.132_505, vect_patt_332.130, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q6, q6	@ vect__436.140_525, vect__35.138_521
	vcge.s32	q10, q10, #0	@ tmp416, vect_patt_332.130
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q1, q1, #12	@ vect__37.134_510, vect__432.132_505,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q4, q8, q13	@ vect__440.153_553, tmp386, vect_patt_457.147
	vbif	q1, q6, q10	@ vect__33.142, vect__436.140_525, tmp416
	vshr.s32	q4, q4, #12	@ vect__25.155_558, vect__440.153_553,
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q1, q5, q1	@ vect_sum_32.143, vect__44.126, vect__33.142
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q5, q13, q8	@ vect__438.149_542, vect_patt_457.147, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q4, q4	@ vect__442.157_562, vect__25.155_558
	vcge.s32	q10, q13, #0	@ tmp424, vect_patt_457.147
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q5, q5, #12	@ vect__27.151_547, vect__438.149_542,
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r2, [r3, #-6]	@ _121, MEM[(const int16_t *)_571 + 10B]
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q13, q8, q0	@ vect__446.170_591, tmp386, vect_patt_334.164
	vdup.16	q9, r2	@ tmp379, _121
	vbsl	q10, q5, q4	@ vect__16.159, vect__27.151_547, vect__442.157_562
	vldr	d10, [sp, #80]	@, %sfp
	vldr	d11, [sp, #88]	@, %sfp
	vsub.i32	q4, q8, q15	@ vect__440.153_554, tmp386, vect_patt_457.147
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q10, q2, q10	@ vect_sum_15.160, vect_sum_32.143, vect__16.159
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q4, q4, #12	@ vect__25.155_559, vect__440.153_554,
	vmull.s16 q2, d10, d18	@ vect_patt_336.198, tmp539, tmp379
	vmull.s16 q9, d11, d19	@ vect_patt_336.198, vect__239.197, tmp379
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q5, q15, q8	@ vect__438.149_543, vect_patt_457.147, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q4, q4	@ vect__442.157_563, vect__25.155_559
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q5, q5, #12	@ vect__27.151_548, vect__438.149_543,
	vcge.s32	q15, q15, #0	@ tmp432, vect_patt_457.147
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q13, q13, #12	@ vect__6.172_596, vect__446.170_591,
	vbsl	q15, q5, q4	@ vect__16.159, vect__27.151_548, vect__442.157_563
	vsub.i32	q4, q8, q12	@ vect__446.170_592, tmp386, vect_patt_334.164
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q1, q1, q15	@ vect_sum_15.160, vect_sum_32.143, vect__16.159
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q5, q12, q8	@ vect__444.166_581, vect_patt_334.164, tmp386
	vadd.i32	q15, q0, q8	@ vect__444.166_580, vect_patt_334.164, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q4, q4, #12	@ vect__6.172_597, vect__446.170_592,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q13, q13	@ vect__448.174_600, vect__6.172_596
	vcge.s32	q0, q0, #0	@ tmp440, vect_patt_334.164
	vneg.s32	q4, q4	@ vect__448.174_601, vect__6.172_597
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q15, q15, #12	@ vect__8.168_585, vect__444.166_580,
	vcge.s32	q12, q12, #0	@ tmp448, vect_patt_334.164
	vshr.s32	q5, q5, #12	@ vect__8.168_586, vect__444.166_581,
	vbif	q15, q13, q0	@ vect__4.176, vect__448.174_600, tmp440
	vbsl	q12, q5, q4	@ vect__4.176, vect__8.168_586, vect__448.174_601
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q0, q8, q3	@ vect__452.187_629, tmp386, vect_patt_463.181
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q1, q1, q12	@ vect_sum_3.177, vect_sum_15.160, vect__4.176
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q0, q0, #12	@ vect__235.189_634, vect__452.187_629,
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q12, q3, q8	@ vect__450.183_618, vect_patt_463.181, tmp386
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	ip, [r3, #-4]	@ _102, MEM[(const int16_t *)_571 + 12B]
@ matrix_optimized.c:851:             result[row][column] = sum;
	mov	r2, r1	@ tmp515, ivtmp.257
	vldr	d26, [sp, #96]	@, %sfp
	vldr	d27, [sp, #104]	@, %sfp
	vdup.16	q14, ip	@ tmp381, _102
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q0, q0	@ vect__454.191_638, vect__235.189_634
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q12, q12, #12	@ vect__233.185_623, vect__450.183_618,
	vcge.s32	q3, q3, #0	@ tmp456, vect_patt_463.181
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	ldrsh	r0, [r3, #-2]	@ _87, MEM[(const int16_t *)_571 + 14B]
@ matrix_optimized.c:838:     for (row = 0; row < N; row++) {
	adds	r1, r1, #32	@ ivtmp.257, ivtmp.257,
	vldr	d8, [sp, #112]	@, %sfp
	vldr	d9, [sp, #120]	@, %sfp
	vbsl	q3, q12, q0	@ vect__237.193, vect__233.185_623, vect__454.191_638
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q15, q10, q15	@ vect_sum_3.177, vect_sum_15.160, vect__4.176
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q0, q8, q11	@ vect__452.187_630, tmp386, vect_patt_463.181
	vmull.s16 q10, d26, d28	@ vect_patt_469.215, tmp541, tmp381
	vmull.s16 q14, d27, d29	@ vect_patt_469.215, vect__249.214, tmp381
	vdup.16	q13, r0	@ tmp383, _87
	vshr.s32	q0, q0, #12	@ vect__235.189_635, vect__452.187_630,
	vmull.s16 q12, d8, d26	@ vect_patt_338.232, tmp543, tmp383
	vmull.s16 q13, d9, d27	@ vect_patt_338.232, vect__259.231, tmp383
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q4, q11, q8	@ vect__450.183_619, vect_patt_463.181, tmp386
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q15, q15, q3	@ vect_sum_238.194, vect_sum_3.177, vect__237.193
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q0, q0	@ vect__454.191_639, vect__235.189_635
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q3, q8, q2	@ vect__458.204_667, tmp386, vect_patt_336.198
	vcge.s32	q11, q11, #0	@ tmp464, vect_patt_463.181
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q4, q4, #12	@ vect__233.185_624, vect__450.183_619,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q3, q3, #12	@ vect__245.206_672, vect__458.204_667,
	vbsl	q11, q4, q0	@ vect__237.193, vect__233.185_624, vect__454.191_639
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q0, q2, q8	@ vect__456.200_656, vect_patt_336.198, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q3, q3	@ vect__460.208_676, vect__245.206_672
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q1, q1, q11	@ vect_sum_238.194, vect_sum_3.177, vect__237.193
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q0, q0, #12	@ vect__243.202_661, vect__456.200_656,
	vcge.s32	q11, q2, #0	@ tmp472, vect_patt_336.198
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q2, q9, q8	@ vect__456.200_657, vect_patt_336.198, tmp386
	vbsl	q11, q0, q3	@ vect__247.210, vect__243.202_661, vect__460.208_676
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q3, q8, q9	@ vect__458.204_668, tmp386, vect_patt_336.198
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q11, q15, q11	@ vect_sum_248.211, vect_sum_238.194, vect__247.210
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q3, q3, #12	@ vect__245.206_673, vect__458.204_668,
	vsub.i32	q15, q8, q10	@ vect__464.221_705, tmp386, vect_patt_469.215
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q3, q3	@ vect__460.208_677, vect__245.206_673
	vcge.s32	q9, q9, #0	@ tmp480, vect_patt_336.198
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q2, q2, #12	@ vect__243.202_662, vect__456.200_657,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q15, q15, #12	@ vect__255.223_710, vect__464.221_705,
	vbsl	q9, q2, q3	@ vect__247.210, vect__243.202_662, vect__460.208_677
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q3, q10, q8	@ vect__462.217_694, vect_patt_469.215, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q15, q15	@ vect__466.225_714, vect__255.223_710
	vcge.s32	q10, q10, #0	@ tmp488, vect_patt_469.215
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q3, q3, #12	@ vect__253.219_699, vect__462.217_694,
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q9, q1, q9	@ vect_sum_248.211, vect_sum_238.194, vect__247.210
	vbsl	q10, q3, q15	@ vect__257.227, vect__253.219_699, vect__466.225_714
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q15, q12, q8	@ vect__468.234_732, vect_patt_338.232, tmp386
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q10, q11, q10	@ vect_sum_258.228, vect_sum_248.211, vect__257.227
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q11, q8, q12	@ vect__470.238_743, tmp386, vect_patt_338.232
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q15, q15, #12	@ vect__263.236_737, vect__468.234_732,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q11, q11, #12	@ vect__265.240_748, vect__470.238_743,
	vcge.s32	q12, q12, #0	@ tmp504, vect_patt_338.232
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q11, q11	@ vect__472.242_752, vect__265.240_748
@ matrix_optimized.c:838:     for (row = 0; row < N; row++) {
	cmp	r3, lr	@ ivtmp.255, _572
	vbsl	q12, q15, q11	@ vect__267.244, vect__263.236_737, vect__472.242_752
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q11, q13, q8	@ vect__468.234_733, vect_patt_338.232, tmp386
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q10, q10, q12	@ vect_sum_268.245_758, vect_sum_258.228, vect__267.244
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q11, q11, #12	@ vect__263.236_738, vect__468.234_733,
@ matrix_optimized.c:851:             result[row][column] = sum;
	vst1.32	{q10}, [r2]!	@ vect_sum_268.245_758, MEM <vector(4) int> [(int *)vectp.247_760]
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q10, q8, q13	@ vect__470.238_744, tmp386, vect_patt_338.232
	vcge.s32	q13, q13, #0	@ tmp512, vect_patt_338.232
	vshr.s32	q10, q10, #12	@ vect__265.240_749, vect__470.238_744,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q10, q10	@ vect__472.242_753, vect__265.240_749
	vbsl	q13, q11, q10	@ vect__267.244, vect__263.236_738, vect__472.242_753
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vsub.i32	q10, q8, q14	@ vect__464.221_706, tmp386, vect_patt_469.215
@ matrix_optimized.c:222:         return (product + (1 << (FRACTION_BITS - 1)))
	vadd.i32	q11, q14, q8	@ vect__462.217_695, vect_patt_469.215, tmp386
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vshr.s32	q10, q10, #12	@ vect__255.223_711, vect__464.221_706,
	vcge.s32	q14, q14, #0	@ tmp496, vect_patt_469.215
@ matrix_optimized.c:223:             >> FRACTION_BITS;
	vshr.s32	q11, q11, #12	@ vect__253.219_700, vect__462.217_695,
@ matrix_optimized.c:228:     return -((magnitude + (1 << (FRACTION_BITS - 1))) >> FRACTION_BITS);
	vneg.s32	q10, q10	@ vect__466.225_715, vect__255.223_711
	vbsl	q14, q11, q10	@ vect__257.227, vect__253.219_700, vect__466.225_715
@ matrix_optimized.c:848:                 sum += fixed_multiply(first_row[k], second[k][column]);
	vadd.i32	q9, q9, q14	@ vect_sum_258.228, vect_sum_248.211, vect__257.227
	vadd.i32	q9, q9, q13	@ vect_sum_268.245_759, vect_sum_258.228, vect__267.244
@ matrix_optimized.c:851:             result[row][column] = sum;
	vst1.32	{q9}, [r2]	@ vect_sum_268.245_759, MEM <vector(4) int> [(int *)vectp.246_766]
@ matrix_optimized.c:838:     for (row = 0; row < N; row++) {
	bne	.L902		@,
@ matrix_optimized.c:854: }
	add	sp, sp, #132	@,,
	@ sp needed	@
	vldm	sp!, {d8-d15}	@,
	ldr	pc, [sp], #4	@
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
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	mov	r3, r0	@ tmp234, matrix
	add	ip, r0, #32	@ tmp235, matrix,
@ matrix_optimized.c:868: {
	vpush.64	{d8, d9, d10, d11}	@
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d20-d21}, [r3]!	@ _42, MEM[(const short int[8] *)matrix_8(D)]
	vld1.16	{d16-d17}, [ip]	@ _106, MEM[(const short int[8] *)_104]
	vld1.16	{d18-d19}, [r3]	@ _74, MEM[(const short int[8] *)_72]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q14, d20	@ _46, _42
	vmovl.s16	q13, d16	@ _110, _106
	vmovl.s16	q5, d17	@ _116, _106
	vmovl.s16	q10, d21	@ _52, _42
	vmovl.s16	q8, d18	@ _78, _74
	vmovl.s16	q9, d19	@ _84, _74
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	add	r1, r0, #48	@ tmp236, matrix,
	add	r2, r0, #64	@ tmp237, matrix,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q10, q10	@ _54, _52
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d24-d25}, [r1]	@ _138, MEM[(const short int[8] *)_136]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q9, q9	@ _86, _84
	vabs.s32	q14, q14	@ _48, _46
	vabs.s32	q8, q8	@ _80, _78
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	add	r3, r0, #80	@ tmp238, matrix,
	vld1.16	{d30-d31}, [r2]	@ _170, MEM[(const short int[8] *)_168]
	vld1.16	{d4-d5}, [r3]	@ _202, MEM[(const short int[8] *)_200]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q1, d25	@ _148, _138
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q14, q14, q10	@ _55, _48, _54
	vadd.i32	q8, q8, q9	@ _87, _80, _86
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q11, d24	@ _142, _138
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q5, q5	@ _118, _116
	vabs.s32	q13, q13	@ _112, _110
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	add	r3, r0, #96	@ tmp239, matrix,
	adds	r0, r0, #112	@ tmp240, matrix,
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q12, d30	@ _174, _170
	vmovl.s16	q0, d31	@ _180, _170
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d8-d9}, [r3]	@ _234, MEM[(const short int[8] *)_232]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q9, q1	@ _150, _148
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d7, d29, d28	@ _60, _55, _55
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q1, d5	@ _212, _202
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q13, q13, q5	@ _119, _112, _118
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d5, d17, d16	@ _92, _87, _87
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q11, q11	@ _144, _142
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:10802:   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
	vld1.16	{d30-d31}, [r0]	@ _266, MEM[(const short int[8] *)_264]
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q10, d4	@ _206, _202
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q12, q12	@ _176, _174
	vabs.s32	q0, q0	@ _182, _180
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q11, q11, q9	@ _151, _144, _150
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q14, d9	@ _244, _234
	vmovl.s16	q9, d8	@ _238, _234
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d7, d7, d7	@ _62, _60, _60
	vpadd.i32	d5, d5, d5	@ _94, _92, _92
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d6, d27, d26	@ _124, _119, _119
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q8, d30	@ _270, _266
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q10, q10	@ _208, _206
	vabs.s32	q1, q1	@ _214, _212
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:7705:   return (int32x4_t)__builtin_neon_vmovlsv4hi (__a);
	vmovl.s16	q15, d31	@ _276, _266
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q12, q12, q0	@ _183, _176, _182
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r3, s14	@ int	@ _64, _62
	vmov	r2, s10	@ int	@ _96, _94
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d6, d6, d6	@ _126, _124, _124
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q9, q9	@ _240, _238
	vabs.s32	q14, q14	@ _246, _244
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d22, d23, d22	@ _156, _151, _151
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	cmp	r3, r2	@ _64, _96
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q10, q10, q1	@ _215, _208, _214
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:2916:   return (int32x4_t)__builtin_neon_vabsv4si (__a);
	vabs.s32	q8, q8	@ _272, _270
	vabs.s32	q15, q15	@ _278, _276
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	it	lt
	movlt	r3, r2	@ _290, _96
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d24, d25, d24	@ _188, _183, _183
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r2, s12	@ int	@ _128, _126
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d7, d22, d22	@ _158, _156, _156
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q9, q9, q14	@ _247, _240, _246
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	bic	r3, r3, r3, asr #31	@ _290, _290
	cmp	r3, r2	@ _290, _128
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d20, d21, d20	@ _220, _215, _215
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:614:   return __a + __b;
	vadd.i32	q8, q8, q15	@ _279, _272, _278
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	it	lt
	movlt	r3, r2	@ _290, _128
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d5, d24, d24	@ _190, _188, _188
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	mov	r0, r3	@ _129, _290
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d4, d19, d18	@ _252, _247, _247
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r3, s14	@ int	@ _160, _158
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d6, d20, d20	@ _222, _220, _220
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ _129, _160
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:547:   return __a + __b;
	vadd.i32	d16, d17, d16	@ _284, _279, _279
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	it	lt
	movlt	r0, r3	@ _161, _160
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r3, s10	@ int	@ _192, _190
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d4, d4, d4	@ _254, _252, _252
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ _161, _192
	it	lt
	movlt	r0, r3	@ _193, _192
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:3679:   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b);
	vpadd.i32	d7, d16, d16	@ _286, _284, _284
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r3, s12	@ int	@ _224, _222
	vmov	r2, s8	@ int	@ _256, _254
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	cmp	r0, r3	@ _193, _224
	it	lt
	movlt	r0, r3	@ _225, _224
	cmp	r0, r2	@ _225, _256
@ /usr/lib/gcc/arm-linux-gnueabihf/14/include/arm_neon.h:6190:   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b);
	vmov	r3, s14	@ int	@ _288, _286
@ matrix_optimized.c:886:         if (row_sum > maximum_row_sum) {
	it	lt
	movlt	r0, r2	@ _257, _256
@ matrix_optimized.c:892: }
	vldm	sp!, {d8-d11}	@,
	cmp	r0, r3	@ _257, _288
	it	lt
	movlt	r0, r3	@, _288
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
@ matrix_optimized.c:908:     if (first < 0 || second < 0) {
	orrs	r3, r0, r1	@ tmp132, first, second
	bmi	.L911		@,
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r0, .L909	@ first,
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	sdiv	r3, r3, r0	@ _12, tmp125, first
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r1, r3	@ second, _12
	bgt	.L911		@,
.L909:
@ matrix_optimized.c:916:     product = first * second;
	mul	r3, r1, r0	@ product_13, second, first
@ matrix_optimized.c:921:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:919:     *result = product >> FRACTION_BITS;
	asrs	r3, r3, #12	@ _14, product_13,
@ matrix_optimized.c:919:     *result = product >> FRACTION_BITS;
	str	r3, [r2]	@ _14, *result_9(D)
@ matrix_optimized.c:921:     return 1;
	bx	lr	@
.L911:
@ matrix_optimized.c:909:         return 0;
	movs	r0, #0	@ <retval>,
@ matrix_optimized.c:922: }
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
@ matrix_optimized.c:938: {
	mov	r5, r1	@ inverse, tmp132
	mov	r6, r2	@ condition_number, tmp133
@ matrix_optimized.c:939:     int32_t matrix_norm  = matrix_infinity_norm(matrix);
	bl	matrix_infinity_norm(PLT)	@
	mov	r4, r0	@ tmp134,
@ matrix_optimized.c:940:     int32_t inverse_norm = matrix_infinity_norm(inverse);
	mov	r0, r5	@, inverse
	bl	matrix_infinity_norm(PLT)	@
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	cbz	r4, .L916	@ matrix_norm,
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	mvn	r3, #-2147483648	@ tmp125,
	udiv	r3, r3, r4	@ _16, tmp125, matrix_norm
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	cmp	r0, r3	@ inverse_norm, _16
@ matrix_optimized.c:909:         return 0;
	it	gt
	movgt	r0, #0	@ <retval>,
@ matrix_optimized.c:912:     if (first != 0 && second > INT32_MAX / first) {
	bgt	.L915		@,
.L916:
@ matrix_optimized.c:916:     product = first * second;
	mul	r4, r0, r4	@ product_17, inverse_norm, matrix_norm
@ matrix_optimized.c:921:     return 1;
	movs	r0, #1	@ <retval>,
@ matrix_optimized.c:919:     *result = product >> FRACTION_BITS;
	asrs	r4, r4, #12	@ _18, product_17,
@ matrix_optimized.c:919:     *result = product >> FRACTION_BITS;
	str	r4, [r6]	@ _18, *condition_number_8(D)
.L915:
@ matrix_optimized.c:944: }
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
