`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/20/2018 01:22:30 AM
// Design Name: Checking that there is only a one bit defference between the two inputs.

//////////////////////////////////////////////////////////////////////////////////


module InputChecker(
    input [15:0] A, B,
    input clk,
    output [15:0] OK
    );
    
    logic t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16;
    logic [3:0] t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, 
                t30, t31, t32, t33;
    
    Comparator #1 comp1(.A(A[0]), .B(B[0]), .EQ(~t1), .LT(), .GT());
    Comparator #1 comp2(.A(A[1]), .B(B[1]), .EQ(~t2), .LT(), .GT());
    Comparator #1 comp3(.A(A[2]), .B(B[2]), .EQ(~t3), .LT(), .GT());
    Comparator #1 comp4(.A(A[3]), .B(B[3]), .EQ(~t4), .LT(), .GT());
    Comparator #1 comp5(.A(A[4]), .B(B[4]), .EQ(~t4), .LT(), .GT());
    Comparator #1 comp6(.A(A[5]), .B(B[5]), .EQ(~t6), .LT(), .GT());
    Comparator #1 comp7(.A(A[6]), .B(B[6]), .EQ(~t7), .LT(), .GT());
    Comparator #1 comp8(.A(A[7]), .B(B[7]), .EQ(~t8), .LT(), .GT());
    Comparator #1 comp9(.A(A[8]), .B(B[8]), .EQ(~t9), .LT(), .GT());
    Comparator #1 comp10(.A(A[9]), .B(B[9]), .EQ(~t10), .LT(), .GT());
    Comparator #1 comp11(.A(A[10]), .B(B[10]), .EQ(~t11), .LT(), .GT());
    Comparator #1 comp12(.A(A[11]), .B(B[11]), .EQ(~t12), .LT(), .GT());
    Comparator #1 comp13(.A(A[12]), .B(B[12]), .EQ(~t13), .LT(), .GT());
    Comparator #1 comp14(.A(A[13]), .B(B[13]), .EQ(~t14), .LT(), .GT());
    Comparator #1 comp15(.A(A[14]), .B(B[14]), .EQ(~t15), .LT(), .GT());
    Comparator #1 comp16(.A(A[15]), .B(B[15]), .EQ(~t16), .LT(), .GT());
    
    RippleCarryAdder RCA1(.A(t1), .B(t2), .S(t17), .Co());
    RippleCarryAdder RCA2(.A(t3), .B(t4), .S(t18), .Co());
    RippleCarryAdder RCA3(.A(t5), .B(t6), .S(t19), .Co());
    RippleCarryAdder RCA4(.A(t7), .B(t8), .S(t20), .Co());
    RippleCarryAdder RCA5(.A(t9), .B(t10), .S(t21), .Co());
    RippleCarryAdder RCA6(.A(t11), .B(t12), .S(t22), .Co());
    RippleCarryAdder RCA7(.A(t13), .B(t14), .S(t23), .Co());
    RippleCarryAdder RCA8(.A(t15), .B(t16), .S(t24), .Co());
    
    RippleCarryAdder RCA9(.A(t17), .B(t18), .S(t25));
    RippleCarryAdder RCA10(.A(t19), .B(t20), .S(t26));
    RippleCarryAdder RCA11(.A(t21), .B(t22), .S(t27));
    RippleCarryAdder RCA12(.A(t23), .B(t24), .S(t28));
    
    RippleCarryAdder RCA13(.A(t25), .B(t26), .S(t29));
    RippleCarryAdder RCA14(.A(t27), .B(t28), .S(t30));
    
    RippleCarryAdder RCA15(.A(t29), .B(t30), .S(t31));
    
    Comparator #4 comp17(.A(t31), .B(4'b0001), .EQ(OK), .LT(), .GT());
    
    
    endmodule
