.data
a: .space 20 #20 bytes tou apothikeytikou xwroy
mnm1: .asciiz "Dwse ta 5 stoixeia tou pinaka:\n"
mnm2: .asciiz "\nTo apotelesma einai:"
.text
main:

addi $s0, $zero, 0
while:
 bgt $s0, 20 exitwhile
   li $v0, 4
   la $a0, mnm1
   syscall

li $v0, 5
move $t0, $v0
syscall

sw $t0, a($s0)
addi $s0, $s0, 4
j while
exitwhile:

addi $s0, $zero, 0
lw $t6, ar($s0)
addi $s3, $zero, 0
add $s3, $s3, $s6
addi $s0, $s0, 4

epanal:
 bgt $s0, 20, ex
 lw $t6, ar($s0)
 bge $s3, $t6, if
 move $s3, $t6
 syscall
if:
addi $s0, $s0, 4
 j epanal
ex:
 li $v0, 10
 syscall

