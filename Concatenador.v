`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jose Gabriel Carmona Rodriguez
// 
// Create Date:    15:45:40 09/22/2015 
// Design Name: 
// Module Name:    Concatenador 
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
module Concatenador#(parameter N = 25 /* Valor de N*/)(
	input wire [N-1:0] ValorSuma,
	output wire [2*N-1:0] Suma_ext
    );

assign Suma_ext = $signed(ValorSuma);
 

endmodule
