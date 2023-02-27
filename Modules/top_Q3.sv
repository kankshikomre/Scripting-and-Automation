`timescale 1ns / 1ps

module top_Q3(a,en,y);
input [7:0] a;          //inputs
input en;
output reg [2:0] y;     //output

always @(a,en)          //a and en to be declared for every test case
begin

casex(a)                    //description of all cases
8'b00000001: y = 3'b000;    //x means don't care
8'b0000001x: y = 3'b001;
8'b000001xx: y = 3'b010;
8'b00001xxx: y = 3'b011;
8'b0001xxxx: y = 3'b100;
8'b001xxxxx: y = 3'b101;
8'b01xxxxxx: y = 3'b110;
8'b1xxxxxxx: y = 3'b111;
default: y = 3'bxxx;        //stating the default case
endcase

end
endmodule
