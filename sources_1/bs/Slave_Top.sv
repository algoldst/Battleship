`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/20/2018 01:22:30 AM
// Design Name: Top file for Master basys board(player A).
//////////////////////////////////////////////////////////////////////////////////


module Slave_Top(
    input clk,
    input [15:0] A,
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
    output [15:0] B_Attack,
    output [7:0] seg,
    output [3:0] an,
    output BTN1B,
    output BTN2B,
    output BTN3B
    );
    
    logic [15:0] t1, t2, t3, t4, t5, t6;
    logic t7, t8;
    
    //Decides if Register 0ne B is loading Ship positions or alive positions
    mux2_1 #16 mux1(.A(B), .B(t6), .SEL(ST), .an(t1));
    
    //This register saves the ship positions of player B
    Register #16 R1B(.clk(clk), .D(t1), .en(LDR1B), .clr(clr), .Q(t2));
    
    //This register saves the attack positions of player B
    Register #16 R2B(.clk(clk), .D(B), .en(LDR2B), .clr(clr), .Q(t4));
    
    //This register saves the previous attack positions of player A to feed into the input checker.
    Register #16 R3B(.clk(clk), .D(A), .en(t7), .clr(clr), .Q(t3));
    
    //The input checkers assures that player A only chose one new position to attack
    InputChecker ICA(.A(t3), .B(A), .OK(t7));
    
    //locates all of the positions where player B has been hit.
    assign t5 = t2 & t3;
    //kills of all of the values where player B has been hit to push back to register 1B.
    assign t6 = t2 ^ t5;
    
    //Decides whether or not Player A is still alive
    Comparator #16 comp1(.A(t2), .B(16'b0000000000000000), .EQ(t8), .LT(), .GT());
    
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