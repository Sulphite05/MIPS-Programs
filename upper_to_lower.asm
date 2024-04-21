.data

msg1: .asciiz "Enter any upper-case alphabet followed by enter: "
msg2: .asciiz "\nYou entered: "

.text
.globl main
.ent main

main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 12
syscall
move $s0, $v0

li $v0, 4
la $a0, msg2
syscall

addi $s0, $s0, 32

li $v0, 11
move $a0, $s0
syscall

jr $ra
.end main


