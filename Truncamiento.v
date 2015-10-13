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
module Truncamiento #(parameter N = 25, parameter F = 14 /* Valor de N*/)(
	/*input wire signed [2*N-1:0] entrada,
	output wire signed [N-1:0] resultado
	//output wire [N-1:0] NADA
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
	
				if (entrada[2*N-2] == 1 && entrada[2*N-3:FB+FA+MB] == COM_A)
				begin
					Trunk[N-1] = entrada[2*N-2];
					Trunk[N-2:FA] = entrada[(FA+FB+MB)-1:FA+FB];
					Trunk[FA-1:0] = entrada[(FA+FB)-1:FB];	
				end
				else if(entrada[2*N-2] == 0 && ~(entrada[2*N-3:FB+FA+MB] == COM_B))
					begin
						Trunk[N-1] = 1'b0;
						Trunk[N-2:0] = Sat_B;
					end
				
				else if(entrada[2*N-2] == 0 && entrada[2*N-3:FB+FA+MB] == COM_B)
				begin
					Trunk[N-1] = entrada[2*N-2];
					Trunk[N-2:FA] = entrada[(FA+FB+MB)-1:FA+FB];
					Trunk[FA-1:0] = entrada[(FA+FB)-1:FB];
				end
				else 
					begin
						Trunk[N-1] = 1'b1;
						Trunk[N-2:0] = Sat_A;
					end
		
	end

assign resultado = Trunk;
//assign NADA[N-1] = entrada[2*N-1];
//assign NADA[FB-1:0] = entrada[FB-1:0];	
//assign NADA[N-2:FB] = entrada[2*N-3:FA+FB+MB];

endmodule*/

/*
module Truncador( */

 input wire signed [2*N-1:0] entrada,
 output wire signed [N-1:0] resultado
);

 //FORMATO DEL LA PALABRA A TRUNCAR = S1 S2 P1 P2 F1 F2
parameter para0 = {(N-F){1'b0}};
parameter para1 = {(N-F){1'b1}};

//parameter para2 = {(2*(N-F)-1){1'b1}};

//parameter suma = {1'b1,{(F){1'b0}}};

parameter f1 = 2*F-1; // MSB de f1
parameter s1 = 2*N-1; // Bit de s1
parameter s2 = 2*N-2; // Bit de s2
parameter p = N-F-1; // Parte Entera
parameter p1 = N+F-1; // LSB de p1
parameter p2 = N+F-2; // MSB de p2

/*wire [2*N-1:0] numero;

assign numero = (entrada[N-2]==1 && entrada[s2:F] != para2)
					? {entrada + suma}:
					   entrada;*/
						
assign resultado = (entrada[s2] == 1 && entrada[s2-1:p1] != para1)   // si el signo es negativo y NO todos los bits de s2 y p1 son 1 entonces 
						? {entrada[s2],{(p+F){1'b0}}}:                // hay overflow y se asigna el valor más negativo
						(entrada[s2]==0 && entrada[s2-1:p1] != para0)	   //si el signo es positivo y NO todos los bits de s2 y p1 son 0 entonces 	
						? {entrada[s2],{(p+F){1'b1}}}:                //hay overflow y se asigna el valor más positivo
						{entrada[s2],entrada[p2:F]}; // si no se dan esas condiciones, entonces el truncamiento si se puede realizar sin
																				   //sin necesidad de limitarlo porque no hay overflow
endmodule 