`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Professor Benson editted by Darian Primer
// Create Date: 10/31/2018 09:58:33 AM
// Description: Displays up to 8 words on the seven segment display
// wordSelect
//  0: Play
//  1: Live
//  2: Dead
// To make your own words, note that the zero count represents the leftmost
// display and three represents the right most display
// Matches the constraints for Mealy's univ_sseg where the dp is seg[0]
//////////////////////////////////////////////////////////////////////////////////


module Words2(
    input clk,
    input [1:0] wordSelect,
    output logic [7:0] seg,
    output logic [3:0] an);
    
    logic sclk;
    logic [1:0] count = 0;
    
    clk_divder clkdiv2 (.clockin(clk), .clockout(sclk));
    
    always_ff @(posedge sclk)
    begin
        count = count + 1;
    end
    
    //rotate through the four displays
    always_comb
    begin
        case (count)
            0: an = 4'b1110;
            1: an = 4'b1101;
            2: an = 4'b1011;
            3: an = 4'b0111;
            default: an = 0;
        endcase
    end
    
    //choose the word to display
    always_comb
    begin
        case (wordSelect)
        0: 
            case (count)
            0: seg <= 8'b00011001;
            1: seg <= 8'b10001111;
            2: seg <= 8'b00010001;
            3: seg <= 8'b11100101;
            default: seg <= 0;
            endcase
        1: 
            case (count)
            0: seg <= 8'b01000011;
            1: seg <= 8'b00001101;
            2: seg <= 8'b00010001;
            3: seg <= 8'b01000011;
            default: seg <= 0;
            endcase
        2:
            case(count)
            0: seg <= 8'b10001111;
            1: seg <= 8'b01100001;
            2: seg <= 8'b10000011;
            3: seg <= 8'b00001101;
            default: seg <= 0;
            endcase
          
        default :        
            case (count)
            0: seg <= 8'b11111111;
            1: seg <= 8'b11111111;
            2: seg <= 8'b11111111;
            3: seg <= 8'b11111111;
            default: seg <= 0;
            endcase
      endcase
    end 
endmodule

