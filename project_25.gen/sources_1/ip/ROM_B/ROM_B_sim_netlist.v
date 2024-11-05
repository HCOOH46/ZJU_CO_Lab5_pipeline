// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Nov  4 23:02:55 2024
// Host        : LAPTOP-4SO0BGE2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/code_of_verilog/project_25/project_25.gen/sources_1/ip/ROM_B/ROM_B_sim_netlist.v
// Design      : ROM_B
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROM_B,dist_mem_gen_v8_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_14,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module ROM_B
   (a,
    spo);
  input [9:0]a;
  output [31:0]spo;

  wire [9:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "10" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1024" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "ROM_B.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  ROM_B_dist_mem_gen_v8_0_14 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uwBH4JaTzmENPjp1VK18+NmHqz3idKCCPayqakkK6bYDVk0JtRfycJYNxbcnLmlw5yuLTcDXBBKk
FqBPE2n7wWKg9tfz2Y8PrWAvnbsIFMfxBK8sfWUf8PPnz8vUwwMHjbXUWcgCgvtygj/TbB+jcZ8Z
CjYnBZ8tNdKOO1iDLpQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ff7o4KDFniNgPFT3cDZtw4HhiKzFbOFtLXtuci0MZhgQ8oZ15BcuowAfxUJXngU8JkWI9cbWKkG8
h/PODwnWEt4eK4VDKRk6Hw3QkZiKAa1N3QupC8D5bR7vJ/+RhJwSayz9t2JpdZaEhKgCgqTcX6oZ
4fCEOmSTUWVob+DXV4UfaMyfVm5VI0wxZ7q0mjFx+pdkt56PuNREX9kH4a9Ma1P0sYo8XaTpANLa
JC6eXOuUQlp40M9F/NL1Xajpys0YfGx8AveMAFEyfRmHZs+NbXmny/79vednrm+FhwtS9LveegmF
NZW9jiiR+9Igeraaz+QXPc6JO/nCDTr4Fuwusg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
enb/INzHPP7GNdz8dyyqgVCJiMs9JXcjMywZXhzPersGm0A258UOUwtOqcF1rO7lnrKwTeWbNFVN
dO3BxXBpzGnYWUqDda208CYV9hTWFhfySQdX58qn1Z8QY5G7KniMCVjaGuPPCfToPOOdbAxR9XUp
XbMr0vrZKWxz8nBhGYc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RKZNANfa63/n14iwmSxsB/UeV76BNqjEiYgjlZ2LdFWOArCv6D+jhC4sjGMiaz8GJ8J5kQeiWB0Y
e1+zdHflgzODs6eVC82MlEcfgP0vdDIBn0PP8rVDg5O31eQuJ7n5zn4XJu+vzjpkvJIHKrktAsP4
jg+LRxcTOu0dILImk7Vwgyuwhi8OxNN+jBVbLVxdNj0l5aQMgRZlU/8FVh3u958SH7z/fHnwGaOw
P8QgNv0ZZblWvpxa8TJIwlgVb9354a0eyD9XsKy5VfuUG03nmputxNzUuIUmGtBGCqx+4D4pyCch
j/ixD5iiKRmeKD1/RtGzxmrJap7SAHMuzic1Hw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OQMD0qoDy+4W8+jfTV63GDTwmjWvJILCTofeYJTZqWc2KhrzQXwVMW48dTyIriC6bA4bmXD5BwcB
W2gGbVUvY1Y1+wEFEwYIC0LiPrJO0DhpM1JhP2vkxnTEwaODiEp5x3XqHgsiys0I2/9mE4z4Hlbl
jzftQ/8sVSYokhMp9eaIHk3HNCSBllv90qeBfH3fOdVI2gA1r/22PktttbkyKji24r7jM5o4aMIc
Sp6u0DCnD2cSPCuCuMW3A9sFRuTKbXiLAeeymFIAXHKYQgWXXOqmbKHrk4GviHQyz31C9d+hm6dh
RMtaCyWnhqo3QE/QxP0TsYk3CgkjDCU+KK/ozA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uV1eryjGs1SHbpKIAk5r3BY2SLKX9RlfGw6gbw/UtzBYt4U7vTBIy+x767ojEcmbGLos8kr8vilV
cnNOnsbu7vOAUIe+1PgpaPaCkv2OTPXaE0tfps6+Q6D3zB6j2a2FE1gRIPOniwAdlIn69jL2tuWD
M2BN1efQhi0lZHuKtTgzBOVXIg+zbTiH2k2kHWThOi6WayoBEny+g88wRi6pUBeB6aW3ezFYNmsl
zeOY9xmt+UhRMcr87DCcZdmjsIk6VrsIKF60y93pM0IoQ56iWpQ2OKZK+Ng9qC+pNHBEYEhiMQFb
kUesHtcFOIS7Ok6S9O9SMgf7lMQFOh9w0L31UA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GM2VxmvaiVBg1DsqOLewt6rcWtfH/Gj1QS7fUSMudF5qJ2fn+TXd8kcCwwrxdcXNXjoVi2As5jmL
yw1/NZreemrkS1YCJJDxmnE8CW2q9/4N4a79kApF1VfD5XdpaULhVn+Eb+jXCQFG+GEEOvnPb0Me
bbfRkfc0DAIWgtG2D81EQ28mg7KAWtsDpdUCi+BKdIAj8RXoTiQbFbiBeT7EiRIrz2PQF9nhQBfF
FjlrCNwDP4hRQJQeZcf/1Pl8SFyKGQb6iVF+VhhCVCunL7VBmzaCOW/gowPM7hRM2dvzmxcgeKfs
dZx/fy2rk1iokUi+3B+Jc6CycMWbHu8EfCh7iQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
NSZoNMCco4gpYPcg8pb9mtee1JxEWDcDzt6wnS0LeSPMi2upLvQXnSQKMvJGGOKStJOcu1eu7x33
4Xa3ApbjbfZ+lgs1PYlyY4V+B2Lio1EEo1uzZVWFrVFvmknOZwj6Gcmj5N/osaiqKaeIw7NTTbyX
HNHOabVsQJ540qnP4u/nzS/h/AQcm0PFLadGZtHJZEzyQDSSdghD/y/OLprdBcInfQDwAxQuJpCy
ExX4lD2WMrCkymNBS9NMH0vYh4kvpYKRO/oHuGcOZVg0p8vfMmz/BJDHuxTcS3FpLT0WxGVcmUIk
cuqKQFiVwwgnW9AfYkbsMrwfl9po2pofaAY2JC5ZTMyO1qEfSu4fxTRJNnDRvW65KkMdJhZFa36p
82hcDlaYvBowndZfMc42Sxt+ZULFDTFN0HT50iteAG1yEvJ9jKBiJla+kDQJB0VD0kj4+k8aBug3
uPKVykvf1/Uaw8NoW591pML42qlh8v1RzAm6aDnPRdsDaCc5Dq9QDPuE

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oRNld8VrAuP/xHUguZzkh8+wROOItnvw1FQUP5KHjxeh8nudEYH2PGefTPsV73QyEruJanGifjCR
m8XHiIxqAY9fk4CAm+2n67YLFUEHjC1Qri9htrL4W5fnj7OIdzcwttvmGEuGOuYOFA98RcnR0jSL
Nyqq5u/eILCh2MiKiELfsBjRv/WckpboJ+gzO1btduECvdBGjsIcjjHiIzPwNSGxnX3G6zG9OiWq
hXP2Jh0Ril7rGbajit90p+gJpDpuLee/aOh0BUXbYYLU0YIXK8bskgMir7D6cfu5oWDKwYH6/YRR
tFjIhRzFsqwjtmaxUnGTZzxsWGazk+uFfHXl7w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11792)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
