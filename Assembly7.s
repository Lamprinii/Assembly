.data
array:  .space 32 # 32 bytes toy apothikeytikou xwrou


mnm1: .asciiz "Dwse ton arithmo:"   
mnm2: .asciiz "O dyadikos arithmos einai: "


.text
main:
# emfanish mhnymatos	
li		$v0, 4													
la		$a0, mnm1												
syscall


# diavasma tou akeraiou apo ton xrhsth
li		$v0, 5														
syscall			
# thn timh poy phrame thn ekxwroume sthn metavlhth t0
move $t0, $v0




#the binnart number is...
li      $v0, 4
la      $a0, mnm2
syscall	




li	$t1, 0
li	$t2, 0
li	$t7, 0

# h prwth epanalhpsh gia na parw tis times apo ton pinaka
loop:
bgt		$t1, 7, end_loop
		
		sw		$t7, array($t2) # pairnei tis times apo ton pinaka
		add		$t2, $t2, 4 # metrhths pinaka
		add		$t1, $t1, 1 # metrhths epanalhpshs
		
		j loop

end_loop:


li	$t1, 0
li	$t2, 0

# h deyterh epanalhpsh gia na vrw to ypoloipo tis times toy pinaka
loop1:

bgt		$t1, 7, end_loop1

	rem		$t9, $t0, 2 # ypoloipo
 	sw		$t9, array($t2) # apothikeysh tou apotelesmatos
	div		$t0, $t0, 2 # diairesh
	add		$t1, $t1, 1 # metrhths epanalhpshs
	add		$t2, $t2, 4 # metrhths pinaka
	
	j loop1
	
end_for1:


li		$t1, 0
li		$t2, 28

# h trith epanalhpsh emfanizei to apotelesma
loop2:
bgt		$t1, 7, end_loop2



		li		$v0, 1
		lw		$a0, array($t2) # vazei to apotelesma mesa ston pinaka
		syscall
		
		sub		$t2, $t2, 4 #metrhths toy pinaka
		add		$t1, $t1, 1 # metrhths ths epanalhpshs

		j loop2
		
end_for2:		





# exodos programmatos
li	$v0, 10
syscall