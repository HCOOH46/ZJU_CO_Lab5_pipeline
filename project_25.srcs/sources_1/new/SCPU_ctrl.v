module SCPU_ctrl(
  input [4:0]       OPcode, 
  input [2:0]       Fun3,
  input             Fun7,
  input             MIO_ready,
  output reg [1:0]  ImmSel,
  output reg        ALUSrc_B,
  output reg [1:0]  MemtoReg,
  output reg        Jump,
  output reg        Branch,
  output reg        RegWrite,
  output reg        MemRW,
  output reg [2:0]  ALU_Control,
  output reg        CPU_MIO
);

always @(*) begin
    case(OPcode)
        5'b01100: begin // R
            Jump <= 0;
            Branch <= 0;
            ALUSrc_B <= 0;
            RegWrite <= 1;
            MemtoReg <= 2'b0;
            MemRW <= 0;
            ImmSel <= 2'b00;
            case(Fun3) 
                3'b000: begin
                    case(Fun7)
                        1'b0: begin
                            ALU_Control <= 3'b010; // add
                        end
                        1'b1: begin
                            ALU_Control <= 3'b110; // sub
                        end
                    endcase
                end
                3'b010: begin
                    ALU_Control <= 3'b111; // slt
                end
                3'b100: begin
                    ALU_Control <= 3'b011; // xor
                end
                3'b101: begin
                    ALU_Control <= 3'b101; // srl
                end
                3'b110: begin
                    ALU_Control <= 3'b001; // or
                end
                3'b111: begin
                    ALU_Control <= 3'b000; // and
                end
            endcase
        end

        5'b00100: begin // I without mem
            CPU_MIO <= 0;
            Jump <= 0;
            Branch <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 1;
            MemtoReg <= 2'b0;
            MemRW <= 0;
            ImmSel <= 2'b00;
            case(Fun3)
                3'b000: begin
                    ALU_Control <= 3'b010; // addi
                end
                3'b010: begin
                    ALU_Control <= 3'b111; // slti
                end
                3'b100: begin
                    ALU_Control <= 3'b011; // xori
                end
                3'b101: begin
                    ALU_Control <= 3'b101; // srli
                end
                3'b110: begin
                    ALU_Control <= 3'b001; // ori
                end
                3'b111: begin
                    ALU_Control <= 3'b000; // andi
                end
            endcase
        end
    5'b00000: begin // I with mem， lw
            CPU_MIO <= 1;
            Jump <= 0;
            Branch <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 1;
            MemtoReg <= 2'b01;
            MemRW <= 0;
            ImmSel <= 2'b00;
            ALU_Control <= 3'b010; // add for address calculation
        end
    5'b01000: begin // S, sw
            CPU_MIO <= 1;
            Jump <= 0;
            Branch <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 0;
            MemtoReg <= 2'b0;
            MemRW <= 1;
            ImmSel <= 2'b01;
            ALU_Control <= 3'b010; // add for address calculation
        end
    5'b11000: begin // B, beq
            CPU_MIO <= 0;
            Jump <= 0;
            Branch <= 1;
            ALUSrc_B <= 0;
            RegWrite <= 0;
            MemtoReg <= 2'b0;
            MemRW <= 0;
            ImmSel <= 2'b10;
            ALU_Control <= 3'b110; // sub for branch
        end
    5'b11011: begin // J, jal
            CPU_MIO <= 0;
            Jump <= 1;
            Branch <= 0;
            ALUSrc_B <= 0;
            RegWrite <= 1;
            MemtoReg <= 2'b0;
            MemRW <= 0;
            ImmSel <= 2'b11;
            ALU_Control <= 3'b010; // add for address calculation
        end
    endcase
end

endmodule
