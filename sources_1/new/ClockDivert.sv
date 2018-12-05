`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2018 05:44:55 PM
// Design Name: Clock Divert
// Module Name: ClockDivert
// Project Name: Battleship
// Target Devices: UART
// Tool Versions: 
// Description: For diverting the clock from the battleship game, long enough for the UART to receive data.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ClockDivert #(parameter cyclesDiv)( //cycles to divert
    input clk, divertSig, //signal that the UART receives, this signals the start of incoming data
    output logic divClk
    );

logic cycles = 0; //counter for # of cycles since divertSig went high
//logic clkOn = 1;
always_ff @(posedge clk)
    begin
    if(!divertSig && cycles == 0) divClk = ~divClk;
    else
        begin
        divClk = 0;
        cycles++;
        end
    if(cycles == cyclesDiv*2) cycles = 0;
    end
/*
begin
    if(cycles == cyclesDiv) cycles = 0; 
    if(divertSig || cycles != 0) cycles++;
end

always_comb
begin
    if(!divertSig && cycles == 0) divClk = clk;
    else divClk = 0;
end
*/
    
endmodule
