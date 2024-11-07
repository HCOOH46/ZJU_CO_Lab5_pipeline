`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module testbench_tb();

    reg clk;
    reg rst;
    `RegFile_Regs_Declaration
    /* SCPU 中接出 */
    wire [31:0] Addr_out;
    wire [31:0] Data_out ;       
    wire        CPU_MIO;
    wire        MemRW;
    wire [31:0] PC_out;
    /* RAM 接出 */
    wire [31:0] douta;
    /* ROM 接出 */
    wire [31:0] spo;


    wire [31:0] immediate;

    wire [31:0] TEMPCHECK0;


    SCPU u0(
        .clk(clk),
        .rst(rst),
        .Data_in(douta),
        .MIO_ready(CPU_MIO),
        .inst_in(spo),
        .Addr_out(Addr_out),
        .Data_out(Data_out),
        .CPU_MIO(CPU_MIO),
        .MemRW(MemRW),
        `RegFile_Regs_Arguments
        .immediate(immediate),
        .PC_out(PC_out)
        //.TEMPCHECK0(TEMPCHECK0)
        
    );

    RAM_B u1(
        .clk(~clk),
        .we(MemRW),
        .a(Addr_out[11:2]),
        .d(Data_out),
        .spo(douta)
    );

    ROM_BC u2(
        .a(PC_out[11:2]),
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
