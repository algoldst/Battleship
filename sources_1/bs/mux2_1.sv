`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 10/11/2018 09:38:37 AM
// Description: 2 input mux
//////////////////////////////////////////////////////////////////////////////////


module mux2_1 #(parameter WIDTH = 4)
    (input [WIDTH-1:0] A, B,
    input SEL,
    output [WIDTH - 1:0] an
    );
    
    
    assign an = (SEL ? A : B);
endmodule
