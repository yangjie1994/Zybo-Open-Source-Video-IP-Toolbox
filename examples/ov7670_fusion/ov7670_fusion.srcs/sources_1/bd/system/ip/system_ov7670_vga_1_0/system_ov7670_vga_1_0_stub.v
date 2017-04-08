// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Wed Mar 01 09:54:25 2017
// Host        : GILAMONSTER running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top system_ov7670_vga_1_0 -prefix
//               system_ov7670_vga_1_0_ system_ov7670_vga_0_0_stub.v
// Design      : system_ov7670_vga_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ov7670_vga,Vivado 2016.4" *)
module system_ov7670_vga_1_0(pclk, data, rgb)
/* synthesis syn_black_box black_box_pad_pin="pclk,data[7:0],rgb[15:0]" */;
  input pclk;
  input [7:0]data;
  output [15:0]rgb;
endmodule
