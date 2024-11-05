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
    output [31:0] immediate
    // 寄存器组值的读出
    );

    wire [1:0] ImmSel;
    wire [1:0] MemtoReg;
    wire [2:0] ALU_Control;
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
        .RegWrite(RegWrite),
        .Data_in(Data_in),
        .ALU_Control(ALU_Control),
        .ImmSel(ImmSel),
        .ALU_out(Addr_out),
        .Data_out(Data_out),
        `RegFile_Regs_Arguments
        .immediate(immediate),
        .PC_out(PC_out)
    );
endmodule
