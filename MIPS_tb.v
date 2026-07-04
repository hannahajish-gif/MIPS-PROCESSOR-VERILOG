`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 16:43:10
// Design Name: 
// Module Name: MIPS_tb
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


module MIPS_tb();
reg clk=0;
reg reset;

top_module MIPS_inst(.sys_clk(clk),.sys_rst(reset));

initial begin
forever begin
#5 clk=~clk;
end
end

initial begin
reset = 1;
#10;
reset = 0;
$display("Reset released at time = %0t", $time);
end
initial begin
#100 $finish;
end
endmodule
