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
module Mux_Ac #(parameter N = 25 /* Valor de N*/)(
	input wire [1:0] select,
	input wire[N-1:0] Uk,Acum,
	output reg[N-1:0] Y
    );
	 
   always @(select,Uk,Acum)
		begin
				case (select)
					2'b00: Y = Uk;
					2'b01: Y = Acum;
					2'b10: Y = 0;
					default: Y = 0;
				endcase
		end
endmodule
