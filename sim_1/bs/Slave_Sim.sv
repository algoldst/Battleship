`timescale 1ns / 1ps

/* File: Master_Sim.sv
 * Init: 
 * Author: Darian Primer
 * Description: Simulates Master board without UART.
 */

module Slave_Sim(
    );

// Instantiate Module
Slave_Top Slave_Sim(.*);

logic clk;
logic [15:0] A;
logic [15:0] B;
logic LDR1B;
logic LDR2B;
logic clr;
logic ST;
logic DispB;
logic BTN1B_IN;
logic BTN2B_IN;
logic BTN3B_IN;
logic LivB;
logic OKB;
logic [15:0] B_Attack;
logic [7:0] seg;
logic [3:0] an;
logic BTN1B;
logic BTN2B;
logic BTN3B;

// Simulate clk
always
    begin
    clk=1; #5; //clk period = 10ns
    clk=0; #5;
end

//simulate
initial
    begin
	
	#10
	//Set ship positions for player B
	//FSM State: load_st
	B=16'b 0011000011100110; ST=1; //LDR1B=1;
	A=16'b 1110011000000110; LDR2B=0; DispB=0;
	clr=1;
    
    #10
	//Set ship positions for player B
	//FSM State: load_st
	B=16'b 0011000011100110; ST=1; //LDR1B=1;
	A=16'b 1110011000000110; LDR2B=0; DispB=0;
	clr=0;
	
//ROUND1
	
	#10
	//Ship positions for player B saved.
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//FSM State: playerA_Attack
	B=16'b 0011000011100110; ST=0; //LDR1B=1;
	A=16'b 0010000000000000; LDR2B=0; DispB=0;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 0010000000000000; ST=0; //LDR1B=1;
	A=16'b 0010000000000000; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 0010000000000000; ST=0; //LDR1B=1;
	A=16'b 0010000000000000; LDR2B=1; DispB=1;
	clr=0;
	
//ROUND2
	
	#10
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//FSM State: playerA_Attack
	B=16'b 0010000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000000000000; LDR2B=0; DispB=0;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 0110000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000000000000; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 0110000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000000000000; LDR2B=1; DispB=1;
	clr=0;
	
//ROUND3	
	
	#10
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//FSM State: playerA_Attack
	B=16'b 0110000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000000000100; LDR2B=0; DispB=0;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 1110000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000000000100; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 1110000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000000000100; LDR2B=1; DispB=1;
	clr=0;
	
//ROUND4	
	
	#10
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//FSM State: playerA_Attack
	B=16'b 1110000000000000; ST=0; //LDR1B=1;
	A=16'b 0011000010000100; LDR2B=0; DispB=0;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 1110010000000000; ST=0; //LDR1B=1;
	A=16'b 0011000010000100; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 1110010000000000; ST=0; //LDR1B=1;
	A=16'b 0011000010000100; LDR2B=1; DispB=1;
	clr=0;
	
//ROUND5	
	
	#10
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//FSM State: playerA_Attack
	B=16'b 1110010000000000; ST=0; //LDR1B=1;
	A=16'b 0011000011000100; LDR2B=0; DispB=0;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 1110011000000000; ST=0; //LDR1B=1;
	A=16'b 0011000011000100; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 1110011000000000; ST=0; //LDR1B=1;
	A=16'b 0011000011000100; LDR2B=1; DispB=1;
	clr=0;
	
//ROUND6	
	
	#10
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//FSM State: playerA_Attack
	B=16'b 1110011000000000; ST=0; //LDR1B=1;
	A=16'b 0011000011000110; LDR2B=0; DispB=0;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 1110011000000010; ST=0; //LDR1B=1;
	A=16'b 0011000011000110; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 1110011000000010; ST=0; //LDR1B=1;
	A=16'b 0011000011000110; LDR2B=1; DispB=1;
	clr=0;

//ROUND7	
	
	#10
	//Player A has chosen attack positions and sent those positions to player B.
	//Player B has recieved the attack positions and needs to check that only on position has been changed.
	//Modifies register 1 value to positions still alive.
	//Player B is dead. LivB=0
	//FSM State: playerA_Attack
	B=16'b 1110011000000010; ST=0; //LDR1B=1;
	A=16'b 0011000011100110; LDR2B=0; DispB=4;
	clr=0;
	
	#10
	//Player B selects attack positions.
	//FSM State: playerB_LD
	B=16'b 1110011000000010; ST=0; //LDR1B=1;
	A=16'b 0011000011100110; LDR2B=0; DispB=1;
	clr=0;
	
	#10
	//Player B loads attack positions.
	//FSM State: playerB_Attack
	B=16'b 1110011000000010; ST=0; //LDR1B=1;
	A=16'b 0011000011100110; LDR2B=1; DispB=1;
	clr=0;
	

    end
endmodule
