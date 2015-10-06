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
	 
parameter 			//Parte de magnitud salida
	MA = 5,
	MB = 10,
	FA = 14,
	FB = 19;
	
wire [2*N-1:0] Extension;

assign Extension[2*N-1:MB+FA+FB] = $signed(ValorSuma[N-1]);
assign Extension[(MB+FA+FB)-1:FA+FB] = ValorSuma[N-2:FA];
assign Extension[(FA+FB)-1:FB] = ValorSuma[FA-1:0];
assign Extension[FB-1:0] = 0;

assign Suma_ext = Extension; 
 
endmodule
