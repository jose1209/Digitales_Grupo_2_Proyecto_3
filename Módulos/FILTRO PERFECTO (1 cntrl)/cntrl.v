`timescale 1ns / 1ps

module cntrl(
	input wire clk, rst, cambiar,
	output reg leer, desp, leer_y, rst_acum,
	output wire [3:0] sel
    );
	 
wire [3:0] cont_data;
reg en;

initial en = 1;

Contador modulo_contador (
    .clk(clk), 
    .rst(rst),
	 .en(en),
    .cont_out(cont_data)
    );

always @ * 
	if(cont_data == 4'b1001 && cambiar == 0)
		en = 0;
	else
		en = 1;
		
				
always @ *
	case(cont_data)
		4'b0011: begin leer = 1; desp = 0; leer_y = 0; rst_acum = 0; end
		4'b0100: begin leer = 0; desp = 0; leer_y = 0; rst_acum = 1; end
		4'b1000: begin leer = 0; desp = 1; leer_y = 1; rst_acum = 0; end
		4'b1001: begin leer = 0; desp = 0; leer_y = 0; rst_acum = 1; end
		default: begin leer = 0; desp = 0; leer_y = 0; rst_acum = 0; end
	endcase	
	
assign sel = cont_data;
	
endmodule
