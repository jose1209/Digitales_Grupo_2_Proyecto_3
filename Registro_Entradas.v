`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:06 10/07/2015 
// Design Name: 
// Module Name:    Registro_Entradas 
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
module Registro_Entradas #(parameter N = 25 /* Valor de N*/)(
	input wire [N-1:0] In,
	input wire Enable,clk,
	output wire [N-1:0] Signreg
    );
	 
	reg [N-1:0] Reg;
	
	initial
	begin
	Reg = 0;
	end
	
	always@(posedge clk)
		begin
			if(In == Reg)
				Reg <= Reg;
			else
				Reg <= In;
		end
		
assign Signreg = Reg;

endmodule
