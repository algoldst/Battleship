`timescale 1ns / 1ps

/* File: Sim_Slave_Top.sv
 * Init: 11/27/2018 08:44:23 PM
 * Author: Alex Goldstein
 * Description: Simulates Master board to test Slave_Top.
 */

module Sim_Slave_Top(
    );

// Instantiate Module
Slave_Top sim_slavetop(.*);
logic clk; //inputs
logic [15:0] A, B;
logic LDR1B,LDR2B;
logic clr, ST, DispB;
logic BTN1B_IN, BTN2B_IN, BTN3B_IN;
logic LivB, OKB; //outputs
logic [15:0] B_Attack;
logic [7:0] seg;
logic [3:0] an;
logic BTN1B, BTN2B, BTN3B;

// Simulate clk
always
    begin
    clk=1; #5; //clk period = 10ns
    clk=0; #5;
    end

// Simulate
initial
    begin
    
    end
endmodule
