`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:02 10/14/2015 
// Design Name: 
// Module Name:    Truncador_PWM 
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
module Truncador_PWM(
	input [24:0] dato_infiltro, //Dato que sale del filtro
	output [11:0] dato_truncout); //Dato truncado para el PWM

wire comp = {12{dato_infiltro[24]}} ;
reg [11:0] dato_trunc;
wire [24:0] aux;
assign aux = dato_infiltro;

always @*
	begin
		if (aux[24] == 1 && comp != aux[24:13]) dato_trunc <= 12'b0; //Para el caso de underflow
		else if (aux[24] == 0 && comp != aux [24:13]) dato_trunc <= 12'b111111111111; //Para el caso de overflow
		else dato_trunc <= {~{aux[13]},aux[12:2]}; //El bit 13 negado es para sumar los 0.5
	end

assign dato_truncout = dato_trunc;

endmodule
