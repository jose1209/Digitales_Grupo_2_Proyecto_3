`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jose Gabriel Carmona Rodriguez
// 
// Create Date:    15:55:19 09/22/2015 
// Design Name: 
// Module Name:    Truncamiento 
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
module Truncamiento(
	input wire [2*(N-1):0] Datos_Sum,
	output reg [N-1:0] Datos_Trunc
   );
	
	//Cantidad de bits de Magnitud
	parameter P = 4;
	
		
	assign S = Datos_Trunc[N-1];
	assign M = Datos_Trunc[N-2:N-P];
	assign F = Datos_Trunc[N-(P+1):0];



endmodule
