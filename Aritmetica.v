`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jose Gabriel Carmona Rodriguez
// 
// Create Date:    14:52:55 09/22/2015 
// Design Name: 
// Module Name:    Aritmetica 
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
module Aritmetica #(parameter N = 25 /* Valor de N*/)(
	input wire [N-1:0] Constantes_G,Multip_G,Entrada_G,
	output wire [2*N-1:0] Valores
	);
wire [2*N-1:0] Ext_Sign;	
		
Concatenador instance_Concatenador (
    .ValorSuma(Entrada_G), 
    .Suma_ext(Ext_Sign)
    );

Sumador instance_Sum_Mul (
    .Sum_ext(Ext_Sign), 
    .Multiplicandos(Multip_G), 
    .Constantes(Constantes_G), 
    .Suma_G(Valores));

endmodule
