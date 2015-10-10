`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:40:09 10/01/2015
// Design Name:   Filtro_Pasa_Baja_200_Hz
// Module Name:   C:/Lab Digitales/TercerProyecto/TB_Filtro_PasaBaja_200_Hz.v
// Project Name:  TercerProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Filtro_Pasa_Baja_200_Hz
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Filtro_PasaBaja_200_Hz #(parameter N = 25);

 // Inputs
 reg [N-1:0] Uk;
 reg Clk;
 reg Bandera_ADC;

 // Outputs
 wire [N-1:0] Yk;
 wire Bandera_Listo;
 
 // Instantiate the Unit Under Test (UUT)
 Filtro_Pasa_Baja_200_Hz uut (
 .Uk(Uk), 
 .Clk(Clk), 
 .Bandera_ADC(Bandera_ADC), 
 .Yk(Yk), 
 .Bandera_Listo(Bandera_Listo)
 );
 

reg [N-1:0] Array_IN1 [999:0];
integer j,Filtro;


localparam T = 20;
 always
 begin
 Clk = 1'b1;
 #(T/2) ;
 Clk = 1'b0;
 #(T/2) ;
 end




 initial 
 begin 
 $readmemb("DatosRampa.txt", Array_IN1,0,999);
 Filtro= $fopen("ResFiltro200Bajas.txt","w"); //Crea el archivo de la rampa donde se guarda el resultado
 for(j=0; j<1000; j=j+1) 
 begin
 Bandera_ADC = 1'b1;
 Uk = Array_IN1[j];
repeat(1) @(posedge Clk) 
 @ (posedge Clk);
 Bandera_ADC = 1'b0;
 repeat(10) @(posedge Clk);
 $fwrite(Filtro,"%b \n",Yk); 

 end
 
 $fclose(Filtro); 
 end
 
endmodule
