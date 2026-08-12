	.cpu cortex-a7
	.arch armv7-a
	.arch_extension virt
	.arch_extension idiv
	.arch_extension sec
	.arch_extension mp
	.fpu neon-vfpv4
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"matrix_optimized.c"
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
	ldr	r3, .L5
	add	r2, r0, #128
.LPIC0:
	add	r3, pc
.L2:
	vld1.16	{d16-d17}, [r3:128]!
	vst1.16	{d16-d17}, [r0]!
	cmp	r0, r2
	bne	.L2
	bx	lr
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
	add	r1, r0, r1, lsl #4
	add	r0, r0, r2, lsl #4
	vld1.16	{d16-d17}, [r1]
	vld1.16	{d18-d19}, [r0]
	vst1.16	{d18-d19}, [r1]
	vst1.16	{d16-d17}, [r0]
	bx	lr
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	vpush.64	{d8, d9, d10, d11}
	ldr	r2, .L76
	sub	sp, sp, #340
	ldr	r5, .L76+4
	add	r3, sp, #87
	bic	r3, r3, #15
	add	r6, r0, #128
.LPIC1:
	add	r2, pc
	mov	r10, r3
.LPIC3:
	add	r5, pc
	mov	r1, r3
	movs	r7, #13
	strd	r7, r7, [r2]
