`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:33:57 10/01/2015 
// Design Name: 
// Module Name:    Filtro_Pasa_Baja_200_Hz 
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
module Filtro_Pasa_Baja_200_Hz #(parameter N = 25 /* Valor de N*/)(
	input wire signed [N-1:0] Uk,
	input wire Clk,Bandera_ADC,
	output wire signed [N-1:0] Yk,
	output wire Bandera_Listo
    );

wire [2:0] SelectorConst;
wire [1:0] SelectorFk,sel_acum;
wire [N-1:0] Const,InMul,Trunacum,Trunfk,Trunfk_1,Trunfk_2,NADA0,NADA1,NADA2,NADA3,regcons,regfk;
wire [2*N-1:0] ResultArim,Racum,Rfk,Rfk_1,Rfk_2,Signregis,Ext_Con,Yk_trunk,InAcum,senalreg,regacum;


ControlMux instance_Control(
    .clk(Clk), 
    .Bandera(Bandera_ADC), 
    .sel_const(SelectorConst), 
    .sel_fun(SelectorFk), 		
    .sel_acum(sel_acum),   
    .Band_Listo(Bandera_Listo),
	 .Senal(Senal)
    );

Registros_sincronizacion_N instance_SincroCons (
    .In(Const), 
    .Out(regcons), 
    .clk(Clk), 
    .ban_Adc(Bandera_ADC), 
    .ban_Listo(Bandera_Listo)
    );
	 
Registros_sincronizacion_N instance_SincroFk(
    .In(InMul), 
    .Out(regfk), 
    .clk(Clk), 
    .ban_Adc(Bandera_ADC), 
    .ban_Listo(Bandera_Listo)
    );

Regisin_Acum instance_SicroAcum (
    .In(InAcum), 
    .Out(regacum), 
    .clk(Clk), 
    .ban_Adc(Bandera_ADC), 
    .ban_Listo(Bandera_Listo)
    );


Mux_Constantes instance_MuxConstantes (
    .selector(SelectorConst), 
    .Constantes(Const)		
    );

Mux_Fk instance_Mux_Fk (
    .select(SelectorFk), 
    .fk(Trunfk), 					
    .fk_1(Trunfk_1), 
	 .Uk(Uk),
    .fk_2(Trunfk_2), 			
    .Y(InMul )					
    );

Mux_Ac instance_Mux_Acum (
    .select(sel_acum), 
    .Acum(Racum), 
    .Y(InAcum)			
    );

Sumador instance_Aritmetica (
    .Sum_ext(regacum), 
    .Multiplicandos(regfk), 
    .Constantes(regcons), 
    .Suma_G(ResultArim)
    );
	 
Truncamiento instance_TruncamientoAcum (
    .entrada(Racum), 
    .resultado(Trunacum)
	 //.NADA(NADA0)
    );
	 
Acumulador instance_Acumulador (
    .In(ResultArim), 
    .clk(Clk), 
    .Acumulado(Racum),
	 .Bandera(Bandera_ADC)
    );

Registro_para_despla instance_Registro(
    .In(ResultArim), 
    .fk(senalreg), 
    .clk(Clk), 
    .bandera(Senal)
    );


	 
Shift_Reg instance_Shift_Reg (
    .In(senalreg), 
    .shift(Bandera_Listo), 
    .fk(Rfk), 				
    .fk_1(Rfk_1), 			
    .fk_2(Rfk_2),
	 .clk(Clk)
    );


	 
Truncamiento instance_TruncamientoFk (
    .entrada(Rfk), 
    .resultado(Trunfk)
	 //.NADA(NADA3)
    );

Truncamiento instance_TruncamientoFk_1 (
    .entrada(Rfk_1), 
    .resultado(Trunfk_1)
	 //.NADA(NADA2)
    );

Truncamiento instance_TruncamientoFk_2 (
    .entrada(Rfk_2), 
    .resultado(Trunfk_2)
	 //.NADA(NADA1)
    );
	 
Registro_Yk instance_Yk (
    .In(Trunacum), 
    .Finish(Bandera_Listo), 
    .clk(Clk), 
    .Yk(Yk/*Yk_trunk*/)
    );

/*
assign NO_CONET0 = NADA0;
assign NO_CONET1 = NADA1;
assign NO_CONET2 = NADA2;
assign NO_CONET3 = NADA3;
assign Yk = Trunacum;
*/
endmodule
