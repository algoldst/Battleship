`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Professor Benson editted by Darian Primer, Alex Goldstein
// Create Date: 10/31/2018 09:58:33 AM
// Description: Displays up to 8 words on the seven segment display
// wordSelect
//  0: load
//  1: play
//  2: wait
//  3: live
//  4: die
//  5: error
// To make your own words, note that the zero count represents the leftmost
// display and three represents the right most display
// Matches the constraints for Mealy's univ_sseg where the dp is seg[0]
//////////////////////////////////////////////////////////////////////////////////


module Words2(
    input clk,
    input [2:0] wordSelect,
    output logic [7:0] seg,
    output logic [3:0] an);
    
    logic sclk;
    logic [1:0] count = 0;
    
    clk_divder clkdiv2 (.clockin(clk), .clockout(sclk));
    
    parameter [2:0] wload=0, wplay=1, whalt=2, wlive=3, wdie=4, werror=5;
    
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
        wload: 
            case (count)
            0: seg <= 8'b10000101; //d
            1: seg <= 8'b00010001; //a
            2: seg <= 8'b00000011; //o
            3: seg <= 8'b11100011; //l
            default: seg <= 0;
            endcase
        wplay: 
            case (count)
            0: seg <= 8'b10011001; //y
            1: seg <= 8'b00010001; //a
            2: seg <= 8'b11100011; //l
            3: seg <= 8'b00110001; //p
            default: seg <= 0;
            endcase
        whalt:
            case(count)
            0: seg <= 8'b11100001; //t
            1: seg <= 8'b11100011; //l
            2: seg <= 8'b00010001; //a
            3: seg <= 8'b11010001; //h
            default: seg <= 0;
            endcase
        wlive:
            case(count)
            0: seg <= 8'b01100001; //e
            1: seg <= 8'b11000111; //v
            2: seg <= 8'b11011111; //i
            3: seg <= 8'b11100011; //l
            default: seg <= 0;
            endcase
        wdie:
            case(count)
            0: seg <= 8'b10000101; //d
            1: seg <= 8'b00010001; //a
            2: seg <= 8'b01100001; //e
            3: seg <= 8'b10000101; //d
            default: seg <= 0;
            endcase
        werror:        
            case (count)
            0: seg <= 8'b11110101; //r
            1: seg <= 8'b11110101; //r
            2: seg <= 8'b01100001; //e
            3: seg <= 8'b11111111; //
            default: seg <= 0;
            endcase
        default:
            seg <= 8'b11111101;
      endcase
    end 
endmodule

