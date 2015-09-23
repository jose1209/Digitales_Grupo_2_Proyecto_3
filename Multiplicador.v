`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jose Gabriel Carmona Rodriguez
// 
// Create Date:    15:42:19 09/22/2015 
// Design Name: 
// Module Name:    Multiplicador 
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
module Multiplicador(
	input wire [N-1:0] Multiplicandos,
	input wire [N-1:0] Constantes,
	output reg [2*N-1:0] Multip
    );
parameter N = 24;		 
always@*
begin
Multip = (Multiplicandos*Constantes);
end

endmodule
