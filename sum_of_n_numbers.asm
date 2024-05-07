.data
    msg: .asciiz "Enter any integer: "
    msg_done: .asciiz "The sum is: "

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

    li $t0, 0
    li $t1, 0

    loop:
        beq $t0, $s0, done
        addi $t0, $t0, 1
        add $t1, $t1, $t0        
        j loop
    
    done:
        li $v0, 4           # print msg_done
        la $a0, msg_done
        syscall

        li $v0, 1           # print result
        move $a0, $t1
        syscall     

jr $ra
.end main