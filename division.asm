.data

msg1: .asciiz "Enter the dividend: "
msg2: .asciiz "\nEnter the divisor: "
msg3: .asciiz "\nQuotient is: "
msg4: .asciiz "\nRemainder is: "

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

div $s0, $s1
mflo $s2
mfhi $s3

li $v0, 4
la $a0, msg3
syscall


li $v0, 1
move $a0, $s2
syscall

li $v0, 4
la $a0, msg4
syscall


li $v0, 1
move $a0, $s3
syscall

jr $ra
.end main


