`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2023 17:17:40
// Design Name: 
// Module Name: top_traffic_controller
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

module top_traffic_controller(clk, slowed_clk, reset, north_dir, south_dir, east_dir, west_dir);
  input logic clk,reset;
  output logic slowed_clk; // clock with timeperiod of 1s
  output logic  [2:0]north_dir, south_dir, east_dir, west_dir;
  logic enable_n,enable_s,enable_e,enable_w;
  logic [4:0] count1,count2,count3,count4;
  
  frequency_div div(.clk(clk),.slowed_clk(slowed_clk),.reset(reset)); // slowing down the clock
  traffic_controller traffic_light_controller(.clk(slowed_clk), .reset(reset), .north_dir(north_dir), .south_dir(south_dir), .east_dir(east_dir), .west_dir(west_dir), .enable_n(enable_n), .enable_s(enable_s), .enable_e(enable_e), .enable_w(enable_w), .count1(count1), .count2(count2), .count3(count3), .count4(count4));
  
endmodule

