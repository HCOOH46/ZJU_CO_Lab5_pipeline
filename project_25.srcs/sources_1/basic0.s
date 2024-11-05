and a1, zero, zero
addi a1, zero, 512
addi sp, zero, 2047
sub sp, sp, a1
srli sp, sp, 1
xori sp, sp, 1023
jal zero, end
    
end:
    ori sp, zero, 1024 # release the stack
    add zero, zero, zero
