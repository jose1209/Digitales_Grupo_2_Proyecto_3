`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jose Gabriel Carmona Rodriguez
// 
// Create Date:    15:47:43 09/22/2015 
// Design Name: 
// Module Name:    Sumador 
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
module Sumador #(parameter N = 24 /* Valor de N*/)(
	input wire [2*N-1:0] Sum_ext,Multiplica,
   output reg [2*N-1:0] Suma_G);

always@*
begin

Suma_G = (Multiplica + Sum_ext);

end

endmodule
