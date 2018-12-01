`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 10/25/2018 09:19:27 AM

//////////////////////////////////////////////////////////////////////////////////


module Register #(parameter WIDTH = 4)
    (input clk,
    input en,
    input clr,
    input [WIDTH-1:0] D,
    output logic [WIDTH-1:0] Q
    );
    
    always_ff @ (posedge clk, negedge clr)
    begin
        if(clr)
            Q<=0;
        else if(en)
            Q<=D;
    end
    
endmodule
