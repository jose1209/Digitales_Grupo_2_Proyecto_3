`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:01 10/13/2015 
// Design Name: 
// Module Name:    filtrado 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module filtrado#(parameter cant_bits = 25)(
						input wire rx, clk, sw_B, sw_M, sw_A, rst,
						input wire [cant_bits-1:0] u,
						output wire [cant_bits-1:0] y
    );

wire [cant_bits-1:0] out_B, out_M, out_A, uu;
wire [cant_bits-1:0] yp_B, yp_M, yp_A, yA, yB, yM;

reg cambiar;

pasabajas_200 PB_200 (
    .clk(clk), //---------
    .rst(rst), //--------
    .cambiar(cambiar), //---------
    .uu(uu), //-----------
    .rx_2(rxB), //-------
    .y(yp_B)	//---------
    );

pasabajas_5k PB_5K (
    .clk(clk), //-----------
    .rst(rst), //-----------
    .cambiar(cambiar), //----------
    .uu(uu), //-------
    .rx_2(rxM),//--------- 
    .y(yp_M)	//------
    );
	 
pasabajas_20k PB_20K (
    .clk(clk), //-----------
    .rst(rst), //-----------
    .cambiar(cambiar), //----------
    .uu(uu), //-----------
    .rx_2(rxA), //------
    .y(yp_A)	//------
    );

pasaaltas_20 PA_20 (
    .clk(clk), //-----------
    .rst(rst), //--------
    .rx(rxB), //------
    .u(yp_B),//------------ 
    .rx_2(leerB), //----
    .y(yB)//-----------
    );
	 
pasaaltas_200 PA_200 (
    .clk(clk), //--------
    .rst(rst), //---------
    .rx(rxM), //-------
    .u(yp_M), //--------
    .rx_2(leerM), //--------
    .y(yM)	//-----------
    );

pasaaltas_5k PA_5k (
    .clk(clk), //------
    .rst(rst), //--------
    .rx(rxA), //-----
    .u(yp_A), //------
    .rx_2(leerA), //-------
    .y(yA)//-----------
    );

reg_banda REG_BAJA (
    .in(yB), //---------
    .leer(leerB), //---------
    .escribir(sw_B), //--------
    .clk(clk), //----------
    .out(out_B)//--------------
    );
	 
reg_banda REG_MEDIA (
    .in(yM), 	//----------
    .leer(leerM), //----------
    .escribir(sw_M), //--------
    .clk(clk), //-----------
    .out(out_M)//--------
    );
	 
reg_banda REG_ALTA (
    .in(yA), //------------
    .leer(leerA), //---------
    .escribir(sw_A), //-----------
    .clk(clk), //--------------
    .out(out_A)//-------
    );
	 
regs REG_U (
    .in(u), 
    .clk(clk), 
    .leer(rx), 
    .rst(1'b0), 
    .out(uu)
    );
	 
always @ *
	if(u != uu)
		cambiar = 1;
	else
		cambiar = 0;

assign y = out_B + out_M + out_A;

endmodule
