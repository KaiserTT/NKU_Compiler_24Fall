.global main

main: addi  a0, x0, 1
        la    a1, helloworld
        addi  a2, x0, 16
        addi  a7, x0, 64
        ecall

        addi    a0, x0, 0
        addi    a7, x0, 93
        ecall

.data
helloworld:      .ascii "Hello Compiler!\n"