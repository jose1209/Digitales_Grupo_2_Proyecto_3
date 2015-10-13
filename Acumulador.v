`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:09:22 10/01/2015 
// Design Name: 
// Module Name:    Acumulador 
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
module Acumulador #(parameter N = 25 /* Valor de N*/)(
	input wire signed [2*N-1:0] In,
	input wire clk,Bandera,
	output reg signed [2*N-1:0] Acumulado

    );

reg [2*N-1:0] Acum;

initial
begin
Acumulado = 0;
end

	always@(negedge clk)
		begin
			if(Bandera)
				Acumulado  <= Acumulado;
			else
				Acumulado <= In;
		end




endmodule
