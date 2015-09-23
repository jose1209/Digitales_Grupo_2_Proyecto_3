`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:44:36 09/22/2015 
// Design Name: 
// Module Name:    Prueba_Sumador 
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
module Prueba_Sumador(
    );

parameter N = 24;		 
	 
Sumador instance_SumP (
    .Sum_ext(Sum_ext), 
    .Multiplica(Multiplica), 
    .Suma_G(Suma_G)
    );




endmodule
