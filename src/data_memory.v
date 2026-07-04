`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 14:18:43
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input clk,
input write,
input read,
input [31:0]MemAddr,//output of ALU is 32 bits
input [31:0]memWrite,
output reg [31:0]memRead//The value that was read
);

reg [31:0]memory[0:255];//total 256 locations each 32 bit wide, 2^8=256 hence 8 bits are needed

always@(*)begin
if(read)
 memRead = memory[MemAddr[9:2]]; //Read is often combinational.
else
 memRead = 0;//if this isn't written then the synthesizers infers a latch which is a bug
end//notice the indices

always@(posedge clk) begin
if(write)//if write==1 then write
memory[MemAddr[9:2]]<=memWrite;//no need for else here
end
endmodule
