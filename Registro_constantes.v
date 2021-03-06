`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:51 03/29/2015 
// Design Name: 
// Module Name:    Registro_constantes 
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
module Registro_constantes #(parameter N = 25 /* Valor de N*/)(
input clk,
input [3:0] sel_in,
output reg [N-1:0]a1,
output reg [N-1:0]a2,
output reg [N-1:0]b0,
output reg [N-1:0]b1,
output reg [N-1:0]b2
    );

always @ (posedge clk)
begin

case (sel_in)							//Filtros Paso Bajo
4'h1://Filtro de 200 Hz				//Valores Teoricos
begin
a1=25'b1111000001010001111010111; //-1.96
a2=25'b0000011110101111000110101; //0.9605
b0=25'b0000000000000000011010001; //0.000199
b1=25'b0000000000000000110100001; //0.0003979
b2=25'b0000000000000000011010001; //0.000199
end

4'h3://Filtro de 5 kHz
begin
a1=25'b1111011110111000010100100; //-1.035
a2=25'b0000001011110001010000010; //0.3678
b0=25'b0000000010101010010100000; //0.08316
b1=25'b0000000101010100100101010; //0.1663
b2=25'b0000000010101010010100000; //0.08316
end

4'h5://Filtro a 20 kHz
begin
a1=25'b0000110010111010010111100; //1.591
a2=25'b0000010101001011001010011; //0.6617
b0=25'b0000011010000001011011110; //0.8132
b1=25'b0000110100000010000011001; //1.626
b2=25'b0000011010000001011011110; //0.8132
end

4'h7://Filtro 20 Hz					 //Fitro Paso Alto
begin
a1=25'b1111000000001000001100010; //-1.996
a2=25'b0000011111110111110011110; //0.996
b0=25'b0000011111111011111001111; //0.998
b1=25'b1111000000001000001100010; //-1.996
b2=25'b0000011111111011111001111; //0.998
end

4'h9://Filtro 200 Hz
begin
a1=25'b1111000001010001111010111; //-1.96
a2=25'b0000011110101111000110101; //0.9605
b0=25'b0000100000000000000000000; //1
b1=25'b1111000000000000000000000; //-2
b2=25'b0000100000000000000000000; //1
end

4'hB://Filtro	5 kHz
begin
a1=25'b1111011110111000010100100; //-1.035
a2=25'b0000001011110001010000010; //0.3678
b0=25'b0000010011001110001111000; //0.6007
b1=25'b1111011001100100010110100; //-1.201
b2=25'b0000010011001110001111000; //0.6007
end

default
begin
a1=25'b0;
a2=25'b0;
b0=25'b0;
b1=25'b0;
b2=25'b0;
end
endcase
end
endmodule
