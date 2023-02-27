`timescale 1ns / 1ps

module top_Q1(a,b,cin,sum,cout);
input [7:0]a,b;             //inputs 
input cin;                       
output [7:0]sum;            //outputs
output cout;
wire [6:0]w;                //wires

//full adder instantiations
fulladder fa1(a[0],b[0],cin,sum[0],w[0]);
fulladder fa2(a[1],b[1],w[0],sum[1],w[1]);
fulladder fa3(a[2],b[2],w[1],sum[2],w[2]);
fulladder fa4(a[3],b[3],w[2],sum[3],w[3]);
fulladder fa5(a[4],b[4],w[3],sum[4],w[4]);
fulladder fa6(a[5],b[5],w[4],sum[5],w[5]);
fulladder fa7(a[6],b[6],w[5],sum[6],w[6]);
fulladder fa8(a[7],b[7],w[6],sum[7],cout);

endmodule

//FULL ADDER
module fulladder(a,b,cin,sum,ca);
input a,b,cin;                    //inputs
output sum,ca;                    //outputs
wire [2:0]x;                      //wires

//half adder instantiations
halfadder ha1(a,b,x[0],x[1]);
halfadder ha2(x[0],cin,sum,x[2]);

or m3(ca,x[1],x[2]);

endmodule

//HALF ADDER
module halfadder(a,b,s,ca);
input a,b;
output s,ca;

xor m1(s,a,b);
and m2(ca,a,b);

endmodule
