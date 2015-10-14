`timescale 1ns / 1ps

module Contador(
	input wire clk, rst, en,
	output reg [3:0] cont_out
    );

always@(posedge clk, posedge rst)
		if (rst)
			cont_out <= 4'b0;
		else 
			if(en)
				if(cont_out < 4'd9)
					cont_out <= cont_out + 1'b1;
				else
					cont_out <= 4'b0;
		
endmodule
