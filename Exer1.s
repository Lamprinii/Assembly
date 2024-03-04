.data
mnm1: .asciiz "Dwse arithmo:\n"
msnm2: .asciiz "To apotelesma einai:\n"

.text
main:
#diavazei arithmous
li $v0, 4
la $a0, mnm
syscall

li $v0, 5
syscall

move $t0, $v0

# ypologizei to apotelesma 
li $t1, 1 

for:
bge $t1, $t0, telos_for
 #pollaplasiazei ton arithmo me ton eauto toy  
   mult $t1, $t1
   mfhi $t1
   syscall
 #prosthetei tous arithmous
   addu $t1, $t1, $t1
   j for

telos_for:

#ektypwnei to apotelesma
li $v0, 4
la $a0, mnm2
syscall
li $v0, 5
move $a0, $t1
syscall

#termatizei to apotelesma
li $v0, 10
syscall