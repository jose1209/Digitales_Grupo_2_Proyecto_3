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
	input wire [2*N-1:0] In,
	input wire clk,
	output wire [2*N-1:0] Acumulado,
	output wire Signal
    );

reg [2*N-1:0] Acum;
reg Senal;

always@(posedge clk)
	begin 
		if(In == Acum)
			begin
				Acum <= Acum;
				Senal <= 1'b0;
			end
		else
			begin
				Acum <= In;
				Senal <= 1'b1;
			end
	end

assign Acumulado = Acum;
assign Signal = Senal;

endmodule
