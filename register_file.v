`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 10:02:06
// Design Name: 
// Module Name: register_file
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


module register_file(
input [4:0]readReg1,//address of the register that needs to be read
input [4:0]readReg2,
input RegWrite,
input [31:0]write_data,//the data that needs to be written
input [4:0]write_addr,
input clk,
output [31:0]read_data1,
output [31:0]read_data2

);

reg [31:0]registers[0:31];

initial begin
registers[0]=32'd0;
end

assign read_data1 = registers[readReg1]; //Synthesises into a MUX
assign read_data2 = registers[readReg2];//Many input one output

always@(posedge clk) begin
if(RegWrite&&write_addr!=5'd0)
registers[write_addr]<=write_data;//Synthesises into a Decoder. 
end
endmodule
