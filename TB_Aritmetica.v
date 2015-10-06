`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:17 09/25/2015
// Design Name:   Aritmetica
// Module Name:   C:/Lab Digitales/TercerProyecto/TB_Aritmetica.v
// Project Name:  TercerProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Aritmetica
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Aritmetica #(parameter N = 25);

	// Inputs
	reg [N-1:0] Constantes_G;
	reg [N-1:0] Multip_G;
	reg [N-1:0] Entrada_G;

	// Outputs
	wire [N-1:0] Valores;

	// Instantiate the Unit Under Test (UUT)
	Aritmetica uut (
		.Constantes_G(Constantes_G), 
		.Multip_G(Multip_G), 
		.Entrada_G(Entrada_G), 
		.Valores(Valores)
	);
	
	reg [N-1:0] Array_IN1 [4999:0];
	reg [N-1:0] Array_IN2 [4999:0];
	reg [N-1:0] Array_IN3 [4999:0];

	integer j,Res_Fin;
	
	initial begin
	
	$readmemb("Bin1G.txt", Array_IN1,0,4999);
	$readmemb("Bin2G.txt", Array_IN2,0,4999);
	$readmemb("Bin3G.txt", Array_IN3,0,4999);
	Res_Fin= $fopen("Resultados_Fin.txt","w"); //Crea el archivo Aritmetica donde se guarda el resultado
	
	
		for(j=0; j<5000; j=j+1) 
			begin
				Constantes_G = Array_IN1[j]; 
				Multip_G = Array_IN2[j];
				Entrada_G = Array_IN3[j];
				#10;
				$fwrite(Res_Fin,"%b \n",Valores);	
			end
			
	$fclose(Res_Fin);	
	end
	
      
endmodule

