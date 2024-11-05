and a1, zero, zero
addi a1, zero, 512
addi sp, zero, 2047
sub sp, sp, a1
srli sp, sp, 1
xori sp, sp, 1023
jal ra, func
jal zero, end

func:
    beq a0, zero, end # n==0, return 0
    addi t0, a0, -1
    beq t0, zero, end # n==1, return 1
    addi sp, sp, -16
    sw ra, 0(sp) # return address
    sw a0, 8(sp) # n
    addi a0, a0, -1
    jal ra, func
    lw t0, 8(sp) # old n, -> n -> addr0 -|
    sw a0, 8(sp) # push fib(n-1), -> fib(n-1) -> addr0 -|
    addi a0, t0, -2
    jal ra, func
    lw t0, 8(sp) # old fib(n-1)
    add a0, a0, t0 # fib(n-2) has been stored in a0
# clean up:
    lw ra, 0(sp) # get return address
    addi sp, sp, 16 # pop two words
    
end:
    ori sp, zero, 1024 # release the stack
    add zero, zero, zero
