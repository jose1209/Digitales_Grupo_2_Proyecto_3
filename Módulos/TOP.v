`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:57 10/15/2015 
// Design Name: 
// Module Name:    TOP 
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
module TOP#(parameter cant_bits = 25)(
				input wire clk, rst, signal, sw_A, sw_M, sw_B,
				output wire ampSD, pwm_out, cs , sclk
    );

wire [cant_bits-1:0] u, y;
wire [(cant_bits-3)/2:0] y_pwm;

assign ampSD = 1;

ADC_final ADC (
    .clk(clk), //---------
    .rst(rst), //--------
    .sdata(signal), //------
    .cs(cs), //-----
    .sclk(sclk), //--------
    .desp_enable(rx), //------
    .dato_final(u)//------
    );
	 
filtrado FILTROS (
    .rx(rx), //------
    .clk(clk), //-------
    .sw_B(sw_B), //-----
    .sw_M(sw_M), //-----
    .sw_A(sw_A), //--------
    .rst(rst), //---------
    .u(u), //--------
    .y(y)//------
    );
	 
Truncador_PWM TRUNC_PWM (
    .dato_infiltro(y), //--------
    .dato_truncout(y_pwm)//---
    );
	 
pwm PWM (
    .clk_pwm(clk), //--------
    .PMW_in(y_pwm), //------
    .PWM_out(pwm_out)//---------
    );	 
	 
endmodule
