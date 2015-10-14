`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:17 10/03/2015 
// Design Name: 
// Module Name:    reg_banda 
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
module reg_banda#(parameter cant_bits = 25)(
						input wire [cant_bits-1:0] in,
						input wire leer, escribir, clk,
						output reg [cant_bits-1:0] out = 0
    );

reg [cant_bits-1:0] dato = 0;

always @ (posedge clk)
	if(leer)
		dato = in;
	else if(escribir)
		out = dato;

endmodule
