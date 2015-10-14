`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:16:38 10/13/2015
// Design Name:   pasabajas_20k
// Module Name:   C:/Xilinx/Proyecto3/testbench_pasabaja20k.v
// Project Name:  Proyecto3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pasabajas_20k
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_pasabaja20k;

	// Inputs
	reg clk;
	reg rst;
	reg rx;
	reg [24:0] u;
	
	reg [24:0] datos [0:999];

	// Outputs
	wire rx_2;
	wire [24:0] y;

	// Instantiate the Unit Under Test (UUT)
	pasabajas_20k uut (
		.clk(clk), 
		.rst(rst), 
		.rx(rx), 
		.u(u), 
		.rx_2(rx_2), 
		.y(y)
	);

	integer j, arch_text, num_datos = 1000;
	
	initial 
		begin
			clk = 0;
			rx = 0;
			rst = 1;
			u = 0;
			j = 0;
			#1 rst = 0;
		end
		
	 initial 
		 begin 
			$readmemb("estimulac_bin.txt",datos);
			arch_text = $fopen("resp_bin.txt","w"); 
			for(j=0; j<num_datos; j=j+1) 
				begin
					rx = 1; u = datos[j];
					repeat(1) @(posedge clk); rx = 0;
					repeat(15) @(posedge clk); $fwrite(arch_text,"%b\n",y); 
				end
		 $fclose(arch_text);
		 $stop;
	 end

initial forever #2.5 clk = ~clk;
      
endmodule

