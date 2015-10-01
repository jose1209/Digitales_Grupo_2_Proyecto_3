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
module Mux_Ac(
	input wire select,
	input wire[24:0] Uk,Acum,
	output reg[24:0] Y
    );
	 
   always @(select,Uk,Acum)
		begin
				case (select)
					1'b0: Y = Uk;
					1'b1: Y = Acum;
					default: Y = 0;
				endcase
		end
endmodule
