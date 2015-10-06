`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:08:20 10/01/2015
// Design Name:   ControlMux
// Module Name:   C:/Lab Digitales/TercerProyecto/TB_Control_Mux.v
// Project Name:  TercerProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlMux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Control_Mux;

	// Inputs
	//reg clk;
	reg Bandera;

	// Outputs
	wire [2:0] sel_const;
	wire [1:0] sel_fun;
	wire sel_acum;
	wire Band_Listo;

	// Instantiate the Unit Under Test (UUT)
	ControlMux uut (
		//.clk(clk), 
		.Bandera(Bandera), 
		.sel_const(sel_const), 
		.sel_fun(sel_fun), 
		.sel_acum(sel_acum), 
		.Band_Listo(Band_Listo)
	);

/*	localparam T = 5;
	always
		begin
			clk = 1'b1;
			#(T/2) ;
			clk = 1'b0;
			#(T/2) ;
		end*/
		
localparam H = 5;
	always
		begin
			Bandera = 1'b1;
			#(H/5) ;
			Bandera = 1'b0;
			#(H/1.25) ;
		end

      
endmodule

