.data
a: .space 24 # desmeyei 24 bytes toy apothikeytikou xwrou 
epmngrm: .asciiz "\n"
mnm1: .asciiz "Dwse 6 akeraious : "
mnm2: .asciiz "O taxinomimenos pinakas einai : "
keno: .asciiz " "
Menu: .asciiz "Menu : "
eplg0: .asciiz "Dwse to 0 gia thn emfanish toy pinaka."
eplg1: .asciiz "Dwse to 1 gia na vreis to max."
eplg2: .asciiz "Dwse to 2 gia na vreis to min."
eplg3: .asciiz "Dwse 3 gia thn taxinomhsh tou pinaka."
eplg4: .asciiz "Dwse 4 gia thn exodo toy programmatos."
max: .asciiz "To max einai:"
emfspinaka1: .asciiz "O pinakas einai:"
min: .asciiz "To min einai: "
printarray: .asciiz "To pinakas einai: "
emfspinaka2: .text
main:

li $v0, 4
la $a0, mnm1
syscall

li $v0, 4
la $a0, epmngrm
syscall

# Gemizoume ton pinaka array
li $t2, 0
for:
bge $t0, 6, end_for
	
	li $v0, 5
	syscall
	move $t1, $v0

	sw $t1, a($t2)

	addi $t0, 1
	addi $t2, 4

	j for
	end_for:

	li $v0, 4
	la $a0, epmngrm
	syscall

for1:
	# Ektypwsh tou menu
	li $v0, 4
	la $a0, Menu
	syscall
	
	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, eplg0
	syscall

	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, eplg1
	syscall

	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, eplg2
	syscall

	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, eplg3
	syscall

	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, eplg4
	syscall

	li $v0, 4
	la $a0, epmngrm
	syscall
	
	# Rwtaei ton xrhsth gia thn epilogh toy
	
	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	beq $t3, 0, emfanish
	j end_emfanish
	emfanish:
	# Emfanish toy pinaka array
	
	li $v0, 4
	la $a0, emfspinaka2
	syscall
	
	jal ShowArray
		
	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, epmngrm
	syscall
	
	end_emfanish:
	
	beq $t3, 1, max1
	j end_max1
	max1:
	
	# Diadikasia gia na vroume to max
	
	# Thetoume sto max thn timh 0, sto t4
	li $t4, 0
	move $a0, $t4

	jal FindMax
	
	move $s0, $v0
	# Emfanish max
			li $v0, 4
			la $a0, max
			syscall
			
			li $v0, 1
			move $a0, $s0
			syscall
			
			li $v0, 4
			la $a0, epmngrm
			syscall
			
			li $v0, 4
			la $a0, epmngrm
			syscall
	end_max1:
	
	
	beq $t3, 2, min1
	j end_min1
	min1:
	
	#Function to find min
	
	# Thetw timh sto t4 toy min
	li $t4, 10000
	move $a0, $t4
	
	jal FindMin
	
	move $s0, $v0
	# Emfanish min 
			li $v0, 4
			la $a0, min
			syscall
			
			li $v0, 1
			move $a0, $s0
			syscall
			
			li $v0, 4
			la $a0, epmngrm
			syscall
			
			li $v0, 4
			la $a0, epmngrm
			syscall
	end_min1:
	
	beq $t3, 3, txnms
	j end_txnms
	txnms:
	
	# Diadikasia gia emfanish toy pinaka
	jal SortArray
	
	li $v0, 4
	la $a0, epmngrm
	syscall
	
	li $v0, 4
	la $a0, epmngrm
	syscall
	
	end_txnms:
	
bne $t3, 4, for1

# Exodos programmatos 
li $v0, 10
syscall	

# Synarthseis

ShowArray:
# Emfanish pinaka 
		li $t0, 0
		li $t2, 0
		
		loop1:
			bge $t0, 6, end_loop1

			lw $t1, a($t2)
			
			li $v0, 1
			move $a0, $t1
			syscall
			
			li $v0, 4
			la $a0, keno
			syscall

			addi $t0, 1
			addi $t2, 4

			j loop1
		end_loop1:
		
	jr $ra


FindMax:

# Vriskoume kai emfanizoume to max
		li $t0, 0
		li $t2, 0
		
		loop2:
			bge $t0, 6, end_loop2

			lw $t1, a($t2)
			
			# Vriskoume to max mesa ston pinaka
			bgt $t1, $a0, max2
			j end_max2
			max2:
			
			move $a0, $t1
			move $v0, $t1
			
			end_max2:
			
			addi $t0, 1
			addi $t2, 4

			j loop2
		end_loop2:
	
	jr $ra
	

FindMin:

# Vriskoume kai emfanizoume to min ston pinaka
		li $t0, 0
		li $t2, 0
		
		loop3:
			bge $t0, 6, end_loop3

			lw $t1, a($t2)
			
			# Vriskoume to min mesa ston pinaka
			blt $t1, $a0, min2
			j end_min2
			min2:
			
			move $a0, $t1
			move $v0, $t1
			
			end_min2:
			
			addi $t0, 1
			addi $t2, 4

			j loop3
		end_loop3:
			
	jr $ra


SortArray:

	# Arxikopoihsh ths prwths thesis toy pinaka
	li $t2, 0
	li $t0, 0
	li $t6, 0

	# j+1 in loop
	add $t5, $t2, 4

	sort1:
	# Eisagwgh epanalhpshs taxinomhshs
	bge $t2, 20, end_sort1

	lw $t1 a($t2)
	lw $t4 a($t5)

	blt $t1, $t4, swap
	j end_swap
	swap:
		sw $t4 a($t2)
		sw $t1 a($t5)
	end_swap:
		addi $t2, 4
		addi $t5, 4

	j sort1
	end_sort1:

	again:
		bge $t6, 6, end_again
		li $t2, 0
		add $t5, $t2, 4
		addi $t6, 1
	j sort1
	end_again:

	# Thetoume thn timh 0 stoys metrhtes
	li $t0, 0
	li $t2, 0

	# Mhnyma gia ton taxinomhmeno pinaka array
	li $v0, 4
	la $a0, mnm2
	syscall

	li $v0, 4
	la $a0, epmngrm
	syscall

	# Ektypwsh toy taxnimomhnou pinaka
	print:
		bge $t0, 6, end_print
	
		lw $t1, a($t2)
	
		li $v0, 1
		move $a0, $t1
		syscall
	
		li $v0, 4
		la $a0, keno
		syscall
	
		addi $t0, 1
		addi $t2, 4

	j print
end_print:

jr $ra	