`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/20/2018 01:22:30 AM
// Design Name: 10 Bit Top file for Master basys board(player A).
//////////////////////////////////////////////////////////////////////////////////


module Slave_Top(
    input clk,
    input [9:0] A,
    input [9:0] B,
    //input LDR1B,
    //LDR1B is alwasy high because of delays to loading register one.
    //Register still holds correct value due to logic of the ckt.
    input LDR2B,
    input clr,
    input ST,
    input [2:0] DispB,
    input BTN1B_IN,
    input BTN2B_IN,
    input BTN3B_IN,
    output LivB,
    output OKB,
    output [9:0] B_Attack,
    output [7:0] seg,
    output [3:0] an,
    output BTN1B,
    output BTN2B,
    output BTN3B,
    output [9:0] Bleds // for testing
    );
    
    logic [9:0] t1, t2, t3, t4, t5, t6;
    logic t7, t8;
    
    //Decides if Register 0ne B is loading Ship positions or alive positions
    mux2_1 #10 mux1(.A(B), .B(t6), .SEL(ST), .an(t1));
    
    //This register saves the ship positions of player B
    Register #10 R1B(.clk(clk), .D(t1), .en(1), .clr(clr), .Q(t2));
    assign Bleds = t2;
    
    //This register saves the attack positions of player B
    Register #10 R2B(.clk(clk), .D(B), .en(LDR2B), .clr(clr), .Q(t4));
    
    //This register saves the previous attack positions of player A to feed into the input checker.
    logic [9:0] t_A = A;
    assign t7 = 1; //This wasn't being set when we disabled the input checker. R3B should always be enabled.
    Register #10 R3B(.clk(clk), .D(t_A), .en(t7), .clr(clr), .Q(t3));
    
    //The input checkers assures that player A only chose one new position to attack
    //InputChecker ICA(.A(t3), .B(A), .OK(t7));
    
    //locates all of the positions where player B has been hit.
    assign t5 = t2 & t3;
    //kills of all of the values where player B has been hit to push back to register 1B.
    assign t6 = t2 ^ t5;
    
    //Decides whether or not Player A is still alive
    Comparator #10 comp1(.A(t2), .B(10'b0000000000), .EQ(t8), .LT(), .GT());
    
    //Ouptuts game status to sseg for player A
    Words2 words2A(.clk(clk), .wordSelect(DispB), .seg(seg), .an(an));
    
    //assign LivB
    assign LivB = !t8;
    
    //assign OKB
    assign OKB = t7;
    
    //assign B_Attack
    assign B_Attack = t4;
    
    //assign BTN1B
    assign BTN1B = BTN1B_IN;
    
    //assign BTN2B
    assign BTN2B = BTN2B_IN;
    
    //assign BTN3B
    assign BTN3B = BTN3B_IN;
    
endmodule