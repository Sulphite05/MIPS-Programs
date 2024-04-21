.data

msg1: .asciiz "Enter any number: "
msg2: .asciiz "\nThe two's complement of the number is: "

.text
.globl main
.ent main

main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $s0, $v0

li $v0, 4
la $a0, msg2
syscall

nor $s0, $s0, $s0
addi $s0, $s0, 1

li $v0, 1
move $a0, $s0
syscall

jr $ra
.end main


