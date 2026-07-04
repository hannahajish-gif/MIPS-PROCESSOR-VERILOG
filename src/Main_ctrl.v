// Purpose:
// Generates all processor control signals based on the instruction opcode.
//
// Inputs:
// opcode[5:0]
//
// Outputs:
// RegDst, ALUSrc, MemRead, MemWrite,
// MemtoReg, RegWrite, Branch, Jump, ALUOp
//
// Supported Instructions:
// R-type, lw, sw, beq, addi, j
module Main_ctrl(
input [5:0]opcode,
output reg RegDst,	
output reg ALUsrc,	
output reg MemRead,	//Whether to read
output reg MemWrite,
output reg MemtoReg,
output reg RegWrite,
output reg Branch,	
output reg jump,
output reg [1:0]ALUop);

always@(*) begin
case (opcode)
6'b000000 : begin //R type
            RegDst = 1;
            ALUsrc = 0;
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;
            RegWrite = 1;
            Branch = 0;
            jump = 0;
            ALUop = 2'b00; //R type
            end
6'b100011 : begin //lw
            RegDst = 0;
            ALUsrc = 1;
            MemRead = 1;
            MemWrite = 0;
            MemtoReg = 1;
            RegWrite = 1;
            Branch = 0;
            jump = 0;
            ALUop = 2'b01; //ADD
            end
            
6'b101011 : begin       //sw
            RegDst = 0;//don't care
            ALUsrc = 1;
            MemRead = 0;
            MemWrite = 1;
            MemtoReg = 0;//don't care
            RegWrite = 0;
            Branch = 0;
            jump = 0;
            ALUop = 2'b01;//ADD
            end
6'b000100 : begin       //beq
            RegDst = 0;//don't care
            ALUsrc = 0;
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;//don't care
            RegWrite = 0;
            Branch = 1;
            jump = 0;
            ALUop = 2'b10;//SUB
            end
6'b001000 : begin       //addi
            RegDst = 0;
            ALUsrc = 1;
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;//don't care
            RegWrite = 1;
            Branch = 0;
            jump = 0;
            ALUop = 2'b01;//ADD
            end 
6'b000010 : begin       //j
            RegDst = 0;//don't care
            ALUsrc = 0;//don't care
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;//don't care
            RegWrite = 0;
            Branch = 0;
            jump = 1;
            ALUop = 2'b00;//Don't care
            end
default   : begin       
            RegDst = 0;
            ALUsrc = 0;
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;
            RegWrite = 0;
            Branch = 0;
            jump = 0;
            ALUop = 2'b00;
            end
endcase
end
endmodule 