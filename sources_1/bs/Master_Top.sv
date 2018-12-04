`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/20/2018 01:22:30 AM
// Design Name: 10 bit Top file for Master basys board(player A).
//////////////////////////////////////////////////////////////////////////////////


module Master_Top(
        input clk,
        input [9:0] A,
        input [9:0] B, //slave-->master
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
        output [9:0] A_Attack, //master-->slave, signal from t5 on LDR2A (look at fsm)
        output [7:0] seg,
        output [3:0] an,
        output ST,
        output [9:0] Aleds //for testing
        );
        
        //declare all of the interconnects
        logic t1, t2, t3, t4, t5, t12, t13;
        logic [2:0] t6;
        logic [9:0] t7, t8, t9, t10, t11;
        
        //controls the BTN1 input of the mux. dictates when ships are to be loaded in load_st
        assign t1 = BTN1A & BTN1B;
        //controls the clearing af the FSM and all of the registers.
        assign t2 = BTN3A & BTN3B;
        //locates all of the positions where player A has been hit.
        assign t10 = t8 & B;
        //kills of all of the values where player A has been hit to push back to register 1A.
        assign t11 = t8 ^ t10;
        
        
        BattleshipFSM FSM(.clk(clk), .BTN1(t1), .BTN2A(BTN2A), .BTN2B(BTN2B), .LivA(~t13), .LivB(LivB), .clr(t2), .OKA(t12), .OKB(OKB), .LDR1B(LDR1B), .LDR2B(LDR2B), .DispB(DispB), .ST(t3), .LDR1A(t4), .LDR2A(t5), .DispA(t6));
        
        //This register saves the ship positions of player A
        Register #10 R1A(.clk(clk), .D(t7), .en(1), .clr(t2), .Q(t8));
        assign Aleds = t8;
        
        //This register saves the attack positions of player A
        logic [9:0] t_A_Attack;
        Register #10 R2A(.clk(clk), .D(A), .en(t5), .clr(t2), .Q(t_A_Attack));
        assign A_Attack = t_A_Attack;
        
        //This register saves the previous attack positions of player B to feed into the input checker.
        Register #10 R3A(.clk(clk), .D(B), .en(t12), .clr(t2), .Q(t9));
        
        //This mux selects if you are loading in your original ship positions or if you are loading in the positions that are still alive
        mux2_1 #10 mux1(.A(A), .B(t11), .SEL(t3), .an(t7));
        
        //The input checkers assures that player B only chose one new position to attack
        //InputChecker ICA(.A(t9), .B(B), .OK(t12));
        
        //Decides whether or not Player A is still alive
        Comparator #10 comp1(.A(t8), .B(10'b0000000000), .EQ(t13), .LT(), .GT());
        
        //Ouptuts game status to sseg for player A
        Words2 words2A(.clk(clk), .wordSelect(t6), .seg(seg), .an(an));
        
        //assign CLR output
        assign clr = t2;
        
        //assign ST output
        assign ST = t3;
        
        //assign A_ships output
        //assign A_Ships = t8;
        
endmodule