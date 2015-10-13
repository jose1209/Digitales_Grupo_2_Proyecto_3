`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:57 10/12/2015 
// Design Name: 
// Module Name:    Regisin_Acum 
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
module Regisin_Acum #(parameter N = 25 /* Valor de N*/)(
	input wire signed[2*N-1:0] In,
	output wire signed[2*N-1:0] Out,
	input wire clk,ban_Adc,ban_Listo
    );

reg est_sig,est_act;	
reg signed [2*N-1:0] salida;




always@(posedge clk)
begin

 est_act <= est_sig; 
 
end

always@*

begin
salida = 0;
est_sig = est_act;
	case(est_act)
		
		1'b0:
			begin
				if(ban_Adc)
					est_sig = 1'b1;
				else
					salida = salida;
			end
		
		1'b1:
			begin
				if(ban_Listo)
					est_sig = 1'b0;
				else
					salida = In;
			end
		
		default:
			est_sig = 1'b0;
	endcase
	
end

assign Out = salida;

endmodule
