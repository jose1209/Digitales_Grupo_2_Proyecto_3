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
	input wire Bandera,clk,
	output wire [2:0] sel_const,
	output wire [1:0] sel_fun,
	output wire sel_acum,Band_Listo
    );
	 
//Varaibles
reg [2:0] sel_c,est_sig,est_act;
reg [1:0] sel_f;
reg sel_a,Listo;
integer contador;


//Parte Secuencial 

always@(posedge clk)
begin
 if(Bandera)
 begin
 est_act <= 3'b000;
 contador=0;
 end
 else 
 begin
 est_act <= est_sig; 
 contador=contador+1;
 end
end

//Parte combinacional 

always@*
begin

if (contador <= 7)
begin
 case(est_act)
 3'b000:
 begin
 sel_c = 0;
 sel_f = 0;
 sel_a = 0;
 Listo = 0;
 est_sig = 3'b001;
 
 end
 
 3'b001:
 begin 
 sel_c = 3'b001;
 sel_f = 2'b01;
 sel_a = 1;
 Listo = 0;
 est_sig = 3'b010;
 
 end
 
 3'b010:
 begin
 sel_c = 3'b010;
 sel_f = 2'b10;
 sel_a = 1;
 Listo = 0;
 est_sig = 3'b011;

 end
 
 3'b011:
 begin
 sel_c = 3'b011;
 sel_f = 0;
 sel_a = 1;
 Listo = 0;
 est_sig = 3'b100;

 end
 
 3'b100:
 begin
 sel_c = 3'b100;
 sel_f = 2'b01;
 sel_a = 1;
 Listo = 0;
 est_sig = 3'b101;
 
 end
 
 3'b101:
 begin
 sel_c = 3'b101;
 sel_f = 2'b10;
 sel_a = 1;
 Listo = 0;
 est_sig = 3'b110;
 end
 
 3'b110:
 begin
Listo = 0;
est_sig = 3'b111;
 end
 
 3'b111:
 begin
 Listo = 1;
 end
 
 default:
 begin
 sel_c = 0;
 sel_f = 0;
 sel_a = 0;
 est_sig = 3'b000;
 Listo = 0;
 end
 endcase 
 end
 
 else 
 begin
 est_sig = 3'b000;
 end
end



assign sel_const = sel_c;
assign sel_fun = sel_f;
assign sel_acum = sel_a;
assign Band_Listo = Listo;
endmodule
	 
