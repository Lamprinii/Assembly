.data
mnm1: .asciiz "Dwse ton prwto arithmo:"
mnm2: .asciiz "Dwse ton deytero arithmo:\n"
aptm: .asciiz "To apotelesma meta thn allagh:\n"

.text
main:
#diavasma prwtou arithmou 
li $v0, 4
la $a0, mnm1
syscall
li $v0, 5
syscall

move $t0, $v0

#diavasma deyterou atihmou 
li $v0, 4
la $a0, mnm2
syscall
li $v0, 5
syscall

move $t1, $v0

if:
   #elegxei an to t0 einai iso me to 0
   beqz $t0, telos_if

    #antimetathesh twn dyo arithmwn
    move $t2, $t0
    move $t0, $t1
    move $t1, $t2

    #ektypwnei to apotelesma apo thn antimetathesh
    li $v0, 4
    la $a0, aptm 

    li $v0, 1
    move $a0, $t0

    li $v0, 1
    move $a0, $t1

    #emfanizei ton prwto aithmo 
    li $v0, 4
    la $a0, mnm1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    #emfanizei ton deytero arithmo
    li $v0, 4
    la $a0, mnm22
    syscall

    li $v0, 5
    syscall

    move $t1, $v0
    j if

end_if:
li $v0, 10
syscall
