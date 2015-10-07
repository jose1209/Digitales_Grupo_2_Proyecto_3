`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:43 09/30/2015 
// Design Name: 
// Module Name:    Mux_Constantes 
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
module Mux_Constantes(
	input wire[2:0] selector,
	output reg[24:0] Constantes
    );

always@*
	begin
		Constantes = 0;
			case (selector)
				3'b000:
					Constantes = 25'b0000000000100000000000000; //1
				3'b001:
					Constantes = 25'b1111111111000001010001111; //-1.96
				3'b010:
					Constantes = 25'b0000000000011110101111001; //0.9605
				3'b011:	
					Constantes = 25'b0000000000000000000000011; //0.000199
				3'b100:
					Constantes = 25'b0000000000000000000000111; //0.0003979
				3'b101:
					Constantes = 25'b0000000000000000000000011; //0.000199
				default:
					Constantes = 0;
				endcase
	end
endmodule
