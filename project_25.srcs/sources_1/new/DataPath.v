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
    input[31:0]inst,
    input ALUSrc_B,
    input [1:0] MemtoReg,
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
    output[31:0] ALU_out,
    output[31:0] Data_out,
    output[31:0] Data_out_WB,
    `RegFile_Regs_Outputs
    output[31:0] PC_out_EX,
    output[31:0] PC_out_ID,
    output[31:0] PC_out_IF,
    output[31:0] inst_ID,
    output[31:0] immediate,
    output[31:0] TEMPCHECK0
    // 寄存器组值的读出
 ); 

    wire zero;
    reg [31:0] inst_IF_ID;
    reg [31:0] inst_ID_EX;
    reg [31:0] inst_EX_MEM;
    reg [31:0] inst_MEM_WB;
    reg [31:0] PC_IF_ID;
    reg [31:0] PC_ID_EX;
    reg [31:0] Rs1_data_ID_EX;
    reg [31:0] Rs2_data_EX_MEM;
    reg [31:0] Rs2_data_ID_EX;
    reg [31:0] Imm_out_ID_EX;
    reg [31:0] Imm_out_EX_MEM;
    reg [31:0] Imm_out_MEM_WB;
    reg [31:0] PC_I_EX_MEM;
    reg [31:0] PC4_EX_MEM;
    reg [31:0] PC4_MEM_WB;
    reg [31:0] zero_EX_MEM;
    reg [31:0] ALU_res_EX_MEM;
    reg [31:0] ALU_res_MEM_WB;
    reg [31:0] Data_in_MEM_WB;
   
    wire [31:0] Imm_out;
    assign immediate = Imm_out; 
    wire resB = (Branch & zero_EX_MEM) | ((~zero_EX_MEM) & BranchN);
    wire [31:0] B4_addr = resB ? PC_I_EX_MEM : (PC_out_IF + 4);
    wire [31:0] BJ4_addr = Jump[1] ? (Jump[0] ? B4_addr : ALU_res_EX_MEM) : (Jump[0] ? (PC_out_IF + Imm_out_EX_MEM) : B4_addr);

    assign TEMPCHECK0 = {30'b0, Jump};
    assign PC_out_EX = PC_ID_EX;
    assign PC_out_ID = PC_IF_ID;
    assign inst_ID = inst_IF_ID;

    reg32 PC(
        .clk(clk),
        .rst(rst),
        .data_in(BJ4_addr),
        .data_out(PC_out_IF)
    );

    wire [31:0] Rs1_data;
    wire [31:0] Rs2_data;
    assign Data_out = Rs2_data_EX_MEM;
    wire [31:0] ALU_res;
    assign ALU_out = ALU_res_EX_MEM;
    assign Data_out_WB = MemtoReg[1] ? (MemtoReg[0] ? Imm_out_MEM_WB : PC4_MEM_WB) : (MemtoReg[0] ? Data_in_MEM_WB : ALU_res_MEM_WB);

    always @(posedge clk  or posedge rst) begin
        if(rst) begin
            inst_IF_ID <= 32'b0;
            PC_IF_ID <= 32'b0;

            PC_ID_EX <= 32'b0;
            inst_ID_EX <= 32'b0;
            Rs1_data_ID_EX <= 32'b0;
            Rs2_data_ID_EX <= 32'b0;
            Imm_out_ID_EX <= 32'b0;

            PC4_EX_MEM <= 32'b0;
            PC_I_EX_MEM <= 32'b0;
            zero_EX_MEM <= 32'b0;
            ALU_res_EX_MEM <= 32'b0;
            inst_EX_MEM <= 32'b0;
            Rs2_data_EX_MEM <= 32'b0;
            Imm_out_EX_MEM <= 32'b0;

            PC4_MEM_WB <= 32'b0;
            Data_in_MEM_WB <= 32'b0;
            ALU_res_MEM_WB <= 32'b0;
            inst_MEM_WB <= 32'b0;
            Imm_out_MEM_WB <= 32'b0;
        end else begin
            inst_IF_ID <= inst;
            PC_IF_ID <= PC_out_IF;

            PC_ID_EX <= PC_IF_ID;
            inst_ID_EX <= inst_IF_ID;
            Rs1_data_ID_EX <= Rs1_data;
            Rs2_data_ID_EX <= Rs2_data;
            Imm_out_ID_EX <= Imm_out;

            PC4_EX_MEM <= PC_ID_EX + 4;
            PC_I_EX_MEM <= PC_ID_EX + Imm_out_ID_EX;
            zero_EX_MEM <= zero;
            ALU_res_EX_MEM <= ALU_res;
            inst_EX_MEM <= inst_ID_EX;
            Rs2_data_EX_MEM <= Rs2_data_ID_EX;
            Imm_out_EX_MEM <= Imm_out_ID_EX;

            PC4_MEM_WB <= PC4_EX_MEM;
            Data_in_MEM_WB <= Data_in;
            ALU_res_MEM_WB <= ALU_res_EX_MEM;
            inst_MEM_WB <= inst_EX_MEM;
            Imm_out_MEM_WB <= Imm_out_EX_MEM;
        end
    end

    regs Regs(
        .clk(clk),
        .rst(rst),
        .RegWrite(RegWrite),
        .Rs1_addr(inst_IF_ID[19:15]),
        .Rs2_addr(inst_IF_ID[24:20]),
        .Wt_addr(inst_MEM_WB[11:7]),
        .Wt_data(Data_out_WB),
        .Rs1_data(Rs1_data),
        `RegFile_Regs_Arguments
        .Rs2_data(Rs2_data)
    );

    ImmGen ImmGen(
        .ImmSel(ImmSel),
        .inst_field(inst_IF_ID),
        .Imm_out(Imm_out)
    );

    ALU ALU0(
        .A(Rs1_data_ID_EX),
        .ALU_operation(ALU_Control),
        .B(ALUSrc_B ? Imm_out_ID_EX : Rs2_data_ID_EX),
        .res(ALU_res),
        .zero(zero)
    );
    
endmodule