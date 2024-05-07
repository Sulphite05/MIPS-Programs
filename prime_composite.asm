.data
    msg: .asciiz "Enter any integer: "
    prime: .asciiz "The number is prime."
    composite: .asciiz "The number is composite."

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

    move $t0, $s0
    li $t1, 1           # divisor
    li $t2, 0           # counts factors

    loop:               # to do
        
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