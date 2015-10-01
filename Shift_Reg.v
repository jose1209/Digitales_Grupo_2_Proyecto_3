`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:37:46 09/30/2015 
// Design Name: 
// Module Name:    Shift_Reg 
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
module Shift_Reg #(parameter N = 25)(
	input wire[2*N-1:0] In,
	input wire shift,
	output wire[2*N-1:0] fk,fk_1,fk_2
    );	 

reg [2*N-1:0] fk_old1,fk_old2,fk_ac;

always@(posedge shift)
begin
fk_old1 = fk;
fk_old2 = fk_1;
fk_ac = In;	
end

assign fk = fk_ac;
assign fk_1 = fk_old1;
assign fk_2 = fk_old2;

endmodule

