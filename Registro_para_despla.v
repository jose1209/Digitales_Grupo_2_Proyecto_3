`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:27 10/12/2015 
// Design Name: 
// Module Name:    Registro_para_despla 
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
module Registro_para_despla #(parameter N = 25)(
	input wire signed [2*N-1:0] In,
	output reg signed [2*N-1:0] fk,
	input clk,bandera
    );

initial
begin
fk = 0;
end

	always@(negedge clk)
		begin
			if(bandera)
				fk <= In;
			else
				fk  <= fk;
		end

endmodule
