.data
array: .space 24 # 24 bytes toy apothikeytikoy xwroy
mnm1: .asciiz "Dwse akeraio arithmo:\n"
mnm2: .asciiz "O taxinomimenos pinakas einai:\n"
.text
main:
#mhnyma ston xrhsth
li $v0, 4
la $a0, mnm1
syscall
addi $t0, $t0, 6 # metrhths epanalhphshs
addi $t1, $zero, 0 # metrhths epanalhphshs
addi $s4, $zero, 0 # metrhths pinaka




loop1:
    bgt $t0, 24, endloop1
        loop2:
            ble $t0, $t1, endloop2
            li $v0, 5
            syscall
            move $t3, $v0
            sw $t3, array($s4)
            add $t1, $t1, 1 # bhma gia thn for
            add $s4, $s4, 4 # bhma gia ton pinaka array
            j loop2
            endloop2
           add $t0, $t0, -1 # bhma gia thn for
        j loop1
    endloop2:     
endloop1:

addi $t5, $t5, 1 # metrhths epanalhphshs


loop3:
    bge $t5, 24, endloop3
    addi $s6, $zero, 0
    loop4:
        bge $s6, 20, endloop4
            if: 
                lw $t8, array($s6)
                addi $s6, $s6, 4
                lw $t9, array($s6)
                bgt $t8, $t9, swap
                swap: 
                    move $t7, $t8
                    move $t8, $t9
                    move $t9, $t7

            addi $s6, 4
     j loop4
j loop3  


# mhnyma ston xrhsth
li $v0, 4
la $a0, mnm2
syscall

addi $t0, $zero, 0 
addi $t1, $zero 0 # metrhths epanalhphshs
addi $s5, $zero, 0 # metrhths pinaka

loop5:
    bgt $t1, 24, endloop5
            lw $t3, array($s5)
            add $t1, $t1, 1 # bhma gia thn for
            add $s5, $s5, 4 # bhma gia ton pinaka array
            li $v0, 1
            syscall
            move $t3, array($s5)
j loop5    
endloop5:

exit:
li $v0, 10
syscall


