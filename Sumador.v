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
module Sumador #(parameter N = 25 /* Valor de N*/)(
	input wire signed [2*N-1:0] Sum_ext,
	input wire signed [N-1:0] Multiplicandos,Constantes,
   output wire signed [2*N-1:0] Suma_G
	);

wire signed [2*N-1:0] resultado_parcial; 

assign Suma_G = (Multiplicandos*Constantes + Sum_ext);


endmodule 