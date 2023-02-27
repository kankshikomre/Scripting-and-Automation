`timescale 1ns / 1ps

module top_Q4_Mealy(clk,rst,inp,out);
input clk,rst,inp;                      //inputs
output reg out;                         //output

//declaration of state parameters
parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;   
reg [1:0] PS,NS;                        //NS = Next State, PS = Present State

//if reset is on [rst =1]
always @ (posedge clk or posedge rst)
  if (rst)
    PS <= S0;  
  else
    PS <= NS;
       
//output for every state. if PS is S3, output is 1. For rest, 0.
  always @ (posedge clk or posedge rst)
  if (rst)
    out <= 1'b0;
  else
    out <= (PS == S3) && inp;
   
//declaring next state for every present state and input
  always @ (*)
    begin
      case(PS)
           S0 : NS = inp ? S0 : S1 ;
           S1 : NS = inp ? S0 : S2 ;
           S2 : NS = inp ? S3 : S2 ;
           S3 : NS = inp ? S0 : S1 ;
      endcase
    end
      
 endmodule
