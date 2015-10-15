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
						//output wire [cant_bits-1:0] out_B, out_M, out_A
    );

wire [cant_bits-1:0] out_B, out_M, out_A, uu, yp_B, yp_M, yp_A, yA, yB, yM, uA, uM, uB;
wire [3:0] sel;

reg cambiar;

cntrl CNTRL (
    .clk(clk), //-------
    .rst(rst), //-----
	 .cambiar(cambiar),
    .leer(leer), 
    .desp(desp),
	 .leer_y(leer_y), 
    .rst_acum(rst_acum),
    .sel(sel)
    );

pasabajas_200 PB_200 (
    .clk(clk), //---------
    .leer(leer), 
    .desp(desp), 
    .leer_y(leer_y), 
    .rst_acum(rst_acum), 
    .sel(sel), 
    .uu(uu), //-----------
    .rx_2(rxB), //-------
    .y(yp_B)	//---------
    );

pasabajas_5k PB_5K (
    .clk(clk), //-----------
    .leer(leer), 
    .desp(desp), 
    .leer_y(leer_y), 
    .rst_acum(rst_acum), 
    .sel(sel), 
    .uu(uu), //-------
    .rx_2(rxM),//--------- 
    .y(yp_M)	//------
    );
	 
pasabajas_20k PB_20K (
    .clk(clk), //-----------
    .leer(leer), 
    .desp(desp), 
    .leer_y(leer_y), 
    .rst_acum(rst_acum), 
    .sel(sel), 
    .uu(uu), //-----------
    .rx_2(rxA), //------
    .y(yp_A)	//------
    );

pasaaltas_20 PA_20 (
    .clk(clk), //-----------
    .leer(leer), 
    .desp(desp), 
    .leer_y(leer_y), 
    .rst_acum(rst_acum), 
    .sel(sel), 
    .uu(uB),//------------ 
    .rx_2(leerB), //----
    .y(yB)//-----------
    );
	 
pasaaltas_200 PA_200 (
    .clk(clk), //--------
   .leer(leer), 
    .desp(desp), 
    .leer_y(leer_y), 
    .rst_acum(rst_acum), 
    .sel(sel), 
    .uu(uM), //--------
    .rx_2(leerM), //--------
    .y(yM)	//-----------
    );

pasaaltas_5k PA_5k (
    .clk(clk), //------
    .leer(leer), 
    .desp(desp), 
    .leer_y(leer_y), 
    .rst_acum(rst_acum), 
    .sel(sel), 
    .uu(uA), //------
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
    .in(u), //------
    .clk(clk), //------
    .leer(rx), //-------
    .rst(1'b0), //--------
    .out(uu)//-----------
    );

regs REGU_B (
    .in(yp_B), //---------
    .clk(clk), //------------
    .leer(rxB), //--------
    .rst(1'b0), //--------
    .out(uB)	//------
    );
	 
regs REGU_M (
    .in(yp_M), //----------
    .clk(clk), //-------
    .leer(rxM), //------
    .rst(1'b0), //----------
    .out(uM)	//---------
    );
	 
regs REGU_A (
    .in(yp_A), //---------
    .clk(clk), //--------
    .leer(rxA), //--------
    .rst(1'b0), //---------
    .out(uA)	//------------
    );

always @ *
	if(u != uu)
		cambiar = 1;
	else
		cambiar = 0;

assign y = out_B + out_M + out_A;

endmodule
