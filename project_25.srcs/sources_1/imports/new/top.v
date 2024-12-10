`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/25 17:04:46
// Design Name: 
// Module Name: top
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


module top(
    input clk_100mhz,
    input RSTN,
    input [3:0] BTN_y,
    input [15:0] SW,
    output HSYNC,
    output VSYNC,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue,
    output [15:0] LED_out,
    output [7:0] AN,
    output [7:0] segment
    );

    wire [15:0] sw_ok;
    wire [3:0] btn_ok;
    wire rst;

    SAnti_jitter U9(
        .clk(clk_100mhz),
        .RSTN(RSTN),
        .Key_y(BTN_y),
        .SW(SW),
        .BTN_OK(btn_ok),
        .SW_OK(sw_ok),
        .rst(rst)
    );

    wire[31:0] clk_div;
    wire Clk_CPU;

    clk_div U8(
        .clk(clk_100mhz),
        .rst(rst),
        .SW2(sw_ok[2:2]), //wtf?
        .SW8(sw_ok[8:8]),
        .STEP(sw_ok[10:10]),
        .clkdiv(clk_div),
        .Clk_CPU(Clk_CPU)
    );

    wire counter_we;
    wire [31:0] Peripheral_in;
    wire [1:0] counter_set;
    wire counter0_out;
    wire counter1_out;
    wire counter2_out;
    wire [31:0] counter_out;
    Counter_x U10(
        .clk(~Clk_CPU),
        .rst(rst),
        .clk0(clk_div[6]),
        .clk1(clk_div[9]),
        .clk2(clk_div[11]),
        .counter_we(counter_we),
        .counter_val(Peripheral_in),
        .counter_ch(counter_set),
        .counter0_OUT(counter0_out),
        .counter1_OUT(counter1_out),
        .counter2_OUT(counter2_out),
        .counter_out(counter_out)
    );

    wire data_ram_we;
    wire [31:0] ram_data_in;
    wire [9:0] ram_addr;
    wire [31:0] ram_out;
    RAM_B U3(
        .clk(~clk_100mhz),
        .we(data_ram_we),
        .a(ram_addr),
        .d(ram_data_in),
        .spo(ram_out)
    );

    wire [31:0] Cpu_data4bus;
    wire [31:0] PC_out;
    wire [31:0] inst;
    wire [31:0] Cpu_data2bus;
    wire [31:0] Addr_out;
    wire MemRW;
    SCPU U1(
        .clk(Clk_CPU),
        .rst(rst),
        .Data_in(Cpu_data4bus),
        .inst_in(inst),
        .MemRW_Mem(MemRW),
        .Addr_out(Addr_out),
        .Data_out(Cpu_data2bus),
        .PC_out_IF(PC_out)
    );

    ROM_HH U2(
        .a(PC_out[11:2]),
        .spo(inst)
    );

    // wire [15:0] LED_out;
    wire EN7;
    wire EN5;
    MIO_BUS U4(
        .clk(clk_100mhz),
        .rst(rst),
        .BTN(btn_ok),
        .SW(sw_ok),
        .mem_w(MemRW),
        .Cpu_data2bus(Cpu_data2bus),
        .addr_bus(Addr_out),
        .ram_data_out(ram_out),
        .led_out(LED_out),
        .counter_out(counter_out),
        .counter0_out(counter0_out),
        .counter1_out(counter1_out),
        .counter2_out(counter2_out),
        .Cpu_data4bus(Cpu_data4bus),
        .ram_data_in(ram_data_in),
        .ram_addr(ram_addr),
        .data_ram_we(data_ram_we),
        .GPIOf0000000_we(EN7),
        .GPIOe0000000_we(EN5),
        .counter_we(counter_we),
        .Peripheral_in(Peripheral_in)
    );

    wire [7:0] point;
    wire [31:0] disp_num;
    wire [7:0] les;
    Multi_8CH32 U5(
        .clk( ~clk_cpu),
        .rst(rst),
        .EN(EN5),
        .Test(sw_ok[7:5]),
        .point_in({clk_div[31:0],clk_div[31:0]}),
        .LES(64'b0),
        .Data0(Peripheral_in),
        .data1({2'b0,PC_out[31:2]}),
        .data2(inst),
        .data3(counter_out),
        .data4(Addr_out),
        .data5(Cpu_data2bus),
        .data6(Cpu_data4bus),
        .data7(PC_out),
        .Disp_num(disp_num),
        .point_out(point),
        .LE_out(les)
    );

    Seg7_Dev_0 U6(
        .disp_num(disp_num),
        .point(point),
        .les(les),
        .scan({clk_div[18],clk_div[17],clk_div[16]}),
        .AN(AN),
        .segment(segment)
    );

    SPIO U7(
        .clk(~clk_cpu),
        .rst(rst),
        .Start(clk_div[20]),
        .EN(EN7),
        .P_Data(Peripheral_in),
        .counter_set(counter_set),
        .LED_out(LED_out)
    );

    VGA U11(
        .clk_25m(clk_div[1]),
        .clk_100m(clk_100mhz),
        .rst(rst),
        .pc(PC_out),
        .inst(inst),
        .alu_res(Addr_out),
        .mem_wen(MemRW),
        .dmem_o_data(ram_out),
        .dmem_i_data(ram_data_in),
        .dmem_addr(Addr_out),
        .hs(HSYNC), // horizontal
        .vs(VSYNC), // vertical
        .vga_r(Red),
        .vga_g(Green),
        .vga_b(Blue)
    );

endmodule
