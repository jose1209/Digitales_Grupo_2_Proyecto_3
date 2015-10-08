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
	output wire [1:0] sel_fun,sel_acum,
	output wire Band_Listo,Senal
    );
	 
//Varaibles
reg [2:0] sel_c;
reg [3:0] est_sig,est_act;
reg [1:0] sel_f,sel_a;
reg Listo,senal;
integer contador;


//Parte Secuencial 

always@(posedge clk)
begin
 if(Bandera)
 begin
 est_act <= 4'b0000;
 contador <= 0;
 end
 else 
 begin
 est_act <= est_sig; 
 contador <= contador+1;
 end
end

//Parte combinacional 

always@*
begin
senal = 0;
if (contador <= 5)
begin
 case(est_act)
 
	4'b0000:
		begin
			sel_c = 3'b000;
			sel_a = 2'b00;
			sel_f = 2'b00;
			senal = 0;
			Listo = 0;
			est_sig = 4'b0001;
		end
	
	4'b0001:
		begin
			sel_c = 3'b000;
			sel_a = 2'b01;
			sel_f = 2'b10;
			senal = 0;
			Listo = 0;
			est_sig = 4'b0010;
		end
	
	4'b0010:
		begin
			sel_c = 3'b001;
			sel_a = 2'b01;
			sel_f = 2'b11;
			senal = 1;
			Listo = 0;
			est_sig = 4'b0011;
		end
	
	4'b0011:						//fk
		begin
			sel_c = 3'b010;
			sel_a = 2'b10;
			sel_f = 2'b01;
			senal = 0;
			Listo = 0;
			est_sig = 4'b0100;
		end
		
	4'b0100:
		begin
			sel_c = 3'b011;
			sel_a = 2'b01;
			sel_f = 2'b10;
			senal = 0;
			Listo = 0;
			est_sig = 4'b0101;
		end
		
	4'b0101:						//fk_2
		begin
			sel_c = 3'b100;
			sel_a = 2'b01;
			sel_f = 2'b11;
			senal = 0;
			Listo = 1;
		end
	
		

 default:
 begin
 sel_c = 0;
 sel_f = 0;
 sel_a = 0;
 Listo = 0;
 senal = 0;
 est_sig = 4'b0000;
 end
 endcase 
 end
 
 else 
 begin
 est_sig = 4'b0000;
 end
 end



assign sel_const = sel_c;
assign sel_fun = sel_f;
assign sel_acum = sel_a;
assign Band_Listo = Listo;
assign Senal = senal;
endmodule
	 
