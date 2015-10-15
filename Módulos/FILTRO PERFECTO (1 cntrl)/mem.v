`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:31 10/06/2015 
// Design Name: 
// Module Name:    mem 
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
module mem#(parameter cant_bits = 25)(
					input wire [cant_bits-1:0] in,
					input wire leer, desp, clk,
					output reg [cant_bits-1:0] out_f, out_f1, out_f2
    );

reg [cant_bits-1:0] fss [0:2];

initial
	begin
		fss[0] = 25'b0;
		fss[1] = 25'b0;
		fss[2] = 25'b0;
		out_f = 25'b0;
		out_f1 = 25'b0;
		out_f2 = 25'b0;
	end

always @ (posedge clk)
	if(leer)
		fss[0] = in;
	else
		fss[0] = fss[0];

always @ (posedge clk)
	if(desp)
		begin
			fss[2] = fss[1];
			fss[1] = fss[0];
		end
	else
		begin
			fss[2] = fss[2];
			fss[1] = fss[1];
		end
			
always @ *
	begin
		out_f = fss[0]; 
		out_f1 = fss[1]; 
		out_f2 = fss[2];
	end
endmodule
