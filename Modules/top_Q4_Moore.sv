`timescale 1ns / 1ps

module top_Q4_Moore(clk,rst,inp,out);
input clk,rst,inp;                      //inputs
output reg out;                         //outputs

//declaring state parameters
parameter S0 = 3'b000;                  
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
reg [2:0] PS, NS;               //PS is Present State, NS is Next State

//case if rst = 1
always@(posedge clk , posedge rst) begin    
    if(rst == 1)
        PS <= S0;
    else
        PS <= NS;
  end
  
  //next state assignment for every PS and input
  always@(PS , inp) begin             
    case(PS)
        S0 : begin 
        if(inp == 1'b0)  
          //if inp = 0       
          NS <= S1;
        else
          //if inp = 1
          NS <= S0;
      end
      S1 : begin
        if(inp == 1'b0)
          NS <= S2;
        else
          NS <= S0;
      end
      S2 : begin
        if(inp == 1'b0)
          NS <= S2;
        else
          NS <= S3;
      end
      S3 : begin
        if(inp == 1'b0)
          NS <= S1;
        else 
          NS <= S4;
      end
      S4 : begin
        if(inp == 1'b0)
          NS <= S1;
        else
          NS <= S0;
      end
      default : NS <= S0;        //declaring default next stage 
    endcase
  end
  
  //output for each state
  always@(PS) begin
    case(PS)
    S0 : out <= 0;
    S1 : out <= 0;
    S2 : out <= 0;
    S3 : out <= 0;
    S4 : out <= 1;
    default : out <= 0;             //default output
    endcase
  end
endmodule
