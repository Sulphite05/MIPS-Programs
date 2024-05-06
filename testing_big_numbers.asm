.data

.text
.globl main
.ent main

main:

add $s0, $0, 0x80000000
add $s1, $0, 0xD0000000
# add $t0, $s0, $s1           # arithmetic overflow occurs
# sub $t0, $s0, $s1             # ($s1) was negative -> made positive -> added to ($s0) -> ($t0) = 0xB0000000

add $t0, $s0, $s1
add $t0, $t0, $s0


jr $ra
.end main