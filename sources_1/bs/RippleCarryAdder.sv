`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 10/05/2018 08:14:18 PM
// Description: Ripple Carry Adder

//////////////////////////////////////////////////////////////////////////////////


module RippleCarryAdder(
    input [3:0] A,
    input [3:0] B,
    input Sub,
    output [3:0] S,
    output Co
    );
    logic [1:0] t1, t2, t3;
    
    FA FA4(.A(A[0]), .B(B[0]), .Ci(Sub), .S(S[0]), .Co(t1));
    FA FA1(.A(A[1]), .B(B[1]), .Ci(t1), .S(S[1]), .Co(t2));
    FA FA2(.A(A[2]), .B(B[2]), .Ci(t2), .S(S[2]), .Co(t3));
    FA FA3(.A(A[3]), .B(B[3]), .Ci(t3), .S(S[3]), .Co(Co));
      
endmodule
