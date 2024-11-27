`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module SCPU(
    input clk,
    input rst,
    input [31:0] inst_in,
    input [31:0] Data_in,
    input MIO_ready,
    output [31:0] Addr_out,
    output [31:0] Data_out,
    output [31:0] PC_out,
    output MemRW,
    `RegFile_Regs_Outputs
    output CPU_MIO,
    output [31:0] immediate,
    output [31:0] TEMPCHECK0
    // 寄存器组值的读出
    );

    reg ALUSrc_B_ID_EX;
    reg [3:0] MemtoReg_ID_EX;
    reg [1:0] Jump_ID_EX;
    reg Branch_ID_EX;
    reg BranchN_ID_EX;
    reg RegWrite_ID_EX;
    reg MemRW_ID_EX;
    reg [3:0] ALU_Control_ID_EX;

    reg Branch_EX_MEM;
    reg BranchN_EX_MEM;
    reg RegWrite_EX_MEM;
    reg MemRW_EX_MEM;
    reg [3:0] ALU_Control_EX_MEM;
    reg [1:0] Jump_EX_MEM;

    reg [1:0] MemtoReg_MEM_WB;
    reg RegWrite_MEM_WB;

    wire [1:0] Jump;
    wire [2:0] ImmSel;
    wire [1:0] MemtoReg;
    wire [3:0] ALU_Control;
    SCPU_ctrl ctrl(
        .OPcode(inst_in[6:2]),
        .Fun3(inst_in[14:12]),
        .Fun7(inst_in[30]),
        .MIO_ready(MIO_ready),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .Branch(Branch),
        .BranchN(BranchN),
        .RegWrite(RegWrite),
        .MemRW(MemRW),
        .ALU_Control(ALU_Control),
        .CPU_MIO(CPU_MIO)
    );

    Data_path dp(
        .clk(clk),
        .rst(rst),
        .inst_field(inst_in[31:0]), //这里实际上只需要 inst_in[31:7]，但是为了保持一致性，还是传入了整个 inst_in,
        .ALUSrc_B(ALUSrc_B),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .Branch(Branch),
        .BranchN(BranchN),
        .RegWrite(RegWrite),
        .Data_in(Data_in),
        .ALU_Control(ALU_Control),
        .ImmSel(ImmSel),
        .ALU_out(Addr_out),
        .Data_out(Data_out),
        `RegFile_Regs_Arguments
        .immediate(immediate),
        .PC_out(PC_out),
        .TEMPCHECK0(TEMPCHECK0)
    );
endmodule
