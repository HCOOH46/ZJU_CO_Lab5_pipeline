`include "D:\\code_of_verilog\\project_25\\project_25.srcs\\sources_1\\imports\\Downloads\\Lab4_header.vh"
module ImmGen(
  input [2:0]   ImmSel,
  input [31:0]  inst_field,
  output reg [31:0] Imm_out
);

always @(*) begin
    case (ImmSel)
        `IMM_SEL_S: Imm_out = {{20{inst_field[31]}}, inst_field[31:25], inst_field[11:7]}; //S
        `IMM_SEL_I: Imm_out = {{20{inst_field[31]}}, inst_field[31:20]}; //I
        `IMM_SEL_B: Imm_out = {{19{inst_field[31]}}, inst_field[31], inst_field[7], inst_field[30:25], inst_field[11:8], 1'b0}; //B, always even
        `IMM_SEL_J: Imm_out = {{11{inst_field[31]}}, inst_field[31], inst_field[19:12], inst_field[20], inst_field[30:21], 1'b0}; // J
        `IMM_SEL_U: Imm_out = {inst_field[31:12], 12'b0}; // U
    endcase
end

//assign Imm_out = ImmSel[1] ? (ImmSel[0] ? {{11{inst_field[31]}}, inst_field[31], inst_field[19:12], inst_field[20], inst_field[30:21], 1'b0} : {{19{inst_field[31]}}, inst_field[31], inst_field[7], inst_field[30:25], inst_field[11:8], 1'b0}) : (ImmSel[0] ? {{20{inst_field[31]}}, inst_field[31:25], inst_field[11:7]} : {{20{inst_field[31]}}, inst_field[31:20]});

endmodule
