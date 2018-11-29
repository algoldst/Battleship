`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/26/2018 10:08:22 PM
// Description: This FSM decides the state for a basys board battleship game. 
//              It controls all of the registers and the pace of the game.
//
//////////////////////////////////////////////////////////////////////////////////


module BattleshipFSM(
    input clk,
    input BTN1,
    input BTN2A,
    input BTN2B,
    input LivA,
    input LivB,
    input clr,
    input OKA,
    input OKB,
    output logic LDR1B,
    output logic LDR2B,
    output logic [2:0] DispB,
    output logic ST,
    output logic LDR1A,
    output logic LDR2A,
    output logic DispA
    );
    
    logic [3:0] NS;
    logic [3:0] PS = load_st; //Present State
    
    parameter [3:0] load_st=0, playerA_LD=1, playerA_Attack=2, Redo_playerA=3,
                               playerB_LD=4, playerB_Attack=5, Redo_playerB=6,
                    playerA_win=7, playerB_win=8;
                    
     always_ff @ (posedge clk, posedge clr)
                          begin
                              PS <= NS;
                              if (clr==1)
                                PS=load_st;
                          end
     
     
     always_comb
     begin
     
     //initialize outputs to zero
     LDR1A=0; LDR1B=0; LDR2A=0; LDR2B=0; DispA=0; DispB=0; ST=0; 
     
     //list what happens in each of the states
     //if CLR goes high, moves back to load state
     case(PS)
     
            load_st:
                begin
                //Reset values if coming from other state.
                LDR2A=0; LDR2B=0; ST=0; 
                //this is where the players input their ship positions.
                //moves out of this state when both players press BTN1
                LDR1A=1;
                LDR1B=1;
                ST=1;
                DispA=0;
                DispB=0;
                if (BTN1==1)
                    NS=playerA_LD;
                else
                    NS=load_st;
                end    
            
            playerA_LD:
                begin
                //this is where player A inputs where they want to attack
                //moves out of this state when player A presses BTN2
                DispA=1;
                DispB=2;
                if (BTN2A==1)
                    NS=playerA_Attack;
                else
                    NS=playerA_LD;
                end
                
            playerA_Attack:
                begin
                //this is where attack positions are loaded into player B's registers
                //and the validity of the entry is checked.
                //Game either moves on to player B, or Player A must redo their turn.
                //Moves out of this state depending on output of the input checker.
                LDR2A=1;
                LDR1B=1;
                if (OKA==1)
                    NS=playerB_LD;
                else
                    NS=Redo_playerA;
                end                    
            
            Redo_playerA:
                begin
                //this forces player A to redo their turn because they did not change
                //only one attack position.
                //quickly displays error on player A's board, then waits for new entry.
                DispA=5;
                DispB=2;
                NS=playerA_LD;
                end
            
            playerB_LD:
                begin
                //this is where player B inputs where they want to attack
                //moves out of this state when player B presses BTN2
                DispA=2;
                DispB=1;
                if (BTN2B==1)
                    NS=playerB_Attack;
                else
                    NS=playerB_LD;
                end 
                
               playerB_Attack:
                    begin
                    //this is where attack positions are loaded into player A's registers
                    //and the validity of the entry is checked.
                    //Game either moves on to player A, or Player B must redo their turn.
                    //Moves out of this state depending on output of the input checker.
                    LDR2B=1;
                    LDR1A=1;
                    if (OKB==1)
                        NS=playerA_LD;
                    else
                        NS=Redo_playerB;
                    end                    
                
                Redo_playerB:
                    begin
                    //this forces player B to redo their turn because they did not change
                    //only one attack position.
                    //quickly displays error on player B's board, then waits for new entry.
                    DispA=2;
                    DispB=5;
                    NS=playerB_LD;
                    end
                    
     endcase               
     end                                                      
endmodule
