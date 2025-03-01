`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"

module SCPU(
    input clk,
    input rst,
    input [31:0] inst_in, //这个inst是ID, 不是IF
    input [31:0] Data_in, //这个是ID, 不是IF
    input MIO_ready,
    output [31:0] Addr_out,
    output [31:0] Data_out,
    output [31:0] Data_out_WB,
    output [31:0] PC_out_EX,
    output [31:0] PC_out_ID,
    output [31:0] PC_out_IF,
    output MemRW_Mem,
    output MemRW_EX,
    `RegFile_Regs_Outputs
    output CPU_MIO,
    output [31:0] immediate,
    output [31:0] inst_ID,
    output [31:0] TEMPCHECK0
    // 寄存器组值的读出
    );

    // IF/ID
    reg [31:0] inst_IF_ID;

    // ID/EX
    reg [31:0] inst_ID_EX;
    reg ALUSrc_B_ID_EX;
    reg [1:0] MemtoReg_ID_EX;
    reg [1:0] Jump_ID_EX;
    reg Branch_ID_EX;
    reg BranchN_ID_EX;
    reg RegWrite_ID_EX;
    reg MemRW_ID_EX;
    reg [3:0] ALU_Control_ID_EX;

    // EX/MEM
    reg [31:0] inst_EX_MEM;
    reg Branch_EX_MEM;
    reg BranchN_EX_MEM;
    reg RegWrite_EX_MEM;
    reg MemRW_EX_MEM;
    reg [1:0] MemtoReg_EX_MEM;
    reg [1:0] Jump_EX_MEM;

    // MEM/WB
    reg [1:0] MemtoReg_MEM_WB;
    reg RegWrite_MEM_WB;

    // MemRW特殊处理
    assign MemRW_Mem = MemRW_EX_MEM;
    assign MemRW_EX = MemRW_ID_EX;

    wire [1:0] Jump;
    wire [2:0] ImmSel;
    wire [1:0] MemtoReg;
    wire [3:0] ALU_Control;
    SCPU_ctrl ctrl(
        .OPcode(inst_IF_ID[6:2]),
        .Fun3(inst_IF_ID[14:12]),
        .Fun7(inst_IF_ID[30]),
        .MIO_ready(MIO_ready),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .Branch(Branch),
        .BranchN(BranchN),
        .RegWrite(RegWrite),
        .MemRW(MemRW_0),
        .ALU_Control(ALU_Control),
        .CPU_MIO(CPU_MIO)
    );

    wire lock_IF = (inst_IF_ID[6:2] == 5'b11011) 
    || (inst_IF_ID[6:2] == 5'b11000)
    || (inst_ID_EX[6:2] == 5'b11011)
    || (inst_ID_EX[6:2] == 5'b11000)// jal, B
    || ((inst_in[6:2] != 5'b11011) && (inst_IF_ID[6:2] != 01000) && (inst_IF_ID[6:2] != 11000) // J | S B
    && (inst_in[19:15] == inst_IF_ID[11:7]) && (inst_in[19:15] != 5'b0) && (inst_IF_ID[11:7] != 5'b0)) 
    || ((inst_in[6:2] != 5'b11011) && (inst_IF_ID[6:2] != 01000) && (inst_IF_ID[6:2] != 11000) // J | S B
    && (inst_in[19:15] == inst_ID_EX[11:7]) && (inst_in[19:15] != 5'b0) && (inst_ID_EX[11:7] != 5'b0)) 
    || ((inst_in[6:2] != 5'b11011) && (inst_in[6:2] != 5'b00100) && (inst_in[6:2] != 5'b00000) && (inst_IF_ID[6:2] != 01000) && (inst_IF_ID[6:2] != 11000) // J I | S B
    && (inst_in[24:20] == inst_IF_ID[11:7]) && (inst_in[24:20] != 5'b0) && (inst_IF_ID[11:7] != 5'b0)) 
    || ((inst_in[6:2] != 5'b11011) && (inst_in[6:2] != 5'b00100) && (inst_in[6:2] != 5'b00000) && (inst_IF_ID[6:2] != 01000) && (inst_IF_ID[6:2] != 11000) // J I | S B
    && (inst_in[24:20] == inst_ID_EX[11:7]) && (inst_in[24:20] != 5'b0) && (inst_ID_EX[11:7] != 5'b0)); // data hazard

    wire lock_IF_ID = (inst_EX_MEM[6:2] == 5'b11011) || (inst_EX_MEM[6:2] == 5'b11000); // jal, B, not lock PC

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //IF/ID
            inst_IF_ID <= 32'b0;
            // ID/EX
            inst_ID_EX <= 32'b0;
            ALUSrc_B_ID_EX <= 1'b0;
            MemtoReg_ID_EX <= 2'b0;
            Jump_ID_EX <= 2'b00;
            Branch_ID_EX <= 1'b0;
            BranchN_ID_EX <= 1'b0;
            RegWrite_ID_EX <= 1'b0;
            MemRW_ID_EX <= 1'b0;
            ALU_Control_ID_EX <= 4'b0;
            // EX/MEM
            inst_EX_MEM <= 32'b0;
            Branch_EX_MEM <= 1'b0;
            BranchN_EX_MEM <= 1'b0;
            RegWrite_EX_MEM <= 1'b0;
            MemRW_EX_MEM <= 1'b0;
            MemtoReg_EX_MEM <= 4'b0;
            Jump_EX_MEM <= 2'b00;
            // MEM/WB
            MemtoReg_MEM_WB <= 2'b0;
            RegWrite_MEM_WB <= 1'b0;
        end else begin
            //IF/ID
            inst_IF_ID <= (lock_IF || lock_IF_ID) ? 32'h00000033 : inst_in; // nop
            // ID/EX
            inst_ID_EX <= inst_IF_ID;
            ALUSrc_B_ID_EX <= ALUSrc_B;
            MemtoReg_ID_EX <= MemtoReg;
            Jump_ID_EX <= Jump;
            Branch_ID_EX <= Branch;
            BranchN_ID_EX <= BranchN;
            RegWrite_ID_EX <= RegWrite;
            MemRW_ID_EX <= MemRW_0;
            ALU_Control_ID_EX <= ALU_Control;
            // EX/MEM
            inst_EX_MEM <= inst_ID_EX;
            Branch_EX_MEM <= Branch_ID_EX;
            BranchN_EX_MEM <= BranchN_ID_EX;
            RegWrite_EX_MEM <= RegWrite_ID_EX;
            MemRW_EX_MEM <= MemRW_ID_EX;
            MemtoReg_EX_MEM <= MemtoReg_ID_EX;
            Jump_EX_MEM <= Jump_ID_EX;
            // MEM/WB
            MemtoReg_MEM_WB <= MemtoReg_EX_MEM;
            RegWrite_MEM_WB <= RegWrite_EX_MEM;
        end
    end

    Data_path dp(
        .clk(clk),
        .rst(rst),
        .lock_IF(lock_IF),
        .lock_IF_ID(lock_IF_ID),
        .inst(inst_in[31:0]), //这里实际上只需要 inst_in[31:7]，但是为了保持一致性，还是传入了整个 inst_in,
        .ALUSrc_B(ALUSrc_B_ID_EX),
        .MemtoReg(MemtoReg_MEM_WB),
        .Jump(Jump_EX_MEM),
        .Branch(Branch_EX_MEM),
        .BranchN(BranchN_EX_MEM),
        .RegWrite(RegWrite_MEM_WB),
        .Data_in(Data_in),
        .ALU_Control(ALU_Control_ID_EX),
        .ImmSel(ImmSel),
        .ALU_out(Addr_out),
        .Data_out_WB(Data_out_WB),
        .Data_out(Data_out),
        `RegFile_Regs_Arguments
        .immediate(immediate),
        .PC_out_EX(PC_out_EX),
        .PC_out_ID(PC_out_ID),
        .PC_out_IF(PC_out_IF),
        .inst_ID(inst_ID),
        .TEMPCHECK0(TEMPCHECK0)
    );
endmodule
