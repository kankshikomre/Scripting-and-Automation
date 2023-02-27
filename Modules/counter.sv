`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2023 14:52:13
// Design Name: 
// Module Name: counter
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


module counter(clk, enable, dir, count);
  input logic clk,enable;
  output logic [2:0] dir;    //light color
  output logic [4:0]count;
  
  always@(posedge clk)
  begin
    if(enable)
      begin 
        if(count < 10)
          begin
            dir <= 3'b001;
            count <= count+1; // we won't be getting 1 at 0 because the count will also update at this time check the logic man 
          end
        else
          begin
            if(count < 15)
              begin
                count <= count+1;
                dir <= 3'b010;
              end
            else
              begin
                count <= 0;
                dir <= 3'b100;
              end
          end
       end
    else
      begin
        count <= 0;
        dir <= 3'b100; // red
      end
  end
endmodule

