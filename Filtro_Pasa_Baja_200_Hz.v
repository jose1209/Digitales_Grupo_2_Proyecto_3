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
	input wire [N-1:0] Uk,
	input wire Clk,Bandera_ADC,
	output wire [N-1:0] Yk,
	output wire Bandera_Listo
    );

wire [2:0] SelectorConst;
wire [1:0] SelectorFk;
wire [N-1:0] Const,InAcum,InMul,Trunacum,Trunfk,Trunfk_1,Trunfk_2;
wire [2*N-1:0] ResultArim,Racum,Rfk,Rfk_1,Rfk_2,Signregis;


ControlMux instance_Control(
    .clk(Clk), 
    .Bandera(Bandera_ADC), 
    .sel_const(SelectorConst), 
    .sel_fun(SelectorFk), 		
    .sel_acum(sel_acum),   
    .Band_Listo(Bandera_Listo)
    );

Mux_Constantes instance_MuxConstantes (
    .selector(SelectorConst), 
    .Constantes(Const)		
    );
	 
Mux_Ac instance_Mux_Acum (
    .select(sel_acum), 
    .Uk(Uk), 
    .Acum(Trunacum), 
    .Y(InAcum)			
    );

Mux_Fk instance_Mux_Fk (
    .select(SelectorFk), 
    .fk(Trunfk), 					
    .fk_1(Trunfk_1), 				
    .fk_2(Trunfk_2), 			
    .Y(InMul)					
    );
	 
Aritmetica instance_Aritmetica (
    .Constantes_G(Const), 
    .Multip_G(InMul), 
    .Entrada_G(InAcum), 
    .Valores(ResultArim)			
    );
	 
Registro_Suma instance_Resgistros (
    .Suma(ResultArim), 
    .Enable(Bandera_Listo), 
    .clk(Clk), 
    .Signreg(Signregis)
    );
	 
Shift_Reg instance_Shift_Reg (
    .In(Signregis), 
    .shift(~sel_acum), 
    .fk(Rfk), 				
    .fk_1(Rfk_1), 			
    .fk_2(Rfk_2),
	 .clk(Clk)
    );

Acumulador instance_Acumulador (
    .In(Signregis), 
    .clk(Clk), 
    .Acumulado(Racum)
    );
	 
Truncamiento instance_TruncamientoFk (
    .Datos_Sum(Rfk), 
    .Datos_Trunc(Trunfk),
	 .Ban_List(Bandera_Listo),
	 .clk(Clk)
    );

Truncamiento instance_TruncamientoFk_1 (
    .Datos_Sum(Rfk_1), 
    .Datos_Trunc(Trunfk_1),
	 .Ban_List(Bandera_Listo),
	 .clk(Clk)
    );

Truncamiento instance_TruncamientoFk_2 (
    .Datos_Sum(Rfk_2), 
    .Datos_Trunc(Trunfk_2),
	 .Ban_List(Bandera_Listo),
	 .clk(Clk)
    );

Truncamiento instance_TruncamientoAcum (
    .Datos_Sum(Racum), 
    .Datos_Trunc(Trunacum),
	 .Ban_List(Bandera_Listo),
	 .clk(Clk)
    );

assign Yk = Trunacum; 


endmodule
