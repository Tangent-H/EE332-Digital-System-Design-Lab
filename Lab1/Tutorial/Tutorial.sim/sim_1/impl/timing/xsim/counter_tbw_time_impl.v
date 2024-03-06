// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Feb 25 15:15:22 2024
// Host        : Y9000X-TANGENT running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Tangent/SUSTech/大三下/课程资料/DSD/Lab/Lab1/Tutorial/Tutorial.sim/sim_1/impl/timing/xsim/counter_tbw_time_impl.v
// Design      : Counter
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "c30fa0af" *) 
(* NotValidForBitStream *)
module Counter
   (CLOCK,
    RESET,
    DIRECTION,
    COUNT_OUT);
  input CLOCK;
  input RESET;
  input DIRECTION;
  output [3:0]COUNT_OUT;

  wire CLOCK;
  wire CLOCK_IBUF;
  wire CLOCK_IBUF_BUFG;
  wire [3:0]COUNT_OUT;
  wire [3:0]COUNT_OUT_OBUF;
  wire DIRECTION;
  wire DIRECTION_IBUF;
  wire RESET;
  wire RESET_IBUF;
  wire \count_in[0]_i_1_n_0 ;
  wire \count_in[1]_i_1_n_0 ;
  wire \count_in[2]_i_1_n_0 ;
  wire \count_in[3]_i_1_n_0 ;
  wire delay;
  wire eqOp;

initial begin
 $sdf_annotate("counter_tbw_time_impl.sdf",,,,"tool_control");
end
  BUFG CLOCK_IBUF_BUFG_inst
       (.I(CLOCK_IBUF),
        .O(CLOCK_IBUF_BUFG));
  IBUF CLOCK_IBUF_inst
       (.I(CLOCK),
        .O(CLOCK_IBUF));
  OBUF \COUNT_OUT_OBUF[0]_inst 
       (.I(COUNT_OUT_OBUF[0]),
        .O(COUNT_OUT[0]));
  OBUF \COUNT_OUT_OBUF[1]_inst 
       (.I(COUNT_OUT_OBUF[1]),
        .O(COUNT_OUT[1]));
  OBUF \COUNT_OUT_OBUF[2]_inst 
       (.I(COUNT_OUT_OBUF[2]),
        .O(COUNT_OUT[2]));
  OBUF \COUNT_OUT_OBUF[3]_inst 
       (.I(COUNT_OUT_OBUF[3]),
        .O(COUNT_OUT[3]));
  IBUF DIRECTION_IBUF_inst
       (.I(DIRECTION),
        .O(DIRECTION_IBUF));
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count_in[0]_i_1 
       (.I0(COUNT_OUT_OBUF[0]),
        .O(\count_in[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \count_in[1]_i_1 
       (.I0(COUNT_OUT_OBUF[0]),
        .I1(DIRECTION_IBUF),
        .I2(COUNT_OUT_OBUF[1]),
        .O(\count_in[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \count_in[2]_i_1 
       (.I0(COUNT_OUT_OBUF[0]),
        .I1(DIRECTION_IBUF),
        .I2(COUNT_OUT_OBUF[2]),
        .I3(COUNT_OUT_OBUF[1]),
        .O(\count_in[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \count_in[3]_i_1 
       (.I0(DIRECTION_IBUF),
        .I1(COUNT_OUT_OBUF[0]),
        .I2(COUNT_OUT_OBUF[1]),
        .I3(COUNT_OUT_OBUF[3]),
        .I4(COUNT_OUT_OBUF[2]),
        .O(\count_in[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_in_reg[0] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(delay),
        .CLR(RESET_IBUF),
        .D(\count_in[0]_i_1_n_0 ),
        .Q(COUNT_OUT_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_in_reg[1] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(delay),
        .CLR(RESET_IBUF),
        .D(\count_in[1]_i_1_n_0 ),
        .Q(COUNT_OUT_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_in_reg[2] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(delay),
        .CLR(RESET_IBUF),
        .D(\count_in[2]_i_1_n_0 ),
        .Q(COUNT_OUT_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_in_reg[3] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(delay),
        .CLR(RESET_IBUF),
        .D(\count_in[3]_i_1_n_0 ),
        .Q(COUNT_OUT_OBUF[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \delay[0]_inv_i_1 
       (.I0(delay),
        .O(eqOp));
  (* inverted = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \delay_reg[0]_inv 
       (.C(CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(eqOp),
        .PRE(RESET_IBUF),
        .Q(delay));
endmodule
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
