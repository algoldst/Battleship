`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO CPE 133
// Engineer: Darian Primer
// 
// Create Date: 11/08/2018 10:54:09 AM
// Description: FSM module for demo mode

//////////////////////////////////////////////////////////////////////////////////


module DemoFSM(
    input clk,
    input demo,
    output logic d_clr,
    output logic d_en,
    output logic d_sub,
    output logic d_RC,
    output logic [2:0] word_sel,
    output logic disp_sel
    );
    
     logic [3:0] NS;
     logic [3:0] PS = CLR; //Present State
       
       parameter [3:0] CLR = 0, S_AddRC = 1, AddRC = 2,  S_SubRC= 3, SubRC = 4, S_Add = 5, Add = 6, S_Sub = 7, Sub = 8;
     
       always_ff @ (posedge clk)
       begin
           PS <= NS;
       end
       
       always_comb
       begin
       
       //Initialize outputs to zero
       d_clr=0; d_en=0; d_sub=0; d_RC=0; word_sel=0; disp_sel=0;
       
       case(PS)
       
            CLR:
                begin
                d_clr=1;
                d_en=0;
                d_sub=0;
                d_RC=0;
                word_sel=0;
                disp_sel=0;
                if(demo == 1)
                    NS=S_AddRC;
                else
                    NS=CLR;
                end    
                
            S_AddRC:
                begin
                d_clr=0;
                d_en=1;
                d_sub=0;
                d_RC=1;
                word_sel=0;
                disp_sel=1;
                if(demo == 1)
                    NS=AddRC;
                else
                    NS=CLR;    
                end
                
            AddRC:
                begin
                d_clr=0;
                d_en=1;
                d_sub=0;
                d_RC=1;
                word_sel=0;
                disp_sel=0;
                if(demo == 1)
                    NS=S_SubRC;
                else
                    NS=CLR;    
                end
            
            S_SubRC:
                begin
                d_clr=0;
                d_en=1;
                d_sub=1;
                d_RC=1;
                word_sel=1;
                disp_sel=1;
                if(demo == 1)
                    NS=SubRC;
                else
                    NS=CLR;    
                end
                
            SubRC:
                begin
                d_clr=0;
                d_en=1;
                d_sub=1;
                d_RC=1;
                word_sel=0;
                disp_sel=0;
                if(demo == 1)
                    NS=S_Add;
                else
                    NS=CLR;    
                end
            
            S_Add:
                begin
                d_clr=0;
                d_en=1;
                d_sub=0;
                d_RC=0;
                word_sel=2;
                disp_sel=1;
                if(demo == 1)
                    NS=Add;
                else
                    NS=CLR;    
                end
                
            Add:
                begin
                d_clr=0;
                d_en=1;
                d_sub=0;
                d_RC=0;
                word_sel=0;
                disp_sel=0;
                if(demo == 1)
                    NS=S_Sub;
                else
                    NS=CLR;    
                end
                
            S_Sub:
                begin
                d_clr=0;
                d_en=1;
                d_sub=1;
                d_RC=0;
                word_sel=3;
                disp_sel=1;
                if(demo == 1)
                    NS = Sub;
                else
                    NS=CLR;    
                end
                
            Sub:
                begin
                d_clr=0;
                d_en=1;
                d_sub=1;
                d_RC=0;
                word_sel=0;
                disp_sel=0;
                    NS=CLR;    
                end
                                
            default:
                NS=CLR;    
       endcase
       end
         
endmodule
