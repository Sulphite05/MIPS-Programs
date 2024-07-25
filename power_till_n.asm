.data
    msg1: .asciiz "\nEnter the base: "
    msg2: .asciiz "Enter the power: "
    msg3: .asciiz "The answer is: "
    msg4: .asciiz "Power should be positive!\n"

.text
.globl main
.ent main

main:
    li $v0, 4           # print msg1
    la $a0, msg1
    syscall

    li $v0, 5           # take base input
    syscall
    move $a1, $v0

    li $v0, 4           # print msg2
    la $a0, msg2
    syscall

    li $v0, 5           # take power input
    syscall
    move $a2, $v0

    slti $s0, $a2, 0
    beq $s0, $0, here

    li $v0, 4           # print msg4
    la $a0, msg4
    syscall

    j main

here:
    addi $sp, $sp, -4
    sw $ra, 0($sp)      # pushing ra on stack

    jal calc_power

    lw $ra, 0($sp)      # popping ra from stack
    addi $sp, $sp, 4

    li $v0, 4           # print msg3
    la $a0, msg3
    syscall

    li $v0, 1           
    move $a0, $v1
    syscall

    jr $ra    

calc_power:

    addi $sp, $sp, -12                      # pushing saved reg
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)

    move $s0, $a1       # base
    move $s1, $a2       # power
    addi $s2, $0, 1     # result

    loop:
        beq $s1, $0, END
        mult $s2, $s0
        mflo $s2
        addi $s1, $s1, -1
        j loop
    
    END:
        move $v1, $s2

        lw $s0, 0($sp)                      # poping saved reg
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        addi $sp, $sp, 12    

        jr $ra 

.end main
