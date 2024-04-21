.data

msg1: .asciiz "Enter the first integer: "
msg2: .asciiz "\nEnter the second integer: "
msg3: .asciiz "\nProduct is: "

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

li $v0, 5
syscall
move $s1, $v0

li $v0, 4
la $a0, msg3
syscall

mult $s0, $s1
mflo $s2

li $v0, 1
move $a0, $s2
syscall

jr $ra
.end main


