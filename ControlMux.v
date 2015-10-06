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
	input wire Bandera,clk,Signal,
	output wire [2:0] sel_const,
	output wire [1:0] sel_fun,
	output wire sel_acum,Band_Listo
    );
	 
//Varaibles
reg [2:0] sel_c,est_sig,est_act;
reg [1:0] sel_f;
reg sel_a,Listo;

//Parte Secuencial 

always@(posedge clk)
begin
	if(Bandera)
		est_act <= 0;
	else 
		est_act <= est_sig;	
end

//Parte combinacional 

always@*
begin
/*if(Signal)
begin*/
	case(est_act)
			3'b000:
				begin
					sel_c = 0;
					sel_f = 0;
					sel_a = 0;
					est_sig = 3'b001;
					Listo	= 0;
				end
				
			3'b001:
				begin 
					sel_c = 3'b001;
					sel_f = 2'b01;
					sel_a = 1;
					est_sig = 3'b010;
					Listo	= 0;
				end
			
			3'b010:
				begin
					sel_c = 3'b010;
					sel_f = 2'b10;
					sel_a = 1;
					est_sig = 3'b011;
					Listo	= 0;
				end
			
			3'b011:
				begin
					sel_c = 3'b011;
					sel_f = 0;
					sel_a = 1;
					est_sig = 3'b100;
					Listo	= 0;
				end
			
			3'b100:
				begin
					sel_c = 3'b100;
					sel_f = 2'b01;
					sel_a = 1;
					est_sig = 3'b101;
					Listo	= 0;
				end
				
			3'b101:
				begin
					sel_c = 3'b101;
					sel_f = 2'b10;
					sel_a = 1;
					est_sig = 3'b000;
					Listo	= 1;
				end
			default:
				begin
					sel_c = 0;
					sel_f = 0;
					sel_a = 0;
					est_sig = 3'b000;
					Listo	= 0;
				end
	endcase	
end
/*else
begin
end
est_sig = 3'b000;
end*/



assign sel_const = sel_c;
assign sel_fun = sel_f;
assign sel_acum = sel_a;
assign Band_Listo = Listo;
endmodule
