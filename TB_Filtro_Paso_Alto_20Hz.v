`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:20:27 10/13/2015
// Design Name:   pasoalto_20Hz
// Module Name:   C:/Users/ROBERTO/Dropbox/Universidad/II semestre 2015/Lab de digitales/Proyectos/Proyecto_3_Filtro/TB_Filtro_Paso_Alto_20Hz.v
// Project Name:  Proyecto_3_Filtro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pasoalto_20Hz
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Filtro_Paso_Alto_20Hz;

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
	pasoalto_20Hz uut (
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

initial forever #20 clk = ~clk;
		
endmodule 