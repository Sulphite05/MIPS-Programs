.data

msg1: asciiz "Enter some value for x followed by enter: "
msg2: asciiz "Enter some value for y followed by enter: "
msg3: asciiz "Enter some value for z followed by enter: "
msg4: asciiz "Result of x-y+z-3 is "

.text
.globl main
.ent main

main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall
move $t2, $v0

li $v0, 4
la $a0, msg4
syscall

sub $t3, $t0, $t1
add $t3, $t3, $t2
addi $t3, $t3, -12

li $v0, 1
move $a0, $t3
syscall

.end main


