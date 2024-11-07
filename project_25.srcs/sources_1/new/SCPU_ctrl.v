`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module SCPU_ctrl(
  input [4:0]       OPcode, 
  input [2:0]       Fun3,
  input             Fun7,
  input             MIO_ready,
  output reg [2:0]  ImmSel,
  output reg        ALUSrc_B,
  output reg [1:0]  MemtoReg,
  output reg [1:0]  Jump,
  output reg        Branch,
  output reg        BranchN,
  output reg        RegWrite,
  output reg        MemRW,
  output reg [3:0]  ALU_Control,
  output reg        CPU_MIO
);

always @(*) begin
    case(OPcode)
        5'b01100: begin // R
            Jump <= 2'b00;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 0;
            RegWrite <= 1;
            MemtoReg <= 2'b0;
            MemRW <= 0;
            ImmSel <= `IMM_SEL_I;
            case(Fun3) 
                3'b000: begin
                    case(Fun7)
                        1'b0: begin
                            ALU_Control <= `ALU_OP_ADD; // add
                        end
                        1'b1: begin
                            ALU_Control <= `ALU_OP_SUB; // sub
                        end
                    endcase
                end
                3'b001: begin
                    ALU_Control <= `ALU_OP_SLL; // sll
                end
                3'b010: begin
                    ALU_Control <= `ALU_OP_SLT; // slt
                end
                3'b011: begin
                    ALU_Control <= `ALU_OP_SLTU; // sltu
                end
                3'b100: begin
                    ALU_Control <= `ALU_OP_XOR; // xor
                end
                3'b101: begin
                    case(Fun7)
                        1'b0: begin
                            ALU_Control <= `ALU_OP_SRL; // srl
                        end
                        1'b1: begin
                            ALU_Control <= `ALU_OP_SRA; // sra
                        end
                    endcase
                end
                3'b110: begin
                    ALU_Control <= `ALU_OP_OR; // or
                end
                3'b111: begin
                    ALU_Control <= `ALU_OP_AND; // and
                end
            endcase
        end

        5'b00100: begin // I without mem
            CPU_MIO <= 0;
            Jump <= 2'b00;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 1;
            MemtoReg <= 2'b0;
            MemRW <= 0;
            ImmSel <= `IMM_SEL_I;
            case(Fun3)
                3'b000: begin
                    ALU_Control <= `ALU_OP_ADD; // addi
                end
                3'b010: begin
                    ALU_Control <= `ALU_OP_SLT; // slti
                end
                3'b011: begin
                    ALU_Control <= `ALU_OP_SLTU; // sltiu
                end
                3'b100: begin
                    ALU_Control <= `ALU_OP_XOR; // xori
                end
                3'b001: begin
                    ALU_Control <= `ALU_OP_SLL; // slli
                end
                3'b101: begin
                    ALU_Control <= `ALU_OP_SRL; // srli
                end
                3'b101: begin
                    ALU_Control <= `ALU_OP_SRA; // srai
                end
                3'b110: begin
                    ALU_Control <= `ALU_OP_OR; // ori
                end
                3'b111: begin
                    ALU_Control <= `ALU_OP_AND; // andi
                end
            endcase
        end
    5'b00000: begin // I with mem， lw
            CPU_MIO <= 1;
            Jump <= 2'b00;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 1;
            MemtoReg <= 2'b01;
            MemRW <= 0;
            ImmSel <= `IMM_SEL_I;
            ALU_Control <= `ALU_OP_ADD; // add for address calculation
        end
    5'b11001: begin // JALR
            CPU_MIO <= 0;
            Jump <= 2'b10;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 1;
            MemtoReg <= 2'b10; // PC + 4
            MemRW <= 0;
            ImmSel <= `IMM_SEL_I;
            ALU_Control <= `ALU_OP_ADD; // add for address calculation
        end
    5'b01000: begin // S, sw
            CPU_MIO <= 1;
            Jump <= 2'b00;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 1;
            RegWrite <= 0;
            MemtoReg <= 2'b00;
            MemRW <= 1;
            ImmSel <= `IMM_SEL_S;
            ALU_Control <= `ALU_OP_ADD; // add for address calculation
        end
    5'b11000: begin // B, beq
            CPU_MIO <= 0;
            Jump <= 2'b00;
            ALUSrc_B <= 0;
            RegWrite <= 0;
            MemtoReg <= 2'b00; 
            MemRW <= 0;
            ImmSel <= `IMM_SEL_B;
            ALU_Control <= `ALU_OP_SUB; // sub for branch
            case(Fun3)
                3'b000: begin
                    Branch <= 1;
                    BranchN <= 0;
                end
                3'b001: begin
                    Branch <= 0;
                    BranchN <= 1;
                end
            endcase
        end
    5'b11011: begin // J, jal
            CPU_MIO <= 0;
            Jump <= 2'b01;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 0;
            RegWrite <= 1;
            MemtoReg <= 2'b10; // PC + 4
            MemRW <= 0;
            ImmSel <= `IMM_SEL_J;
            ALU_Control <= `ALU_OP_ADD; // add for address calculation
        end
    5'b01101: begin // U, lui
            CPU_MIO <= 0;
            Jump <= 2'b00;
            Branch <= 0;
            BranchN <= 0;
            ALUSrc_B <= 0;
            RegWrite <= 1;
            MemtoReg <= 2'b11; // Imm
            MemRW <= 0;
            ImmSel <= `IMM_SEL_U;
            ALU_Control <= `ALU_OP_ADD; // add for address calculation
        end
    endcase
end

endmodule
