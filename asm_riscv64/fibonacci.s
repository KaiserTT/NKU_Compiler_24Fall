.globl fibonacci
.type fibonacci, @function

fibonacci:
    li a1, 0
    li a2, 1
    beq a0, zero, .L2
    li a3, 1

.L1:
    beq a0, a3, .L2
    add a4, a1, a2
    mv a1, a2
    mv a2, a4
    addi a3, a3, 1
    j .L1

.L2:
    mv a0, a2
    ret

.size fibonacci, .-fibonacci
.section .rodata.str1.8,"aMS",@progbits,1
.align 3

.LC0:
    .string "%d"
    .align 3

.LC1:
    .string "Fibonacci result is: %d\n"

.section .text.startup,"ax",@progbits
.align 1
.globl main
.type main, @function

main:
    addi sp, sp, -32
    sd s0, 16(sp)
    lui s0, %hi(n)
    lui a0, %hi(.LC0)
    addi a0, a0, %lo(.LC0)
    addi a1, s0, %lo(n)
    sd ra, 24(sp)
    call __isoc99_scanf

    lw a0, %lo(n)(s0)
    call fibonacci

    mv a1, a0
    lui a0, %hi(.LC1)
    addi a0, a0, %lo(.LC1)
    call printf

    ld ra, 24(sp)
    ld s0, 16(sp)
    li a0, 0
    addi sp, sp, 32
    jr ra
    
.size main, .-main
.globl n
.section .sbss,"aw",@nobits
.align 2
.type n, @object
.size n, 4

n:
    .zero 4
