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


module ALU(
    input [31:0] A,
    input [2:0] ALU_operation,
    input  [31:0] B,
    output reg [31:0] res,
    output zero
    );

    reg [2:0] ALU;

    reg [32:0] add;

    always @(*) begin
        ALU <= ALU_operation;
        add <= A + B;
        case (ALU)
            3'b000: res <= A&B; 
            3'b001: res <= A|B;
            3'b010: res <= add;
            3'b110: res <= A - B;
            3'b111: res <= A < B ? 1 : 0;
            3'b100: res <= ~(A|B);
            3'b101: res <= A >> B[4:0]; //shift right logical
            3'b011: res <= A^B;
        endcase
    end

    assign zero = ~|res;

endmodule
