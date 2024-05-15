addi $s0 , $0 , 0 
add $t1 , $t1 , $s1
addi $t0 , $0 , 0

FOR:
	beq $sO, $s2, DONE 
	lw $t2, 0($t1) 
	mult $t2, $t2
	mflo $t3
	mfhi $t4
	add $t2, $0, $t3 or $t2, $t2, $t4 
	sw $t2, O($t1) 
	beq $4, $0, NEXT
	addi $tO, $to, 1 
	NEXT:
	addi $t1, $t1, 4
	addi $sO, $s0, 1 
DONE: