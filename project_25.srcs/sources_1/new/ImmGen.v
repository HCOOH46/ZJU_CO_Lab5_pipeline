module ImmGen(
  input [1:0]   ImmSel,
  input [31:0]  inst_field,
  output reg [31:0] Imm_out
);

always @(*) begin
    case (ImmSel)
        2'b01: Imm_out = {{20{inst_field[31]}}, inst_field[31:25], inst_field[11:7]}; //S
        2'b00: Imm_out = {{20{inst_field[31]}}, inst_field[31:20]}; //I
        2'b10: Imm_out = {{19{inst_field[31]}}, inst_field[31], inst_field[7], inst_field[30:25], inst_field[11:8], 1'b0}; //B, always even
        2'b11: Imm_out = {{11{inst_field[31]}}, inst_field[31], inst_field[19:12], inst_field[20], inst_field[30:21], 1'b0}; // J
    endcase
end

//assign Imm_out = ImmSel[1] ? (ImmSel[0] ? {{11{inst_field[31]}}, inst_field[31], inst_field[19:12], inst_field[20], inst_field[30:21], 1'b0} : {{19{inst_field[31]}}, inst_field[31], inst_field[7], inst_field[30:25], inst_field[11:8], 1'b0}) : (ImmSel[0] ? {{20{inst_field[31]}}, inst_field[31:25], inst_field[11:7]} : {{20{inst_field[31]}}, inst_field[31:20]});

endmodule
