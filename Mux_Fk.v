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
module Mux_Fk(
	input wire[1:0] select,
	input wire[24:0] fk,fk_1,fk_2,
	output reg[24:0] Y
    );
	 
   always @(select,fk,fk_1,fk_2)
		begin
				case (select)
					2'b00: Y = fk;
					2'b01: Y = fk_1;
					2'b10: Y = fk_2;
					2'b11: Y = 0;
					default: Y = 0;
				endcase
		end
endmodule
