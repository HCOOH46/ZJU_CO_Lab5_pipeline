`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module reg32( // PC寄存器
    input clk,
    input rst,
    input [31:0] data_in,
    output reg [31:0] data_out
    );
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 32'b0;
        end else begin
            data_out <= data_in;
        end
    end
endmodule

module Data_path( 
    input clk,
    input rst,
    input[31:0]inst_field,
    input ALUSrc_B,
    input [1:0]MemtoReg,
    input [1:0] Jump,
    input Branch,
    input RegWrite,
    input[31:0]Data_in,
    input BranchN,
 //寄存器时钟
//寄存器复位
//指令数据域[31:7]
 //ALU端口B输入选择
//Regs写入数据源控制
//J指令
//Beq指令
//寄存器写信号
//存储器输入
    input[3:0]ALU_Control, //ALU操作控制
    input[2:0]ImmSel,
    //ImmGen操作控制
    output[31:0]ALU_out,
    output[31:0]Data_out,
    `RegFile_Regs_Outputs
    output[31:0]PC_out,
    output[31:0] immediate
    // 寄存器组值的读出
 ); 

    wire op2;
   
    wire [31:0] Imm_out;
    assign immediate = Imm_out; 
    /*wire resB = Branch & op2;
    wire [31:0] B4_addr = resB ? (PC_out + Imm_out) : (PC_out + 4);
    wire [31:0] BJ4_addr = Jump ? (PC_out + Imm_out) : B4_addr;*/

    wire [31:0] PC4 = PC_out + 4;
    wire [31:0] IPP = Imm_out + PC_out;
    wire [31:0] PC4_IPP = ((Branch & op2) | ((~op2) & BranchN)) ? IPP : PC4;
    wire [31:0] PC4_IPP_ALU = Jump[1] ? (Jump[0] ? PC4_IPP : ALU_out) : (Jump[0] ? IPP : PC4_IPP);

    reg32 PC(
        .clk(clk),
        .rst(rst),
        .data_in(PC4_IPP_ALU),
        .data_out(PC_out)
    );

    wire [31:0] Rs1_data;
    wire [31:0] Rs2_data;
    assign Data_out = Rs2_data;
    wire [31:0] ALU_res;
    assign ALU_out = ALU_res;

    regs Regs(
        .clk(clk),
        .rst(rst),
        .RegWrite(RegWrite),
        .Rs1_addr(inst_field[19:15]),
        .Rs2_addr(inst_field[24:20]),
        .Wt_addr(inst_field[11:7]),
        .Wt_data(MemtoReg[1] ? (MemtoReg[0] ? Imm_out : PC4) : (MemtoReg[0] ? Data_in : ALU_res)),
        .Rs1_data(Rs1_data),
        `RegFile_Regs_Arguments
        .Rs2_data(Rs2_data)
    );

    ImmGen ImmGen(
        .ImmSel(ImmSel),
        .inst_field(inst_field),
        .Imm_out(Imm_out)
    );

    ALU ALU0(
        .A(Rs1_data),
        .ALU_operation(ALU_Control),
        .B(ALUSrc_B ? Imm_out : Rs2_data),
        .res(ALU_res),
        .zero(op2)
    );
    
endmodule