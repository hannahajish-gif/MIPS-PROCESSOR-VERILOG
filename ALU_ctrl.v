`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 12:19:49
// Design Name: 
// Module Name: ALU_ctrl
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
//R type 00, lw,sw,addi=01, beq = 10

module ALU_ctrl(
input [1:0] ALUop,
input [5:0]funct,
output reg [2:0]ctrl_signal);

always@(*) begin
case (ALUop)
2'b00 : begin //R tpe instructions
            case (funct)
            6'b100000: ctrl_signal=3'b000;//ADD
            6'b100010: ctrl_signal=3'b001;//SUB
            6'b100100: ctrl_signal=3'b010;//AND
            6'b100101: ctrl_signal=3'b011;//OR
            6'b101010: ctrl_signal=3'b100;//SLT
            default  : ctrl_signal=3'b111; 
            endcase
            end
2'b01 : ctrl_signal = 3'b000; //ADD for lw,sw,addi
2'b10 : ctrl_signal = 3'b001; //SUB for beq
default   : ctrl_signal = 3'b111; 
endcase
end
endmodule