.L9:
	vld1.16	{d18-d19}, [r0]!
	mov	r2, r1
	adds	r1, r1, #32
	vld1.16	{d16-d17}, [r5:128]!
	vst1.16	{d18-d19}, [r2:128]!
	cmp	r0, r6
	vst1.16	{d16-d17}, [r2:128]
	bne	.L9
	ldr	fp, .L76+8
	movs	r1, #0
	str	r3, [sp, #4]
	mov	lr, r3
.LPIC4:
	add	fp, pc
	mov	ip, r1
	str	r4, [sp, #16]
	movs	r0, #13
	str	r0, [sp, #8]
.L41:
	ldrsh	r0, [r10]
	cmp	ip, #7
	add	r9, ip, #1
	asr	r4, r0, #31
	eor	r6, r0, r4
	sub	r6, r6, r4
	beq	.L43
	ldr	r4, [sp, #4]
	mov	r7, ip
	mov	r5, r9
.L12:
	lsls	r2, r5, #5
	ldrsh	r2, [r4, r2]
	asr	r8, r2, #31
	eor	r2, r8, r2
	sub	r2, r2, r8
	cmp	r6, r2
	it	lt
	movlt	r7, r5
	add	r5, r5, #1
	it	lt
	movlt	r6, r2
	cmp	r5, #8
	bne	.L12
.L10:
	cbz	r6, .L19
	clz	r6, r6
	ldr	r5, [sp, #8]
	subs	r6, r6, #19
	ldr	r4, [fp, #4]
	cmp	r6, #0
	it	ge
	addge	r5, r5, r6
	cmp	r5, r4
	it	gt
	strgt	r5, [fp, #4]
	cmp	r7, r1
	beq	.L16
	lsls	r7, r7, #5
	mov	r0, lr
	add	r4, r7, #16
	vld1.16	{d22-d23}, [r0:128]!
	add	r7, r7, r3
	add	r4, r4, r3
	vld1.16	{d20-d21}, [r0:128]
	vld1.16	{d18-d19}, [r7:128]
	vld1.16	{d16-d17}, [r4:128]
	vst1.16	{d22-d23}, [r7:128]
	vst1.16	{d20-d21}, [r4:128]
	vst1.16	{d18-d19}, [lr:128]
	vst1.16	{d16-d17}, [r0:128]
	ldrsh	r0, [r10]
.L16:
	movs	r4, #1
	add	r5, lr, #2
	cmp	r1, #0
	beq	.L18
	mov	r5, lr
	movs	r4, #0
.L17:
	cbnz	r0, .L74
.L19:
	movs	r0, #0
	add	sp, sp, #340
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L74:
	asr	r8, r0, #31
	eor	r6, r0, r8
	sub	r6, r6, r8
	asrs	r2, r6, #1
	str	r2, [sp, #12]
.L20:
	ldrsh	r6, [r5]
	cbz	r6, .L21
	cmp	r0, #4096
	beq	.L25
	cmn	r0, #4096
	itett	ne
	eorne	r7, r8, r6, asr #31
	rsbeq	r2, r6, #0
	ldrne	r2, [sp, #12]
	eorne	r2, r2, r7
	ittt	ne
	subne	r2, r2, r7
	addne	r2, r2, r6, lsl #12
	sdivne	r2, r2, r0
	add	r6, r2, #32768
	cmp	r6, #65536
	bcs	.L40
	sxth	r6, r2
.L21:
	strh	r6, [r5], #2	@ movhi
	adds	r4, r4, #1
	cmp	r4, #16
	beq	.L23
	cmp	r4, r1
	bne	.L20
	adds	r5, r5, #2
	adds	r4, r1, #1
.L18:
	cmp	r4, r1
	bne	.L17
	adds	r5, r5, #2
	adds	r4, r1, #1
	b	.L18
.L75:
	cmp	r2, r1
	beq	.L24
	ldrsh	r6, [r5, #2]!
	mov	r4, r2
	cmp	r6, #0
	beq	.L21
.L25:
	cmp	r4, #15
	add	r2, r4, #1
	bne	.L75
.L23:
	ldr	r5, [sp, #4]
	mov	r0, lr
	mov	r4, #4096
	add	r7, sp, #44
	strh	r4, [r10]	@ movhi
	add	r6, sp, #28
	vld1.16	{d24-d25}, [r0:128]!
	vld1.16	{d22-d23}, [r0:128]
	movs	r0, #0
	mov	r4, r0
.L32:
	lsls	r2, r0, #5
	ldrsh	r2, [r5, r2]
	cmp	r2, #0
	it	ne
	cmpne	r0, r1
	it	ne
	strne	r0, [r7, r4, lsl #2]
	add	r0, r0, #1
	itt	ne
	strhne	r2, [r6, r4, lsl #1]	@ movhi
	addne	r4, r4, #1
	cmp	r0, #8
	bne	.L32
	cmp	r4, #0
	beq	.L34
	ldr	r2, [sp, #44]
	cmp	r4, #1
	ldrsh	r6, [sp, #28]
	add	r0, sp, #44
	add	r5, r3, r2, lsl #5
	add	r7, sp, #28
	str	r0, [sp, #12]
	mov	r8, r5
	vmov.i32	q14, #0  @ v4si
	vld1.16	{d18-d19}, [r8:128]!
	vld1.16	{d26-d27}, [r8:128]
	beq	.L35
	add	r2, r7, r4, lsl #1
	add	r7, sp, #30
	str	r4, [sp, #20]
	mov	r4, r2
.L36:
	vmov	q15, q13  @ v8hi
	vmov.16	d7[0], r6
	vmov.16	d6[0], r6
	vshll.s16	q8, d18, #12
	vshll.s16	q5, d19, #12
	vmov.16	d5[0], r6
	vmov.16	d4[0], r6
	vshll.s16	q4, d30, #12
	vmlsl.s16	q8, d24, d7[0]
	vmlsl.s16	q5, d25, d6[0]
	vshll.s16	q15, d31, #12
	vmlsl.s16	q4, d22, d5[0]
	ldr	r6, [r0, #4]!
	mov	r2, r5
	vmlsl.s16	q15, d23, d4[0]
	add	r5, r3, r6, lsl #5
	vrshr.s32	q8, q8, #12
	vrshr.s32	q5, q5, #12
	ldrsh	r6, [r7], #2
	mov	r8, r5
	vmovn.i32	d20, q8
	vld1.16	{d18-d19}, [r8:128]!
	vmovn.i32	d21, q5
	vrshr.s32	q4, q4, #12
	vrshr.s32	q15, q15, #12
	vld1.16	{d26-d27}, [r8:128]
	vst1.16	{d20-d21}, [r2]!
	vmovn.i32	d20, q4
	vmovn.i32	d21, q15
	cmp	r4, r7
	vst1.16	{d20-d21}, [r2:128]
	vshr.s32	q10, q8, #31
	veor	q8, q8, q10
	vshr.s32	q10, q5, #31
	veor	q5, q5, q10
	vshr.s32	q10, q4, #31
	vorr	q8, q8, q5
	veor	q4, q4, q10
	vshr.s32	q10, q15, #31
	vorr	q8, q8, q4
	veor	q15, q15, q10
	vorr	q8, q8, q15
	vorr	q14, q14, q8
	bne	.L36
	ldr	r4, [sp, #20]
.L35:
	vshll.s16	q8, d18, #12
	vshll.s16	q10, d19, #12
	vmov.16	d3[0], r6
	vmov.16	d2[0], r6
	vmlsl.s16	q8, d24, d3[0]
	vmov.16	d1[0], r6
	vmlsl.s16	q10, d25, d2[0]
	vmov.16	d0[0], r6
	ldr	r0, [sp, #12]
	movs	r6, #0
	vrshr.s32	q8, q8, #12
	add	r4, r0, r4, lsl #2
	vrshr.s32	q10, q10, #12
	vshr.s32	q15, q8, #31
	vshr.s32	q12, q10, #31
	vmovn.i32	d18, q8
	veor	q12, q10, q12
	veor	q8, q8, q15
	vmovn.i32	d19, q10
	vorr	q8, q8, q12
	vshll.s16	q10, d27, #12
	vshll.s16	q12, d26, #12
	vst1.16	{d18-d19}, [r5:128]
	vmlsl.s16	q12, d22, d1[0]
	vmov	q9, q10  @ v4si
	vorr	q8, q8, q14
	vmlsl.s16	q9, d23, d0[0]
	vrshr.s32	q10, q12, #12
	vshr.s32	q13, q10, #31
	vrshr.s32	q9, q9, #12
	vmovn.i32	d22, q10
	vshr.s32	q12, q9, #31
	veor	q10, q10, q13
	vmovn.i32	d23, q9
	vorr	q8, q8, q10
	veor	q9, q9, q12
	vst1.16	{d22-d23}, [r8:128]
	vorr	q8, q8, q9
.L37:
	ldr	r2, [r0], #4
	add	r2, ip, r2, lsl #4
	cmp	r0, r4
	strh	r6, [r3, r2, lsl #1]	@ movhi
	bne	.L37
	vorr	d16, d17, d16
	vpmax.u32	d16, d16, d16
	vmov	r4, r5, d16  @ v2si
	cmp	r4, #0
	beq	.L34
	clz	r4, r4
	ldr	r2, [sp, #8]
	rsb	r0, r4, #32
	cmp	r2, r0
	bge	.L39
	ldr	r4, .L76+12
	str	r0, [sp, #8]
.LPIC6:
	add	r4, pc
	str	r0, [r4]
.L39:
	cmp	r0, #15
	ble	.L34
.L40:
	mov	r0, #-1
	add	sp, sp, #340
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L34:
	ldr	r2, [sp, #4]
	cmp	r9, #8
	add	r1, r1, #1
	add	r10, r10, #34
	add	r2, r2, #2
	add	lr, lr, #32
	str	r2, [sp, #4]
	bne	.L48
	ldr	r4, [sp, #16]
	adds	r3, r3, #16
	add	r2, r4, #128
.L42:
	vld1.16	{d16-d17}, [r3:128]
	adds	r3, r3, #32
	vst1.16	{d16-d17}, [r4]!
	cmp	r4, r2
	bne	.L42
	movs	r0, #1
	add	sp, sp, #340
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L48:
	mov	ip, r9
	b	.L41
.L43:
	movs	r7, #7
	b	.L10
.L24:
	adds	r4, r4, #2
	adds	r5, r5, #4
	b	.L20
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
	vmov.i32	q12, #2048  @ v4si
	push	{r4, r5, lr}
	mov	r4, r0
	sub	ip, r0, #2
	mov	r5, r1
	mov	lr, r2
	adds	r4, r4, #126
	add	r0, r1, #128
.L80:
	vmov.i32	q13, #0  @ v4si
	mov	r3, r5
	mov	r2, ip
	vmov	q14, q13  @ v4si
.L79:
	ldrsh	r1, [r2, #2]!
	vld1.16	{q10}, [r3]!
	vdup.16	q8, r1
	cmp	r0, r3
	vmull.s16 q9, d16, d20
	vmull.s16 q8, d17, d21
	vsub.i32	q11, q12, q9
	vsub.i32	q10, q12, q8
	vadd.i32	q3, q9, q12
	vadd.i32	q15, q8, q12
	vshr.s32	q11, q11, #12
	vshr.s32	q10, q10, #12
	vcge.s32	q9, q9, #0
	vcge.s32	q8, q8, #0
	vshr.s32	q3, q3, #12
	vshr.s32	q15, q15, #12
	vneg.s32	q11, q11
	vneg.s32	q10, q10
	vbsl	q9, q3, q11
	vbsl	q8, q15, q10
	vadd.i32	q14, q14, q9
	vadd.i32	q13, q13, q8
	bne	.L79
	mov	r3, lr
	add	ip, ip, #16
	cmp	ip, r4
	add	lr, lr, #32
	vst1.32	{q14}, [r3]!
	vst1.32	{q13}, [r3]
	bne	.L80
	pop	{r4, r5, pc}
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
	mov	r2, r0
	movs	r0, #0
	add	r1, r2, #128
.L85:
	vld1.16	{d16-d17}, [r2]!
	vmovl.s16	q9, d16
	vmovl.s16	q8, d17
	vabs.s32	q9, q9
	vabs.s32	q8, q8
	vadd.i32	q8, q8, q9
	vadd.i32	d7, d16, d17
	vpadd.i32	d7, d7, d7
	vmov	r3, s14	@ int
	cmp	r0, r3
	it	lt
	movlt	r0, r3
	cmp	r2, r1
	bne	.L85
	bx	lr
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
	orrs	r3, r0, r1
	bmi	.L91
	cbz	r0, .L89
	mvn	r3, #-2147483648
	sdiv	r3, r3, r0
	cmp	r1, r3
	bgt	.L91
.L89:
	mul	r3, r1, r0
	movs	r0, #1
	asrs	r3, r3, #12
	str	r3, [r2]
	bx	lr
.L91:
	movs	r0, #0
	bx	lr
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
	push	{r4, r5, r6, lr}
	mov	r5, r1
	mov	r6, r2
	bl	matrix_infinity_norm(PLT)
	mov	r4, r0
	mov	r0, r5
	bl	matrix_infinity_norm(PLT)
	orrs	r3, r4, r0
	bmi	.L99
	cbz	r4, .L97
	mvn	r3, #-2147483648
	sdiv	r3, r3, r4
	cmp	r0, r3
	bgt	.L99
.L97:
	mul	r4, r0, r4
	movs	r0, #1
	asrs	r4, r4, #12
	str	r4, [r6]
	pop	{r4, r5, r6, pc}
.L99:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
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
