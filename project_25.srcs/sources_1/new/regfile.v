`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module regs(
    input clk,
    input rst,
    input RegWrite,
    input [4:0] Rs1_addr,
    input [4:0] Rs2_addr,
    input [4:0] Wt_addr,
    input [31:0] Wt_data,
    output [31:0] Rs1_data, 
    `RegFile_Regs_Outputs
    output [31:0] Rs2_data
    );
    reg [31:0] regs [1:31];

    assign Rs1_data = (Rs1_addr==5'b0) ? 32'b0 : regs[Rs1_addr];
    assign Rs2_data = (Rs2_addr==5'b0) ? 32'b0 : regs[Rs2_addr];

    `RegFile_Regs_Assignments

    integer  i;
    always @(posedge clk or posedge rst) begin
        if(rst==1) for (i=1; i<32; i = i + 1) regs[i] <= 32'b0;
        else if ((Wt_addr != 5'b0) && (RegWrite == 1'b1))
            regs[Wt_addr] <= Wt_data;
    end

endmodule
