addi $s0 , $0 , 1 # start of Ai
addi $s1 , $0 , -1 # start of Bi
addi $s2 , $0 , 1 
sll $s2 , $s2 , 9 # start of Ci
li $t0 , 0 #index i 
li $t1 , 10 # ending of the sigma
addi $t3 , $0 , 0

LOOP: 
slt $t3 , $t0 , $t1 # if i < 9 then continue, else go to DONE
beq $t3 , 0 , DONE 

mult  $s0 , $s1
mflo $t6 

mult $t6 , $s2
li $t6 , 0
mflo $t6 

add $s5 , $s5 , $t6 #$s5 =  Ai*Bi*Ci

sll $s0 , $s0 , 2  #Ai * 4 -> Ai+1
srl $s2 , $s2 , 1 #Ci /2 -> Ci+1

beq $s1 , 1 , Remove2 #Bi * -1
addi $s1 , $s1 , 2
j Skip
Remove2: addi $s1 , $s1 , -2
Skip:

addi $t0 , $t0 , 1 #i++
j LOOP #repeat 

DONE:
