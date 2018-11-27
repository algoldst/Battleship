`timescale 1ns / 1ps

/* File: Sim_InputChecker.sv
 * Init: 11/27/2018 09:50:00 AM
 * Author: Alex Goldstein
 * Description: Simulates input checker for player's turn.
 */

module Sim_InputChecker(
    );

// Instantiate Module
InputChecker sim_inputchecker(.*);
logic clk;
logic [15:0] A; //A=old state of switches
logic [15:0] B; //B=new state of switches
logic OK;

// Simulate clk
always
    begin
    clk=1; #5; //clk period = 10ns
    clk=0; #5;
    end

// Simulate
initial
    begin
    #10;
    A=16'd7; B=16'd6;
    #10; // OK -> 1
    
    A=16'd6; B=16'd4;
    #10; // OK -> 1
    
    A=16'd4; B=16'd7;
    #10; // OK -> 0
    
    
    
    end
endmodule
