`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:06 09/26/2015 
// Design Name: 
// Module Name:    redondeo 
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
module redondeo#(parameter cant_bits = 25, ent = 10, frac = 14)(
					input wire signed [2*ent+2*frac:0] in,
					output reg signed [cant_bits-1:0] out
    );

initial out = 0;

localparam [cant_bits-2:0]	ceros = 0,
									unos = ~ceros;
									
wire [2*ent+2*frac:0] aux;
assign aux = in;
	 
always @ *
	begin
		if(aux[2*ent+2*frac]==0 & aux[2*cant_bits-3:2*frac+ent]>0)			//overflow
			out = {1'b0,unos};
		else if(aux[2*ent+2*frac]==1 & (&aux[2*ent+2*frac-1:(2*frac+ent)])==0)		//overflow negativo	
			out = {1'b1,ceros};			
		else
			out = {aux[2*ent+2*frac],aux[2*frac+ent-1:frac]};
	end
endmodule
