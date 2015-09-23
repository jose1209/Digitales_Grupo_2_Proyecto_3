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
	input wire [2*N-1:0] Datos_Sum,
	output reg [N-1:0] Datos_Trunc
   );
	parameter N = 24;	
	parameter 			//Parte de magnitud salida
	MA = 5,
	MB = 6,
	FA = 7,
	FB = 8;
	
	localparam[2*N-3:FB+FA+MB]
	COM_A = ~0,
	COM_B = 0;
	

	always@*
	begin

		Datos_Trunc[N-1] = Datos_Sum[2*N-2];
		
		if (Datos_Sum[2*N-2] == 1 && Datos_Sum[2*N-3:FB+FA+MB] == COM_A)
		begin
			Datos_Trunc[N-2:MB+FA] = Datos_Sum[(FA+FB+MB)-1:FA+FB];
			Datos_Trunc[(MB+FA)-1:0] = Datos_Sum[(FA+FB)-1:FB];
		end
		else 
		begin
			Datos_Trunc[N-2:MB+FA] = COM_A;
			Datos_Trunc[(MB+FA)-1:0] = COM_A;
		end
		
		if(Datos_Sum[2*N-2] == 0 && Datos_Sum[2*N-3:FB+FA+MB] == COM_B)
		begin
			Datos_Trunc[N-2:MB+FA] = Datos_Sum[(FA+FB+MB)-1:FA+FB];
			Datos_Trunc[(MB+FA)-1:0] = Datos_Sum[(FA+FB)-1:FB];
		end
		else 
		begin
			Datos_Trunc[N-2:MB+FA] = COM_B;
			Datos_Trunc[(MB+FA)-1:0] = COM_B;
		end
	end
	
endmodule
