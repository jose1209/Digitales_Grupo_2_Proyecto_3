`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:07 10/13/2015 
// Design Name: 
// Module Name:    ctes_20k 
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
module ctes_20k#(parameter cant_bits = 25)(
					input wire [3:0] sel_cte,
					output reg [cant_bits-1:0] cte
    );

always @ *
		case(sel_cte)
			4'b0000:	cte = 25'h4000;
			4'b0001:	cte = 25'h1FF9A2D;
			4'b0010:	cte = 25'h1FFD5A7;
			4'b0101:	cte = 25'h340B;
			4'b0110:	cte = 25'h6810;
			4'b0111:	cte = 25'h340B;
			default: cte = 25'h0;
		endcase
endmodule