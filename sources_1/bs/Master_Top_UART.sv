`timescale 1ns / 1ps
/* File: Master_Top_UART.sv
 * Init: 11/27/2018 08:27:23 AM
 * Author: Alex Goldstein
 * Description: Connects Master_Top with UART for send/receive of data to
 * Slave module.
 */

module Master_Top_UART(
    input topclk,
    input [15:0] A,
    input SlavMas_B, //bitstream from slave-->master, receives B from Slave via UART_Rec
    input SlavMas_Sig, //receiving signal slave-->master for UART_Rec
    input BTN1A,
    input BTN1B,
    input BTN2A,
    input BTN2B,
    input LivB,
    input BTN3A,
    input BTN3B,
    input OKB,
    output LDR1B,
    output LDR2B,
    output [2:0] DispB,
    output clr,
    output MasSlav_A_Attack, //master-->slave bitstream from UART_Trans
    output MasSlav_Sig, //sending signal used by UART_Trans. This comes from t5 on LDR2A in Master_Top
    output [7:0] seg,
    output [3:0] an,
    output ST,
    output sendClk //to send clk signal to slave basys
        );
        
// Divide topclk (100 MHz) to get a new base frequency for all modules to reference, clk.
logic clk;
ClockDiv #(200) topclkDiv(.clk(topclk), .sclk(clk)); // Prof. Benson said to use < 9kHz top clk for working UART.
assign sendClk = clk;
        
// Divide clk into sclk for Battleship to reference. UART will take (16 bits)*(100clk cycles)=1600 clk cycles to send/receive, so we will divide by 2000 to be safe.
logic sclk; // sclk for master_top
ClockDiv #(2000) bsClk(.clk, .sclk(sclk));

// UART for B input
logic [15:0] t_B; //interconnect uart_rec-->mastertop
UART_Rec #(16,100) rec(.clk, .bsIn(SlavMas_B), .recSig(SlavMas_Sig), .data(t_B));    

// UART for A_Attack output    
logic t_UART_Activate; //interconnects mastertop<-->uart_trans
logic [15:0] t_A_Attack;
UART_Trans #(16,100,1) trans(.clk, .data(t_A_Attack), .sendBtn(t_UART_Activate), .bsOut(MasSlav_A_Attack), .sendSig(MasSlav_Sig));

Master_Top mastertop(.clk(sclk), .A, .B(t_B), .BTN1A, .BTN1B, .BTN2A, .BTN2B, .LivB, .BTN3A, .BTN3B, .OKB, .LDR1B, .LDR2B, .DispB, .clr, .A_Attack(t_A_Attack), .seg, .an, .ST, .UART_Activate(t_UART_Activate));


endmodule
