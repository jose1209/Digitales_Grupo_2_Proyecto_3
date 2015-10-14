`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:39 09/30/2015 
// Design Name: 
// Module Name:    operac 
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
module operac#(parameter cant_bits = 25)(
					input wire signed [cant_bits-1:0] in, cte,
					input wire signed [2*cant_bits-2:0] in_acum,
					output reg signed [2*cant_bits-2:0] out
    );

wire [2*cant_bits-2:0] aux;
assign aux = (cte*in)+in_acum;

always @ *
	out = {aux[2*cant_bits-2],aux[2*cant_bits-3:0]};
endmodule
