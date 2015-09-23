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
module Aritmetica(
		input wire CLK_G,
		);



Concatenador instance_Concatenador (
    .CLK(CLK_G), 
    .ValorSuma(ValorSuma), 
    .Suma_ext(Suma_ext)
    );
	
Multiplicador instance_Multiplicador (
    .Multiplicandos(Multiplicandos), 
    .Constantes(Constantes), 
    .Multip(Multip)
    );
	
Sumador instance_Sumador (
    .Sum_ext(Sum_ext), 
    .Multiplica(Multiplica), 
    .Suma_G(Suma_G)
    );

Truncamiento instance_Truncamiento (
    .Datos_Sum(Datos_Sum), 
    .Datos_Trunc(Datos_Trunc)
    );
	 
endmodule
