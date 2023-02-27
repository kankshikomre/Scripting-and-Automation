`timescale 1ns / 1ps

module top_Q2(a,b,p);
input [3:0]a,b;             //inputs           
output [7:0]p;              //outputs
wire [31:0]w;               //wires

//and gate instantiations for each stage
and m1(p[0],a[0],b[0]);
and m2(w[0],a[1],b[0]);
and m3(w[1],a[2],b[0]);
and m4(w[2],a[3],b[0]);

and m5(w[3],a[0],b[1]);
and m6(w[4],a[1],b[1]);
and m7(w[5],a[2],b[1]);
and m8(w[6],a[3],b[1]);

and m9(w[7],a[0],b[2]);
and m10(w[8],a[1],b[2]);
and m11(w[9],a[2],b[2]);
and m12(w[10],a[3],b[2]);

and m13(w[11],a[0],b[3]);
and m14(w[12],a[1],b[3]);
and m15(w[13],a[2],b[3]);
and m16(w[14],a[3],b[3]);

//full adder instatiations
//the final values of multiplier are stored directly in p[i]
full_adder fa1(1'b0,w[0],w[3],p[1],w[15]);
full_adder fa2(1'b0,w[1],w[4],w[16],w[17]);
full_adder fa3(1'b0,w[2],w[5],w[18],w[19]);

full_adder fa4(w[7],w[15],w[16],p[2],w[20]);
full_adder fa5(w[8],w[17],w[18],w[21],w[22]);
full_adder fa6(w[9],w[6],w[19],w[23],w[24]);

full_adder fa7(w[11],w[20],w[21],p[3],w[25]);
full_adder fa8(w[12],w[22],w[23],w[26],w[27]);
full_adder fa9(w[13],w[10],w[24],w[28],w[29]);

full_adder fa10(1'b0,w[25],w[26],p[4],w[30]);
full_adder fa11(w[27],w[28],w[30],p[5],w[31]);
full_adder fa12(w[14],w[29],w[31],p[6],p[7]);

endmodule

//FULL ADDER
module full_adder(a,b,cin,sum,cout);input a,b,cin;                  //inputs
output sum,cout;                //outputs
wire [2:0]x;                    //wires

xor g1(x[0],a,b);
xor g2(sum,x[0],cin);
and g3(x[1],x[0],cin);
and g4(x[2],a,b);
or g5(cout,x[1],x[2]);

endmodule 
