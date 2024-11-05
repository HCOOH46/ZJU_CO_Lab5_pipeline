// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Nov  4 23:02:55 2024
// Host        : LAPTOP-4SO0BGE2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ROM_B_sim_netlist.v
// Design      : ROM_B
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROM_B,dist_mem_gen_v8_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_14,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11856)
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
