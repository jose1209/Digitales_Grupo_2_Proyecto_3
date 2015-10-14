`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:51 10/06/2015 
// Design Name: 
// Module Name:    pasabajas_20k 
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
module pasabajas_200 #(parameter cant_bits = 25)(
							input wire clk, rst, rx,
							input wire [cant_bits-1:0] u,
							output wire [cant_bits-1:0] y
    );

wire [cant_bits-1:0] f, f1, f2, in, cte, uu, out_trunc;
wire [2*cant_bits-2:0] in_acum, recurs;
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

mux_ctes MUX_CTES (
    .sel_cte(sel), 
    .cte(cte)
    );
	 
mem MEM (
    .in(out_trunc), //---------
    .leer(leer), //------
    .desp(desp), //--------
    .clk(clk), //--------
    .out_f(f), //----
    .out_f1(f1), 	//----
    .out_f2(f2)	//-----
    );
	 
mux_in MUX_ENT (
    .u(uu), 	//---------
    .a(f1),	//----
    .b(f2), //----
    .c(f), //-----
    .d(f1),//------
    .e(f2),//-------
    .selec(sel), //-------
    .in(in)	//------
    );
	 
operac CALCU (
    .in(in), 	//-------
    .cte(cte), //-------	
    .in_acum(recurs), //--------
    .out(in_acum)	//-----
    );
	 
redondeo REDOND (
    .in(recurs), 	//---------
    .out(out_trunc)	//------**********
    );
	 
acumulador ACUM (
    .rst(rst_acum), //------
    .clk(clk), //----
    .in(in_acum), //-------
    .out(recurs)
    );
	 	 
regs REG_Y (
    .in(out_trunc), 		//--------
    .clk(clk), 	//----------
    .leer(leer_y),//-------
    .rst(1'b0),	//--------
    .out(y)		//-----------
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
	 
endmodule
