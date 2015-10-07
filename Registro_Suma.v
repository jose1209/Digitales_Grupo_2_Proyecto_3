`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:03 10/06/2015 
// Design Name: 
// Module Name:    Registro_Suma 
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
module Registro_Suma #(parameter N = 25 /* Valor de N*/)(
	input wire [2*N-1:0] Suma,
	input wire Enable,clk,
	output wire [2*N-1:0] Signreg
    );

reg [2*N-1:0] Reg;

initial
begin
Reg = 0;
end

	always@(posedge clk)
		begin
			if(Enable)
				Reg <= Reg;
			else
				Reg <= Suma;
		end
		
assign Signreg = Reg;

endmodule

