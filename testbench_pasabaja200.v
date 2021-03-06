`timescale 1ns / 1ps

module testbench_pasabaja200;

	// Inputs
	reg clk;
	reg rst;
	reg rx;
	reg [24:0] u;
	
	reg [24:0] datos [0:999];
	

	// Outputs
	wire [24:0] y;

	// Instantiate the Unit Under Test (UUT)
	pasabajas_200 uut (
		.clk(clk), 
		.rst(rst),
		.rx(rx),
		.u(u), 
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

initial forever #20 clk = ~clk;
		
endmodule

