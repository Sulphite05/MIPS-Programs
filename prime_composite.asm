.data
    msg: .asciiz "Enter any integer: "
    prime: .asciiz "The number is prime."
    composite: .asciiz "The number is composite."
    neither: .asciiz "The number is neither prime nor composite."

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
    
    slti $t4, $s0, 2    # check if number is less than 2
    beq $t4, $0, init   # if false, run calculations  
    
    li $v0, 4           # print neither if true
    la $a0, neither
    syscall
    
    j end

    init:
        li $t1, 2           # divisor/ loop iterator
        li $t2, 2           # counts factors(all numbers greater than 1 have atleast 2 factors)

    loop:               # to do
        beq $s0, $t1, prime_label       # if number and divsor are same, go print prime
        div $s0, $t1                    # divide number
        mfhi $t3                        # store remainder
        beq $t3, $0, composite_label    # if it is a factor then we have more than 2 factors
        addi $t1, $t1, 1                # increment iterator
        j loop

        
    prime_label:
        li $v0, 4           # print prime
        la $a0, prime
        syscall
    
    j end
    
    composite_label:
        li $v0, 4           # print composite
        la $a0, composite
        syscall
    
    end:
  

jr $ra
.end main