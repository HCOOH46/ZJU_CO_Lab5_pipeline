`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/18 11:38:13
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module ALU(
    input [31:0] A,
    input [3:0] ALU_operation,
    input  [31:0] B,
    output reg [31:0] res,
    output zero
    );

    reg [3:0] ALU;

    reg [32:0] add;

    always @(*) begin
        ALU <= ALU_operation;
        add <= A + B;
        case (ALU)
            `ALU_OP_AND: res <= A&B; 
            `ALU_OP_OR: res <= A|B;
            `ALU_OP_ADD: res <= add;
            `ALU_OP_SUB: res <= A - B;
            `ALU_OP_SLT: res <= A < B ? 1 : 0;
            `ALU_OP_SLTU: res <= $unsigned(A) < $unsigned(B) ? 1 : 0;
            `ALU_OP_SRL: res <= A >> B[4:0]; //shift right logical
            `ALU_OP_SLL: res <= A << B[4:0]; //shift left logical
            `ALU_OP_XOR: res <= A^B;
            `ALU_OP_SRA: res <= A >>> B; //sra
        endcase
    end

    assign zero = ~|res;

endmodule
