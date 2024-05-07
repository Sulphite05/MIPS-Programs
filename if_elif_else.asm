.data

    msg: .asciiz "Enter temperature of the day: "
    hot: .asciiz "It is hot day."
    cold: .asciiz "It is cold day"
    pleasant: .asciiz "Pleasant weather"

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

    li $t0, 30
    bgt $s0, $t0, hot_label

    li $t1, 20
    bgt $s0, $t1, pleasant_label

    j cold_label

    hot_label:
        li $v0, 4
        la $a0, hot
        syscall
    
    j end

    pleasant_label:
        li $v0, 4
        la $a0, pleasant
        syscall

    j end

    cold_label:
        li $v0, 4
        la $a0, cold
        syscall

    end:

jr $ra
.end main