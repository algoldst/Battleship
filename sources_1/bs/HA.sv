`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Slo CPE 133
// Engineer: Darian Primer
// 
// Create Date: 10/02/2018 09:41:13 AM 
// Description: Half Adder

//////////////////////////////////////////////////////////////////////////////////


module HA(
    input A,
    input B,
    output S,
    output Co
    );
    
    assign S = A^B;
    assign Co = A&B;
    
endmodule
