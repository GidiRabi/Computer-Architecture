li $t0, 0x10011020     # Initialize the base address
li $t1, 1              # Initialize the first number

loop:
    sw $t1, 0($t0)      # Store the current number at the current address
    addiu $t1, $t1, 2   # Increment the number by 2 for odd numbers
    addiu $t0, $t0, 4   # Increment the address by 4 bytes
    bne $t1, 31, loop   # Repeat the loop until the number is 31

end:
