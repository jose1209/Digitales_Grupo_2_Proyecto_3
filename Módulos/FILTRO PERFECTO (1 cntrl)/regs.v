`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:22 10/01/2015 
// Design Name: 
// Module Name:    regs 
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
module regs#(parameter cant_bits = 25)(
				input wire [cant_bits-1:0] in,
				input wire clk, leer, rst,
				output reg [cant_bits-1:0] out
    );

initial out = 25'b0;

always @ (posedge clk, posedge rst)
	if(rst)
		out <= 0;
	else
		if(leer)
			out <= in;
		else
			out <= out;
			
endmodule
