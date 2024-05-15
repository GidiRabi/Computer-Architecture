   
#a0 = n   
fib:
    addi $sp, $sp, -12   # Reserve space for local variables on the stack
    sw $ra, 0($sp)       # Save return address on the stack
    sw $s0, 4($sp)       # Save $s0 on the stack
    sw $s1, 8($sp)       # Save $s1 on the stack

    move $s0, $a0        # Copy the input value (number of terms) to $s0
    li $s1, 0            # Initialize $s1 to 0 (Fibonacci term 0)

    beqz $s0, end_fib    # If number of terms is 0, exit the function

    li $t0, 1            # Load 1 into $t0 (Fibonacci term 1)

    addi $s0, $s0, -2    # Subtract 2 from the number of terms
    beqz $s0, end_fib    # If number of terms is 0 after subtracting 2, exit the function

    loop_fib:
        add $v0, $s1, $t0     # Calculate the next Fibonacci term: $v0 = $s1 + $t0
        move $s1, $t0         # Move $t0 to $s1
        move $t0, $v0         # Move $v0 to $t0

        addi $s0, $s0, -1     # Decrement the number of terms by 1
        bnez $s0, loop_fib    # Repeat the loop until the number of terms is 0

    end_fib:
        lw $ra, 0($sp)        # Restore return address from the stack
        lw $s0, 4($sp)        # Restore $s0 from the stack
        lw $s1, 8($sp)        # Restore $s1 from the stack
        addi $sp, $sp, 12     # Release stack space
        jr $ra                # Return to the caller
    	
    
    
