`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:53 09/30/2015 
// Design Name: 
// Module Name:    Mux_Ac 
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
module Mux_Fk  #(parameter N = 25 /* Valor de N*/)(
	input wire[1:0] select,
	input wire signed[N-1:0] fk,fk_1,fk_2,Uk,
	output reg signed[N-1:0] Y
    );
	 
   always @(select,fk,fk_1,fk_2,Uk)
		begin
				case (select)
					2'b00: Y = Uk;
					2'b01: Y = fk;
					2'b10: Y = fk_1;
					2'b11: Y = fk_2;
					default: Y = 0;
				endcase
		end
endmodule
