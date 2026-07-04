`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 10:55:56
// Design Name: 
// Module Name: ALU
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


module ALU(//Register file outputs 32 bits
input [31:0]num1,
input [31:0]num2,
input [2:0]operator,//3 bit as initialized in parameter
output reg zero,
output reg [31:0]result);

parameter [2:0] ADD =3'b000; //Takes Decimal by default when not mentioned
parameter [2:0] SUB =3'b001; //Match the bit-width in LHS and RHS
parameter [2:0] AND =3'b010;
parameter [2:0] OR = 3'b011;
parameter [2:0] SLT =3'b100;

                
always@(*)begin
case (operator)
ADD: result=num1+num2;
SUB: result=num1-num2;
AND: result=num1&num2;
OR:  result=num1|num2;
SLT: result=num1<num2;
default: result=0;
endcase 
zero = (result==0); //result has to be zero and not simply num1=num2
end
endmodule
