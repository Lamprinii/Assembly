.data
mnm1: .asciiz "Dwse ena noumero: "
mnm2: .asciiz "\nMetakinhse ton disko "
mnm3: .asciiz " apo thn ravdo"
mnm4: .asciiz " sthn ravdo "

.text
.globl main
main:
    # ektypwsh toy string
    li $v0,  4          
    la $a0,  mnm1
    syscall
    # diavasma enos akeraioy
    li $v0,  5          
    syscall

    
    # ekxwroume to thn timh toy v0 sto t0
    add $a0, $v0, $zero # move to $a0
    # dinoume times stis parametrous analoga
    li $a1, 'A'
    li $a2, 'B'
    li $a3, 'C'

    # kaloyme thn synarthsh

    jal hanoi          

    # exodos ths synarthsh
    li $v0, 10         
    syscall

hanoi:

    # apothikeysh sthn stoiva
    addi $sp, $sp, -20 
    # apothikeysh ston pinaka ta stoixeia ayta
    sw   $ra, 0($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)
    sw   $s2, 12($sp)
    sw   $s3, 16($sp)

    # metrhtes 
    add $s0, $a0, $zero
    add $s1, $a1, $zero
    add $s2, $a2, $zero
    add $s3, $a3, $zero

    addi $t1, $zero, 1
    beq $s0, $t1, apotelesma

    # me tis epanalhpseis metakinoyme toys diskoys se kathe ravdo
    loop1:

        addi $a0, $s0, -1
        add $a1, $s1, $zero
        add $a2, $s3, $zero
        add $a3, $s2, $zero
        # kaloyme thn synarthsh xana
        jal hanoi

        j apotelesma
    loop2:

        addi $a0, $s0, -1
        add $a1, $s3, $zero
        add $a2, $s2, $zero
        add $a3, $s1, $zero

        # kaloyme thn synarthsh
        jal hanoi

    exodoshanoi:
    # pairnoyme ta stoixeia apo thn stoiva
        lw   $ra, 0($sp)        
        lw   $s0, 4($sp)
        lw   $s1, 8($sp)
        lw   $s2, 12($sp)
        lw   $s3, 16($sp)

    # pairnoyme ton deikth ths stoivas
        addi $sp, $sp, 20       

        jr $ra

    apotelesma:
    # ektypwsh toy apotelesmatos
        li $v0,  4              
        la $a0,  mnm2
        syscall
        li $v0,  1              
        add $a0, $s0, $zero
        syscall
        li $v0,  4              
        la $a0, mnm3
        syscall
        li $v0,  11             
        add $a0, $s1, $zero
        syscall
        li $v0,  4              
        la $a0,  mnm4
        syscall
        li $v0,  11             
        add $a0, $s2, $zero
        syscall

        beq $s0, $t1, exodoshanoi
        j loop2