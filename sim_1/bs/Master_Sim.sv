`timescale 1ns / 1ps

/* File: Master_Sim.sv
 * Init: 
 * Author: Darian Primer
 * Description: Simulates Master board without UART.
 */

module Master_Sim(
    );

// Instantiate Module
Master_Top Master_Sim(.*);

logic clk;
logic [15:0] A;
logic [15:0] B;
logic BTN1A;
logic BTN1B;
logic BTN2A;
logic BTN2B;
logic LivB;
logic BTN3A;
logic BTN3B;
logic OKB;
logic LDR1B;
logic LDR2B;
logic [2:0] DispB;
logic clr;
logic [15:0] A_Attack;
logic [7:0] seg;
logic [3:0] an;
logic ST;

// Simulate clk
always
    begin
    clk=1; #5; //clk period = 10ns
    clk=0; #5;
    end

// Simulate
initial
    begin
	
	//CLR is high. All registers cleared. FSM State: load_st
    #10;
    A=16'b 1110011000000110; B=16'b 0011000011100110;
    BTN1A=1; BTN1B=1; BTN2A=0; BTN2B=0; BTN3A=1; BTN3B=1;
    LivB=1; OKB=0;
    #10;
    
	//Players load ship positions. FSM State: load_st
    A=16'b 1110011000000110; B=16'b 0011000011100110;
    BTN1A=1; BTN1B=1; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
    LivB=1; OKB=1;
    #10;
    
	//Player A selects where to attack. FSM state: playerA_LD
    A=16'b 1000000000000000; B=16'b 0000000000000000;
    BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
    LivB=1; OKB=1;
    #10;
    
	//Player A attack position pushed to slave board. FSM State: PlayerA_Attack
		//Player A only changed one bit so OKA=1. Game moves on to Player B.
    A=16'b 1000000000000000; B=16'b 0000000000000000;
    BTN1A=0; BTN1B=0; BTN2A=1; BTN2B=0; BTN3A=0; BTN3B=0; 
    LivB=1; OKB=1;
    #10;
	
	//Player B is notified that they can play. FSM State: playerB_LD
	A=16'b 1000000000000000; B=16'b 0000000000000000;
    BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
    LivB=1; OKB=1;
    #10;
	
	
	//Player B selects where to attack. FSM State: playerB_LD
	A=16'b 1000000000000000; B=16'b 0010000000000000;
    BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=1; BTN3A=0; BTN3B=0; 
    LivB=1; OKB=1;
    #10;
	
	//Player B attack position pushed to slave board. FSM State: PlayerB_Attack
		//Player B only changed one bit so OKB=1. Game moves on to Player A.
	A=16'b 1000000000000000; B=16'b 0010000000000000;
    BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
    LivB=1; OKB=1;
    #10;
			//Player A selects where to attack. FSM state: playerA_LD
			A=16'b 1100000000000000; B=16'b 0000000000000000;
			BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
			LivB=1; OKB=1;
			#10;
			
			//Player A attack position pushed to slave board. FSM State: PlayerA_Attack
				//Player A only changed one bit so OKA=1. Game moves on to Player B.
			A=16'b 1000000000000000; B=16'b 0000000000000000;
			BTN1A=0; BTN1B=0; BTN2A=1; BTN2B=0; BTN3A=0; BTN3B=0; 
			LivB=1; OKB=1;
			#10;
			
			//Player B is notified that they can play. FSM State: playerB_LD
			A=16'b 1000000000000000; B=16'b 0000000000000000;
			BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
			LivB=1; OKB=1;
			#10;
			
			//Player B selects where to attack. FSM State: playerB_LD
			A=16'b 1000000000000000; B=16'b 0011000000000000;
			BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=1; BTN3A=0; BTN3B=0; 
			LivB=1; OKB=1;
			#10;
			
			//Player B attack position pushed to slave board. FSM State: PlayerB_Attack
				//Player B only changed one bit so OKB=1. Game moves on to Player A.
			A=16'b 1000000000000000; B=16'b 0011000000000000;
			BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
			LivB=1; OKB=1;
			#10;
					
					//Player A selects where to attack. FSM state: playerA_LD
					A=16'b 1100000000000000; B=16'b 0000000000000000;
					BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
					LivB=1; OKB=1;
					#10;
				
					//Player A attack position pushed to slave board. FSM State: PlayerA_Attack
						//Player A only changed one bit so OKA=1. Game moves on to Player B.
					A=16'b 1000000000000000; B=16'b 0000000000000000;
					BTN1A=0; BTN1B=0; BTN2A=1; BTN2B=0; BTN3A=0; BTN3B=0; 
					LivB=1; OKB=1;
					#10;
					
					//Player B is notified that they can play. FSM State: playerB_LD
					A=16'b 1000000000000000; B=16'b 0000000000000000;
					BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
					LivB=1; OKB=1;
					#10;
					
					//Player B selects where to attack. FSM State: playerB_LD
					A=16'b 1000000000000000; B=16'b 0011000000000000;
					BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=1; BTN3A=0; BTN3B=0; 
					LivB=1; OKB=1;
					#10;
					
					//Player B attack position pushed to slave board. FSM State: PlayerB_Attack
						//Player B only changed one bit so OKB=1. Game moves on to Player A.
					A=16'b 1000000000000000; B=16'b 0011000000000000;
					BTN1A=0; BTN1B=0; BTN2A=0; BTN2B=0; BTN3A=0; BTN3B=0; 
					LivB=1; OKB=1;
					#10;
	
	
    
    end
endmodule
