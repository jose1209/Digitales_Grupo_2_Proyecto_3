`timescale 1ns / 1ps

module pwm #(parameter cant_bits = 12)(
				input wire clk_pwm,
				input wire [cant_bits-1:0] PMW_in,
				output wire PWM_out
   );
	
   reg [cant_bits:0] counter;
     
   always @ (posedge clk_pwm)
		
         counter <= counter[cant_bits-1:0] + PMW_in;
       
		 
assign PWM_out = counter[cant_bits];

endmodule
