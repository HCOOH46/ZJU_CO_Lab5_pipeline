`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module testbench_tb();

    reg clk;
    reg rst;
    `RegFile_Regs_Declaration
    /* SCPU 中接出 */
    wire [31:0] Addr_out;
    wire [31:0] Data_out;
    wire [31:0] Data_out_WB;
    wire [31:0] PC_out_EX;
    wire [31:0] PC_out_ID;
    wire [31:0] PC_out_IF;
    wire        MemRW_Mem;
    wire        MemRW_EX;
    wire        CPU_MIO;
    wire [31:0] immediate;
    wire [31:0] inst_ID;
    wire [31:0] TEMPCHECK0;
    /* RAM 接出 */
    wire [31:0] douta;
    /* ROM 接出 */
    wire [31:0] spo;

    SCPU u0(
        .clk(clk),
        .rst(rst),
        .inst_in(spo),
        .Data_in(douta),
        .MIO_ready(CPU_MIO),
        .Addr_out(Addr_out),
        .Data_out(Data_out),
        .Data_out_WB(Data_out_WB),
        .PC_out_EX(PC_out_EX),
        .PC_out_ID(PC_out_ID),
        .PC_out_IF(PC_out_IF),
        .MemRW_Mem(MemRW_Mem),
        .MemRW_EX(MemRW_EX),
        `RegFile_Regs_Arguments
        .CPU_MIO(CPU_MIO),
        .immediate(immediate),
        .inst_ID(inst_ID),
        .TEMPCHECK0(TEMPCHECK0)
    );

    RAM_B u1(
        .clk(~clk),
        .we(MemRW_Mem),
        .a(Addr_out[11:2]),
        .d(Data_out),
        .spo(douta)
    );

    ROM_H u2(
        .a(PC_out_IF[11:2]),
        .spo(spo)
    );

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #5;
        rst = 1'b0;
    end

    always #10 clk = ~clk;

endmodule