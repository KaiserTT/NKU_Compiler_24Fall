	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"factorial.c"
	.text
	.global	n
	.bss
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.space	4
	.global	res
	.align	2
	.type	res, %object
	.size	res, 4
res:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"factorial result: %d\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L5
.LPIC0:
	add	r3, pc
	mov	r1, r3
	ldr	r3, .L5+4
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	movs	r3, #2
	str	r3, [r7, #4]
	ldr	r3, .L5+8
.LPIC2:
	add	r3, pc
	movs	r2, #1
	str	r2, [r3]
	b	.L2
.L3:
	ldr	r3, .L5+12
.LPIC3:
	add	r3, pc
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	mul	r2, r3, r2
	ldr	r3, .L5+16
.LPIC4:
	add	r3, pc
	str	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, .L5+20
.LPIC5:
	add	r3, pc
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	ble	.L3
	ldr	r3, .L5+24
.LPIC6:
	add	r3, pc
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r3, .L5+28
.LPIC7:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	n-(.LPIC0+4)
	.word	.LC0-(.LPIC1+4)
	.word	res-(.LPIC2+4)
	.word	res-(.LPIC3+4)
	.word	res-(.LPIC4+4)
	.word	n-(.LPIC5+4)
	.word	res-(.LPIC6+4)
	.word	.LC1-(.LPIC7+4)
	.size	main, .-main
