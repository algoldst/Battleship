`timescale 1ns / 1ps
/* File: Slave_Top_UART.sv
 * Init: 11/27/2018 08:44:23 PM
 * Author: Alex Goldstein
 * Description: Connects Slave_Top with UART for send/receive of data to Master.
 */

module Slave_Top_UART(
    input clk, //received from Master, do NOT use internal basys clock!
    input MasSlav_Sig, //Mas-->Slave receiving signal
    input MasSlav_A, //Master-->Slave value for A, receives bitstream to be decoded by UART_Rec
    input [15:0] B,
    input LDR1B,
    input LDR2B,
    input clr,
    input ST,
    input [2:0] DispB,
    input BTN1B_IN,
    input BTN2B_IN,
    input BTN3B_IN,
    output LivB,
    output OKB,
    output SlavMas_B_Attack, //Slave-->Master B_Attack value, sent as a bitstream by UART_Trans
    output SlavMas_Sig, //Slave-->Master signal to alert Master to incoming bitstream
    output [7:0] seg,
    output [3:0] an,
    output BTN1B,
    output BTN2B,
    output BTN3B
    );

logic sclk;
ClockDiv #(2000) uartClk(.clk, .sclk(sclk));

logic [15:0] t_A;
UART_Rec #(16,100) rec(.clk, .bsIn(MasSlav_A), .recSig(MasSlav_Sig), .data(t_A));

logic [15:0] t_B_Attack;
UART_Trans #(16,100,1) trans(.clk, .data(t_B_Attack), .sendBtn(LDR2B), .bsOut(SlavMas_B_Attack), .sendSig(SlavMas_Sig));

Slave_Top slave_top(.clk(sclk), .A(t_A), .B_Attack(t_B_Attack), .*);

endmodule