`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:17 10/07/2015 
// Design Name: 
// Module Name:    Registro_Yk 
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
module Registro_Yk #(parameter N = 25 /* Valor de N*/)(
	input wire signed [N-1:0] In,
	input wire Finish,clk,
	output reg signed [N-1:0] Yk
    );

initial
begin
Yk = 0;
end

	always@(posedge clk)
		begin
			if(Finish)
				Yk <= In;
			else
				Yk  <= Yk;
		end

endmodule
