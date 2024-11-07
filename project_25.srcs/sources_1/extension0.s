# fibonacci
lui a0, 7
addi t0, zero, fib
srai a0, a0, 12
addi sp, zero, 1024
jal ra, fib
bne zero, a0, end


fib:
    beq a0, zero, done # n==0, return 0
    addi t0, a0, -1
    beq t0, zero, done # n==1, return 1
    addi sp, sp, -16
    sw ra, 0(sp) # return address
    sw a0, 8(sp) # n
    addi a0, a0, -1
    jal ra, fib
    lw t0, 8(sp) # old n, -> n -> addr0 -|
    sw a0, 8(sp) # push fib(n-1), -> fib(n-1) -> addr0 -|
    addi a0, t0, -2
    jal ra, fib
    lw t0, 8(sp) # old fib(n-1)
    add a0, a0, t0 # fib(n-2) has been stored in a0
# clean up:
    lw ra, 0(sp) # get return address
    addi sp, sp, 16 # pop two words
done:
    jalr zero, ra, 0
end:
    lui t0, 114
    add zero, zero, zero