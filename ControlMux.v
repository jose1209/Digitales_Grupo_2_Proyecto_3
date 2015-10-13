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
reg [2:0] est_sig,est_act;
reg [1:0] sel_f,sel_a;
reg Listo,senal;



//Parte Secuencial 

always@(posedge clk)
	begin
		est_act <= est_sig; 
	end

//Parte combinacional 

always@*
begin
sel_c = 0;
sel_f = 0;
sel_a = 0;
Listo = 0;
senal = 0;
est_sig = est_act;
	case(est_act)
		3'b000:
			begin
					if(Bandera)
						begin
							Listo = 0;
							est_sig = 3'b001;
						end
					else
						begin
							Listo = 0;
							est_sig = 3'b000;
						end
			end
		
		3'b001:
			begin
				sel_c = 3'b101;
				sel_a = 2'b10;
				sel_f = 2'b00;
				est_sig = 3'b010;
			end
			
		3'b010:
			begin
				sel_c = 3'b000;
				sel_a = 2'b00;
				sel_f = 2'b10;
				est_sig = 3'b011;
			end
		
		3'b011:
			begin
				sel_c = 3'b001;
				sel_a = 2'b00;
				sel_f = 2'b11;
				senal = 1;
				est_sig = 3'b100;
			end
		
		3'b100:
			begin
				sel_c = 3'b010;
				sel_a = 2'b01;
				sel_f = 2'b01;
				senal = 0;
				est_sig = 3'b101;
			end
		
		3'b101:
			begin
				sel_c = 3'b011;
				sel_a = 2'b00;
				sel_f = 2'b10;
				est_sig = 3'b110;
			end
			
		3'b110:
			begin
				sel_c = 3'b100;
				sel_a = 2'b00;
				sel_f = 2'b11;
				Listo = 1;
				est_sig = 3'b000;
			end
		default:
			begin 
				sel_c = 3'b101;
				sel_a = 2'b01;
				sel_f = 2'b00;
				Listo = 0;
				est_sig = 3'b000;
			end
	endcase
end

assign sel_const = sel_c;
assign sel_fun = sel_f;
assign sel_acum = sel_a;
assign Band_Listo = Listo;
assign Senal = senal;

endmodule


