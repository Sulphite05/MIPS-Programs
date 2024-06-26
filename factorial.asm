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
move $s0, $v0       # first integer is moved to $s0


addi $t0,$s0,0      # index variable t0
addi $t1,$0,1       # factorial variable t1

slti $t2, $s0, 0    # check if number is less than zero
slti $t3, $s0, 13   # check if number is less than 13

xor $t4, $t2, $t3
#beq $t2, $0, LOOP   # if number is not less than zero, run loop
bne $t4, $0, LOOP   # if number is less than 13, run loop

li $v0, 4           # preparing for string display
la $a0, error_msg
syscall             # error_msg will be displayed on console

j main              # re-run program

LOOP:  
    beq $t0,$0, exit
    mult $t1,$t0
    mflo $t1            # fact=fact*i
    addi $t0,$t0,-1     # i=i-1
j LOOP

exit:
li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg2 will be displayed on console

li $v0, 1           # preparing for integer output
move $a0, $t1       # result is moved to $a0
syscall             # result is displayed on console

jr $ra
.end main
