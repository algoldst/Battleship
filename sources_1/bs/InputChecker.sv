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
    output OK
    );
    
    logic t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16;
    logic nott1,nott2,nott3,nott4,nott5,nott6,nott7,nott8,nott9,nott10,nott11,nott12,nott13,nott14,nott15,nott16;
    assign nott1 = ~t1;
    assign nott2 = ~t2;
    assign nott3 = ~t3;
    assign nott4 = ~t4;
    assign nott5 = ~t5;
    assign nott6 = ~t6;
    assign nott7 = ~t7;
    assign nott8 = ~t8;
    assign nott9 = ~t9;
    assign nott10 = ~t10;
    assign nott11 = ~t11;
    assign nott12 = ~t12;
    assign nott13 = ~t13;
    assign nott14 = ~t14;
    assign nott15 = ~t15;
    assign nott16 = ~t16;
    
    logic [3:0] t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, 
                t30, t31, t32, t33;
    
    Comparator #1 comp1(.A(A[0]), .B(B[0]), .EQ(t1), .LT(), .GT());
    Comparator #1 comp2(.A(A[1]), .B(B[1]), .EQ(t2), .LT(), .GT());
    Comparator #1 comp3(.A(A[2]), .B(B[2]), .EQ(t3), .LT(), .GT());
    Comparator #1 comp4(.A(A[3]), .B(B[3]), .EQ(t4), .LT(), .GT());
    Comparator #1 comp5(.A(A[4]), .B(B[4]), .EQ(t5), .LT(), .GT());
    Comparator #1 comp6(.A(A[5]), .B(B[5]), .EQ(t6), .LT(), .GT());
    Comparator #1 comp7(.A(A[6]), .B(B[6]), .EQ(t7), .LT(), .GT());
    Comparator #1 comp8(.A(A[7]), .B(B[7]), .EQ(t8), .LT(), .GT());
    Comparator #1 comp9(.A(A[8]), .B(B[8]), .EQ(t9), .LT(), .GT());
    Comparator #1 comp10(.A(A[9]), .B(B[9]), .EQ(t10), .LT(), .GT());
    Comparator #1 comp11(.A(A[10]), .B(B[10]), .EQ(t11), .LT(), .GT());
    Comparator #1 comp12(.A(A[11]), .B(B[11]), .EQ(t12), .LT(), .GT());
    Comparator #1 comp13(.A(A[12]), .B(B[12]), .EQ(t13), .LT(), .GT());
    Comparator #1 comp14(.A(A[13]), .B(B[13]), .EQ(t14), .LT(), .GT());
    Comparator #1 comp15(.A(A[14]), .B(B[14]), .EQ(t15), .LT(), .GT());
    Comparator #1 comp16(.A(A[15]), .B(B[15]), .EQ(t16), .LT(), .GT());
    
    RippleCarryAdder RCA1(.A({3'b0,nott1}), .B({3'b0,nott2}), .Sub('0), .S(t17), .Co());
    RippleCarryAdder RCA2(.A({3'b0,nott3}), .B({3'b0,nott4}), .Sub('0), .S(t18), .Co());
    RippleCarryAdder RCA3(.A({3'b0,nott5}), .B({3'b0,nott6}), .Sub('0), .S(t19), .Co());
    RippleCarryAdder RCA4(.A({3'b0,nott7}), .B({3'b0,nott8}), .Sub('0), .S(t20), .Co());
    RippleCarryAdder RCA5(.A({3'b0,nott9}), .B({3'b0,nott10}), .Sub('0), .S(t21), .Co());
    RippleCarryAdder RCA6(.A({3'b0,nott11}), .B({3'b0,nott12}), .Sub('0), .S(t22), .Co());
    RippleCarryAdder RCA7(.A({3'b0,nott13}), .B({3'b0,nott14}), .Sub('0), .S(t23), .Co());
    RippleCarryAdder RCA8(.A({3'b0,nott15}), .B({3'b0,nott16}), .Sub('0), .S(t24), .Co());
    
    RippleCarryAdder RCA9(.A(t17), .B(t18), .Sub('0),  .S(t25));
    RippleCarryAdder RCA10(.A(t19), .B(t20), .Sub('0),  .S(t26));
    RippleCarryAdder RCA11(.A(t21), .B(t22), .Sub('0), .S(t27));
    RippleCarryAdder RCA12(.A(t23), .B(t24), .Sub('0), .S(t28));
    
    RippleCarryAdder RCA13(.A(t25), .B(t26), .Sub('0), .S(t29));
    RippleCarryAdder RCA14(.A(t27), .B(t28), .Sub('0), .S(t30));
    
    RippleCarryAdder RCA15(.A(t29), .B(t30), .Sub('0), .S(t31));
    
    Comparator #4 comp17(.A(t31), .B(4'b0001), .EQ(OK), .LT(), .GT());
    
    
    endmodule
