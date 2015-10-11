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
module Truncamiento #(parameter N = 25 /* Valor de N*/)(
	input wire [2*N-1:0] Datos_Sum,
	output wire [N-1:0] Datos_Trunc,
	output wire [N-1:0] NADA
	//input wire Ban_List
   );
	
reg [N-1:0] Trunk;

initial
begin
Trunk = 0;
end
	
	parameter 			//Parte de magnitud salida
	MA = 5,
	MB = 10,
	FA = 14,
	FB = 19;
	
	localparam[2*N-3:FB+FA+MB]
	COM_A = ~0,
	COM_B = 0;
	
	localparam[N-2:0]
	Sat_A = 0,
	Sat_B = ~0;
	

	always@*
	begin
	
				if (Datos_Sum[2*N-2] == 1 && Datos_Sum[2*N-3:FB+FA+MB] == COM_A)
				begin
					Trunk[N-1] = Datos_Sum[2*N-2];
					Trunk[N-2:FA] = Datos_Sum[(FA+FB+MB)-1:FA+FB];
					Trunk[FA-1:0] = Datos_Sum[(FA+FB)-1:FB];	
				end
				else if(Datos_Sum[2*N-2] == 0 && ~(Datos_Sum[2*N-3:FB+FA+MB] == COM_B))
					begin
						Trunk[N-1] = 1'b0;
						Trunk[N-2:0] = Sat_B;
					end
				
				else if(Datos_Sum[2*N-2] == 0 && Datos_Sum[2*N-3:FB+FA+MB] == COM_B)
				begin
					Trunk[N-1] = Datos_Sum[2*N-2];
					Trunk[N-2:FA] = Datos_Sum[(FA+FB+MB)-1:FA+FB];
					Trunk[FA-1:0] = Datos_Sum[(FA+FB)-1:FB];
				end
				else 
					begin
						Trunk[N-1] = 1'b1;
						Trunk[N-2:0] = Sat_A;
					end
		
	end

assign Datos_Trunc = Trunk;
assign NADA[N-1] = Datos_Sum[2*N-1];
assign NADA[FB-1:0] = Datos_Sum[FB-1:0];	
assign NADA[N-2:FB] = Datos_Sum[2*N-3:FA+FB+MB];

endmodule
