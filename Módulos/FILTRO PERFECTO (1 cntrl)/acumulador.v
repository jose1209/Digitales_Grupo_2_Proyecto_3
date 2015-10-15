`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:45 09/30/2015 
// Design Name: 
// Module Name:    acumulador 
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
module acumulador#(parameter cant_bits = 25)(
						input wire rst, clk,
						input wire [2*cant_bits-2:0] in,
						output reg [2*cant_bits-2:0] out
    );
	 
initial out = in;
	 
always @ (posedge clk, posedge rst)
	if(rst)
		out <= 0;
	else
		begin
			out <= in;
		end	
		
endmodule
