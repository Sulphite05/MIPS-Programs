.data
    msg1: .asciiz "Enter some value for x followed by enter: "
    msg2: .asciiz "\nEnter some value for y followed by enter: "
    msg3: .asciiz "\nEnter some value for z followed by enter: "
    msg4: .asciiz "\nThe average of x, y and z is: "

.text
.globl main
.ent main

average:

    addi $sp, $sp, -12
    sw $t0, 0($sp)
    sw $t0, 4($sp)
    sw $t0, 8($sp)

    add $s0, $a1, $a2
    add $s0, $s0, $a3
    addi $s1, $0, 3
    addi $s2, $0, 2

    div $s1, $s2
    mflo $s2
    add $s0, $s0, $s2   # for rounding

    div $s0, $s1
    mflo $v1

    lw $t0, 0($sp)
    lw $t0, 4($sp)
    lw $t0, 8($sp)
    addi $sp, $sp, 12

    jr $ra

main:

    li $v0, 4           # print msg
    la $a0, msg1
    syscall

    li $v0, 5           # take integer input
    syscall
    move $a1, $v0

    li $v0, 4           # print msg
    la $a0, msg2
    syscall

    li $v0, 5           # take integer input
    syscall
    move $a2, $v0

    li $v0, 4           # print msg
    la $a0, msg3
    syscall

    li $v0, 5           # take integer input
    syscall
    move $a3, $v0

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal average

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    li $v0, 4           # print msg
    la $a0, msg4
    syscall

    li $v0, 1           # take integer input         
    move $a0, $v1
    syscall

jr $ra
.end main