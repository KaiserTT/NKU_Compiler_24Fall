.globl	bubbleSort
.type	bubbleSort, @function

bubbleSort:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L2

	.L6:
		sw	zero,-24(s0)
		j	.L3

	.L5:
		lw	a5,-24(s0)
		slli	a5,a5,2
		ld	a4,-40(s0)
		add	a5,a4,a5
		lw	a3,0(a5)
		lw	a5,-24(s0)
		addi	a5,a5,1
		slli	a5,a5,2
		ld	a4,-40(s0)
		add	a5,a4,a5
		lw	a5,0(a5)
		mv	a4,a3
		ble	a4,a5,.L4
		lw	a5,-24(s0)
		slli	a5,a5,2
		ld	a4,-40(s0)
		add	a5,a4,a5
		lw	a5,0(a5)
		sw	a5,-28(s0)
		lw	a5,-24(s0)
		addi	a5,a5,1
		slli	a5,a5,2
		ld	a4,-40(s0)
		add	a4,a4,a5
		lw	a5,-24(s0)
		slli	a5,a5,2
		ld	a3,-40(s0)
		add	a5,a3,a5
		lw	a4,0(a4)
		sw	a4,0(a5)
		lw	a5,-24(s0)
		addi	a5,a5,1
		slli	a5,a5,2
		ld	a4,-40(s0)
		add	a5,a4,a5
		lw	a4,-28(s0)
		sw	a4,0(a5)
		
	.L4:
		lw	a5,-24(s0)
		addiw	a5,a5,1
		sw	a5,-24(s0)

	.L3:
		lw	a5,-44(s0)
		mv	a4,a5
		lw	a5,-20(s0)
		subw	a5,a4,a5
		sext.w	a5,a5
		addiw	a5,a5,-1
		sext.w	a4,a5
		lw	a5,-24(s0)
		sext.w	a5,a5
		blt	a5,a4,.L5
		lw	a5,-20(s0)
		addiw	a5,a5,1
		sw	a5,-20(s0)

	.L2:
		lw	a5,-44(s0)
		addiw	a5,a5,-1
		sext.w	a4,a5
		lw	a5,-20(s0)
		sext.w	a5,a5
		blt	a5,a4,.L6
		nop
		nop
		ld	s0,40(sp)
		addi	sp,sp,48
		jr	ra
		.size	bubbleSort, .-bubbleSort
		.section	.rodata
		.align	3

	.LC0:
		.string	"\350\257\267\350\276\223\345\205\245\346\225\260\347\273\204\347\232\204\345\244\247\345\260\217: "
		.align	3

	.LC1:
		.string	"%d"
		.align	3

	.LC2:
		.string	"\350\257\267\350\276\223\345\205\245 %d \344\270\252\345\205\203\347\264\240:\n"
		.align	3

	.LC3:
		.string	"\346\216\222\345\272\217\345\220\216\347\232\204\346\225\260\347\273\204:"
		.align	3

	.LC4:
		.string	"%d "

.text
.align	1
.globl	main
.type	main, @function

main:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	sd	s6,64(sp)
	sd	s7,56(sp)
	sd	s8,48(sp)
	sd	s9,40(sp)
	addi	s0,sp,128
	mv	a5,sp
	mv	s1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	addi	a5,s0,-124
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	__isoc99_scanf
	lw	a5,-124(s0)
	mv	a4,a5
	addi	a4,a4,-1
	sd	a4,-112(s0)
	mv	a4,a5
	mv	s8,a4
	li	s9,0
	srli	a4,s8,59
	slli	s5,s9,5
	or	s5,a4,s5
	slli	s4,s8,5
	mv	a4,a5
	mv	s6,a4
	li	s7,0
	srli	a4,s6,59
	slli	s3,s7,5
	or	s3,a4,s3
	slli	s2,s6,5
	slli	a5,a5,2
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,3
	srli	a5,a5,2
	slli	a5,a5,2
	sd	a5,-120(s0)
	lw	a5,-124(s0)
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	sw	zero,-100(s0)
	j	.L8
	
	.L9:
		lw	a5,-100(s0)
		slli	a5,a5,2
		ld	a4,-120(s0)
		add	a5,a4,a5
		mv	a1,a5
		lui	a5,%hi(.LC1)
		addi	a0,a5,%lo(.LC1)
		call	__isoc99_scanf
		lw	a5,-100(s0)
		addiw	a5,a5,1
		sw	a5,-100(s0)

	.L8:
		lw	a4,-124(s0)
		lw	a5,-100(s0)
		sext.w	a5,a5
		blt	a5,a4,.L9
		lw	a5,-124(s0)
		mv	a1,a5
		ld	a0,-120(s0)
		call	bubbleSort
		lui	a5,%hi(.LC3)
		addi	a0,a5,%lo(.LC3)
		call	puts
		sw	zero,-104(s0)
		j	.L10

	.L11:
		ld	a4,-120(s0)
		lw	a5,-104(s0)
		slli	a5,a5,2
		add	a5,a4,a5
		lw	a5,0(a5)
		mv	a1,a5
		lui	a5,%hi(.LC4)
		addi	a0,a5,%lo(.LC4)
		call	printf
		lw	a5,-104(s0)
		addiw	a5,a5,1
		sw	a5,-104(s0)

	.L10:
		lw	a4,-124(s0)
		lw	a5,-104(s0)
		sext.w	a5,a5
		blt	a5,a4,.L11
		li	a0,10
		call	putchar
		li	a5,0
		mv	sp,s1
		mv	a0,a5
		addi	sp,s0,-128
		ld	ra,120(sp)
		ld	s0,112(sp)
		ld	s1,104(sp)
		ld	s2,96(sp)
		ld	s3,88(sp)
		ld	s4,80(sp)
		ld	s5,72(sp)
		ld	s6,64(sp)
		ld	s7,56(sp)
		ld	s8,48(sp)
		ld	s9,40(sp)
		addi	sp,sp,128
		jr	ra

.size	main, .-main
