`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2026 10:00:11
// Design Name: 
// Module Name: muxes
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


module mux2_1#(parameter DATA_WIDTH = 32)(
input [DATA_WIDTH-1:0]input0,
input [DATA_WIDTH-1:0]input1,
input sel,
output[DATA_WIDTH-1:0]outsignal
);

assign outsignal = sel?input1:input0;
endmodule
