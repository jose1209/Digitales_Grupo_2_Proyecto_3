`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:46:08 09/24/2015
// Design Name:   Multiplicador
// Module Name:   C:/Lab Digitales/TercerProyecto/TB_Multiplicador.v
// Project Name:  TercerProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplicador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Multiplicador #(parameter N = 25);

	// Inputs
	reg [N-1:0] Multiplicandos;
	reg [N-1:0] Constantes;

	// Outputs
	wire [2*N-1:0] Multip;

	// Instantiate the Unit Under Test (UUT)
	Multiplicador uut (
		.Multiplicandos(Multiplicandos), 
		.Constantes(Constantes), 
		.Multip(Multip)
	);
	
	reg [2*N-1:0] Array_IN1 [4999:0];
	reg [2*N-1:0] Array_IN2 [4999:0];

	integer j,Produc;
	
	initial begin
	
	$readmemb("Multip1.txt", Array_IN1,0,4999);
	$readmemb("Multip2.txt", Array_IN2,0,4999);
	Produc= $fopen("Producto.txt","w"); //Crea el archivo suma donde se guarda el resultado
	
	
		for(j=0; j<5000; j=j+1) 
			begin
				Multiplicandos = Array_IN1[j]; 
				Constantes = Array_IN2[j];
				#10;
				$fwrite(Produc,"%b \n",Multip);	
			end
			
	$fclose(Produc);	
	end
	
endmodule

