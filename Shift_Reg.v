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
	input wire signed [2*N-1:0] In,
	input wire shift,clk,
	output wire signed [2*N-1:0] fk,fk_1,fk_2
    );	 

reg [2*N-1:0] fk_old1,fk_old2,fk_ac;

initial
begin
fk_ac = 50'b0;
fk_old1 = 50'b0;
fk_old2 = 50'b0;
end

assign fk = fk_ac;
assign fk_1 = fk_old1;
assign fk_2 = fk_old2;

always@(negedge clk)
begin
if(shift)
begin
fk_ac <= In;
fk_old1 <= fk_ac;	
fk_old2 <= fk_old1;
end
else
begin
fk_ac <= fk_ac;
fk_old1 <= fk_old1;
fk_old2 <= fk_old2;
end
end

endmodule

