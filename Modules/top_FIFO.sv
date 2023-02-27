`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2023 19:40:15
// Design Name: 
// Module Name: FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_FIFO(clk, reset, WE, D_IN, RE, D_OUT, EMPTY, FULL, HALF_FULL, RP, WP);
  parameter M = 32; // M words
  parameter N = 16; // N bits
  input bit clk;
  input logic reset;
  input logic WE;
  input logic [N-1:0]D_IN;
  input logic RE;
  output logic [N-1:0]D_OUT;
  output bit EMPTY;
  output bit FULL;
  output bit HALF_FULL;
  logic [N-1:0]qu[M-1:0]; 
  output logic [$clog2(M)-1:0]RP; // read pointer
  output logic [$clog2(M)-1:0]WP; // write pointer
  
  always_ff @(posedge clk or negedge reset) begin
  
  if(!reset) // active low reset, initialize the RP and WP 
  begin
  RP = 0;
  WP = 0;
  end
  
  else
  begin  
  
  if(!FULL && WE) // write condition
  begin
  qu[WP] = D_IN;
  WP = WP+1;
  end
  else 
  begin
  WP = WP;
  end
  
  if(!EMPTY && RE) // read condition
  begin
  D_OUT = qu[RP];
  RP = RP+1;
  end
  else
  begin
  D_OUT = 8'bz;
  RP = RP;
  end
  
  end // end of else reset block

  end // end of always block
  
  always_comb begin
  if(WP == RP + M-1) // let's suppose RP(0th index) is the starting point of an array and M-1th index is the last word's index which can be there in the array or vector or queue. So, the FIFO would be full.
  begin
  FULL = 1;
  end
  else
  begin
  FULL = 0;
  end
  
  if(WP == RP + M/2 -1) // condition for half full
  begin
  HALF_FULL = 1;
  end
  else
  begin
  HALF_FULL = 0;
  end
  
  if(WP == RP) // condition for empty
  begin
  EMPTY = 1;
  end
  else
  begin
  EMPTY = 0;
  end
  end
  
endmodule
