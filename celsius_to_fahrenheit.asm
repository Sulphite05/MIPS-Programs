.data

cTemp: .word 03
fTemp: .word 0
nine:  .byte 9
five:  .byte 5
res:   .asciiz "The temperature in fahrenheit is: "

.text
.globl main
.ent main

main:

lui $s0, 0x1001     # get base address
lw $s1, 0($s0)      # get celsius temp
lb $t0, 8($s0)      # get 9
lb $t1, 9($s0)      # get 5
mult $s1, $t0       # multiply celsius by nine
mflo $s1            # store result
addi $s1, $s1, 2    # to get a rounded answer(divide divisor 
                    # by half(5/2) and add ans to dividend(2))
div $s1, $t1        # divide by 5
mflo $s2            # get answer
addi $s2, $s2, 32   # add 32
sw $s2, 4($s0)      # save answer

li $v0, 4
la $a0, res
syscall

li $v0, 1
move $a0, $s2
syscall

jr $ra
.end main

# formula F = C*(9/5) + 32

