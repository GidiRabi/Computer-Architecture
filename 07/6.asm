StrangeSum:
    addi $sp, $sp, -4    # Reserve space for sum on the stack
	
    addi $t1, $0, 0    # Initialize j to 0
    loop:
        slti $t0, $t1, $a0   # Check if j <= i
        beqz $t0, end        # Exit loop if j > i

        sll $t2, $t1, 2      # Calculate index in Arr (j * 4)
        lw $t3, $a1($t2)     # Load Arr[j] into $t3
        li $t2, 3             # Load immediate value 3 into $t2
	mult $t3, $t2         # Multiply Arr[j] by 3 using 'mult'
	mflo $t6              # Move the lower 32 bits of the result into $t1
	sw $t6, $a1($t3)      # Store the updated value back into Arr[j]	

        add $t4, $t3, $0  # Initialize temp variable to Arr[j]

        lw $t5, ($sp)        # Load sum from stack
        add $t5, $t5, $t4    # Add Arr[j] to sum
        sw $t5, ($sp)        # Store updated sum on stack

        addi $t1, $t1, -1    # Decrement j by 1
        j loop               # Continue loop

    end:
    	jal multi
        lw $v0, ($sp)        # Load sum from stack
        addi $sp, $sp, 4     # Release stack space
        jr $ra               # Return to caller

# Function to calculate multi
multi:
    lw $t7 , ($sp)	#load sum from strangesum into t7
    mult $t7, 12       # Multiply S by 12
    mflo $v0
    sw $v0 ($sp)
    jr $ra                 # Return to caller
