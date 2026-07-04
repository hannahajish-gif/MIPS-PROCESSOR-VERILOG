`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2026 10:47:28
// Design Name: 
// Module Name: top_module
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


module top_module(input sys_clk,sys_rst);
wire [31:0]pc_updated;//basically the current pc
wire [31:0]pc_next;//Decides if pc takes a pc+4 or branch or jump
wire [31:0]instruction_top;
wire [31:0]read_data1;
wire [31:0]read_data2;
wire [31:0]ALU_result;//output declared as result
wire RegDst_ctrl;
wire ALUsrc_ctrl;
wire MemRead_ctrl;
wire MemWrite_ctrl;
wire MemtoReg_ctrl;
wire RegWrite_ctrl;
wire Branch_ctrl;
wire jump_ctrl;
wire [1:0]ALUop_ctrl;
wire [2:0]ctrl_signal;
wire zero;
wire [31:0]immediate2;
wire [31:0]writeback_data;
wire [4:0]writeback_addr;//5 bits only and not 32 bits
wire [31:0]memval_read;
wire [31:0]src_ALU;//32 bits required and not 16 bits
wire [31:0] branch_offset;
wire [31:0]pc_plus4;
wire [31:0] branch_addr;
wire [31:0] branch_or_next;//since branch_Mux and jump_Mux both cannot drive pc_next at the same time
wire [31:0] jump_addr;


//.port(signal)--> .module(top_module)
pc pc_inst(.clk(sys_clk),.reset(sys_rst),.pc_next(pc_next),.pc(pc_updated));
instruction_memory instructions(.address(pc_updated),.instruction(instruction_top));
Main_ctrl ctrl_signals(.opcode(instruction_top[31:26]),.RegDst(RegDst_ctrl),.ALUsrc(ALUsrc_ctrl),.MemRead(MemRead_ctrl),.MemWrite(MemWrite_ctrl),.MemtoReg(MemtoReg_ctrl),.RegWrite(RegWrite_ctrl),.Branch(Branch_ctrl),.jump(jump_ctrl),.ALUop(ALUop_ctrl));
ALU_ctrl ALU_ctrl_sig(.ALUop(ALUop_ctrl),.funct(instruction_top[5:0]),.ctrl_signal(ctrl_signal));//funct
//immediate2 o/p is required from extender for ALUsrc_Mux
sign_extender bit_extension(.immediate1(instruction_top[15:0]),.immediate2(immediate2));

mux2_1 ALUsrc_Mux(.input0(read_data2),.input1(immediate2),.sel(ALUsrc_ctrl),.outsignal(src_ALU));//Source of second input of ALU//understand input0 and input1

ALU ALU_inst(.num1(read_data1),.num2(src_ALU),.operator(ctrl_signal),.zero(zero),.result(ALU_result));//ALU_result generate
data_memory dat_mem(.clk(sys_clk),.write(MemWrite_ctrl),.read(MemRead_ctrl),.MemAddr(ALU_result),.memWrite(read_data2),.memRead(memval_read));//memval_read generate from data_memory//understand Mem_Addr

mux2_1 MemToReg_Mux(.input0(ALU_result),.input1(memval_read),.sel(MemtoReg_ctrl),.outsignal(writeback_data));//Decides source of write_data
mux2_1 #(5)RegDst_Mux(.input0(instruction_top[20:16]),.input1(instruction_top[15:11]),.sel(RegDst_ctrl),.outsignal(writeback_addr));//Decides where to write
register_file register_inst(.readReg1(instruction_top[25:21]),.readReg2(instruction_top[20:16]),.RegWrite(RegWrite_ctrl),.write_data(writeback_data),.write_addr(writeback_addr),.clk(sys_clk),.read_data1(read_data1),.read_data2(read_data2));
assign pc_plus4 = pc_updated + 32'd4;
assign branch_offset = immediate2 << 2;// 4 instructions = 16 bytes (multiply by 2 twice)
assign branch_addr = pc_plus4 + branch_offset;
mux2_1 branch_Mux(.input0(pc_plus4),.input1(branch_addr),.sel(Branch_ctrl&zero),.outsignal(branch_or_next));//pc source Mux
assign jump_addr = {pc_plus4[31:28],instruction_top[25:0],2'b00};//top 4 bits are taken from pc_plus 4 since jumping will take place within the 256MB region.
//Every MIPS instruction starts with multiple of 4 and always ends with 00, which explains concatinating 2'b00 above. 
mux2_1 jump_Mux(.input0(branch_or_next),.input1(jump_addr),.sel(jump_ctrl),.outsignal(pc_next));
endmodule
//first check pc+4 or branch? Branch_ctrl could be either 1 or 0 but sel is a function of both of them
//so we also check for jump keeping the previous decision in mind.
//Alternatively we could also have used a 3:1 mux for deciding between pc+4, branch and jump 
//but that would have required 2 bit sel lines and also 2:1 mux are basic blocks hence preferred