`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/20/2018 12:43:37 AM
// Design Name: Comparator Module
// Module Name: Comparator

//////////////////////////////////////////////////////////////////////////////////


module Comparator #(parameter WIDTH=16)
    (input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    output logic EQ,
    output logic LT,
    output logic GT
    );
    
    always_comb
    begin
    if(A==B)
        begin
         EQ=1;
         LT=0;
        GT=0;
        end
    else if (A>B)
            begin
            EQ=0;
            LT=0;
            GT=1;
            end
            else if (A<B)
                begin
                EQ=0;
                LT=1;
                GT=0;
                end
                else
                    begin
                    EQ=0;
                    LT=0;
                    GT=0;
                    end
    end            
        
endmodule
