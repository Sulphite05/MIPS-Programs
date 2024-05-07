.data
    msg: .asciiz "Enter any integer: "
    even: .asciiz "The given integer is even."
    odd: .asciiz "The given integer is odd."

.text
.globl main
.ent main

main:

    li $v0, 4           # print msg
    la $a0, msg
    syscall

    li $v0, 5           # take integer input
    syscall
    move $s0, $v0

    addi $s1, $0, 2     # store 2

    div $s0, $s1        # divide num by two
    mfhi $s2            # store remainder

    bne $0, $s2, here   # if num is odd; remainder is 1

    li $v0, 4           # print even if even
    la $a0, even
    syscall

    j jump

here: 
        li $v0, 4           # print odd
        la $a0, odd
        syscall

jump:

jr $ra
.end main
