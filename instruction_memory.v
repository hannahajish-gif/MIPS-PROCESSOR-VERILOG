`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 18:07:22
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
input [31:0] address,
output [31:0] instruction);

reg [31:0]memory[0:255];

initial begin
    memory[0] = 32'h20080005;
    memory[1] = 32'h2009000A;
    memory[2] = 32'h01095020;
    memory[3] = 32'hAE0A0000;
end

assign instruction = memory[address[9:2]];//[9:2] and not [31:2] since 8 bits
//are needed to represent to represent numbers between 0 and 255 (2^8=256)
endmodule
