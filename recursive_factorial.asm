.data

    msg1: .asciiz "\n\nFACTORIAL CALCULATOR\nEnter integer: "
    msg2: .asciiz "\nFACTORIAL OF THE GIVEN NO IS "
    error_msg: .asciiz "\n\nOnly enter integers between 0 and 12!"

.text
.globl main
.ent main

main:

    li $v0, 4           # preparing for string display
    la $a0, msg1
    syscall             # msg1 will be displayed on console

    li $v0, 5           # preparing for integer input
    syscall             # first integer was put in $v0
    move $a1, $v0       # first integer is moved to $a1


    addi $t0,$a1,0      # index variable t0
    addi $t1,$0,1       # factorial variable t1

    slti $t2, $a1, 0    # check if number is less than zero
    slti $t3, $a1, 13   # check if number is less than 13

    xor $t4, $t2, $t3
    bne $t4, $0, here   # if number is less than 13, go to call fact

    li $v0, 4           # preparing for string display
    la $a0, error_msg
    syscall             # error_msg will be displayed on console

    j main              # re-run program

here:
    
    addi $sp, $sp, -20  # store all used temporary registers
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    sw $t3, 12($sp)
    sw $t4, 16($sp)

    addi $sp, $sp, -4   # store return address
    sw $ra, 0($sp)

    jal fact

    lw $ra, 0($sp)      # load return address
    addi $sp, $sp, 4 

    lw $t0, 0($sp)      # load all used temporary registers
    lw $t1, 4($sp)
    lw $t2, 8($sp)
    lw $t3, 12($sp)
    lw $t4, 16($sp)
    addi $sp, $sp, 20
    
    li $v0, 4           # preparing for string display
    la $a0, msg2
    syscall             # msg2 will be displayed on console

    li $v0, 1           # preparing for integer output
    move $a0, $v1       # result is moved to $a0
    syscall             # result is displayed on console

jr $ra
.end main

fact:

    beq $a1, $0, base   # check base case

    addi $sp, $sp, -4   # store current argument
    sw $a1, 0($sp)

    addi, $a1, $a1, -1  # decrement arg for recursive factorial

    addi $sp, $sp, -4   # store return address
    sw $ra, 0($sp)

    jal fact

    lw $ra, 0($sp)      # load return address
    addi $sp, $sp, 4

    lw $a1, 0($sp)      # load current argument
    addi $sp, $sp, 4

    mult $a1, $v1       # multiply current arg with result of n-1 factorial
    mflo $v1

    j exit

    base:
        addi $v1, $0, 1 # in case of base case
    
    exit:
        jr $ra          # return
