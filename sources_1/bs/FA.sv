`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Plly Slo CPE 133
// Engineer: Darian Primer
// 
// Create Date: 10/02/2018 10:03:51 AM
// Description: Full Adder

//////////////////////////////////////////////////////////////////////////////////


module FA(
    input A,
    input B,
    input Ci,
    output S,
    output Co
    );
    
    assign S = A^B^Ci;
    assign Co = (A&Ci) + (A&B) + (B&Ci);
endmodule
