`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:12 09/30/2015 
// Design Name: 
// Module Name:    mux_in 
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
module mux_in#(parameter cant_bits = 25)(
					input wire signed [cant_bits-1:0] u, a, b, c, d, e,
					input wire [3:0] selec,
					output reg signed [cant_bits-1:0] in
    );

always @ *
	case(selec)
		4'b0000:	in = u;
		4'b0001:	in = a;
		4'b0010:	in = b;
		4'b0101:	in = c;
		4'b0110:	in = d;
		4'b0111:	in = e;
		default: in = 	25'b0;
	endcase
endmodule
