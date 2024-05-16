.data
    msg1: .asciiz "Enter some value for x followed by enter: "
    msg2: .asciiz "\nEnter some value for y followed by enter: "
    msg3: .asciiz "\nEnter some value for z followed by enter: "
    msg4: .asciiz "\nThe average of x, y and z is: "

.text
.globl main
.ent main

average:
    add $t0, $a1, $a2
    add $t0, $t0, $a3
    addi $t1, $0, 3
    div $t0, $t1
    mflo $v1
    jr $ra


main:

    li $v0, 4           # print msg
    la $a0, msg
    syscall

    li $v0, 5           # take integer input
    syscall
    move $a1, $v0

    li $v0, 4           # print msg
    la $a0, msg
    syscall

    li $v0, 5           # take integer input
    syscall
    move $a2, $v0

    li $v0, 4           # print msg
    la $a0, msg
    syscall

    li $v0, 5           # take integer input
    syscall
    move $a3, $v0

addi $sp, $sp, -4
sw $ra, 0($sp)

jal average

lw $ra, 0($sp)
addi $sp, $sp, 4

jr $ra
.end main