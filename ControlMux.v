`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:55 09/30/2015 
// Design Name: 
// Module Name:    ControlMux 
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
module ControlMux(
	input wire rst,clk,Bandera;
	output reg [2:0] sel_const;
	output reg [1:0] sel_fun;
	output reg sel_acum;
    );

//Varaibles
reg [2:0] var1;
reg [1:0] var2;
reg var3,est_sig,est_act;


	 
//Parte Secuencial 

always@(posedge clk, posedge rst)
begin
	if(rst)
		begin
			var1 <= 0;
			var2 <= 0;
			var3 <= 0;
		end
	else
		est_sig <= est_act;
end



endmodule
