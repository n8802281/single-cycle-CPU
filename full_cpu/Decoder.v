module Decoder( instr_op_i, Jump_o, ALUOp_o, ALUSrc_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o, RegWrite_o, Regdst_o);

//I/O ports
input	[6-1:0] instr_op_i;

output Jump_o;
output [2:0] ALUOp_o;
output ALUSrc_o;
output Branch_o;
output BranchType_o;
output MemWrite_o;
output MemRead_o;
output [1:0] MemtoReg_o;
output RegWrite_o;
output [1:0] Regdst_o;

//Internal Signals
wire Jump_o;
wire [2:0] ALUOp_o;
wire ALUSrc_o;
wire Branch_o;
wire BranchType_o;
wire MemWrite_o;
wire MemRead_o;
wire [1:0] MemtoReg_o;
wire RegWrite_o;
wire [1:0] Regdst_o;

reg Jump;
reg [2:0] ALUOp;
reg ALUSrc;
reg Branch;
reg BranchType;
reg MemWrite;
reg MemRead;
reg [1:0] MemtoReg;
reg RegWrite;
reg [1:0] Regdst;

//Main function
always @(instr_op_i)
begin
	case(instr_op_i)
		6'b000000://add sub and or nor slt sll srl jr
		begin
			Jump = 0;
			ALUOp = 3'b010;
			ALUSrc = 0;
			Branch = 0;
			BranchType = 0;
			MemWrite = 0;
			MemRead = 0;
			MemtoReg = 0;
			RegWrite = 1;
			Regdst = 1;
		end
		6'b001000://addi
		begin
			Jump = 0;
			ALUOp = 3'b100;
			ALUSrc = 1;
			Branch = 0;
			BranchType = 0;
			MemWrite = 0;
			MemRead = 0;
			MemtoReg = 0;
			RegWrite = 1;
			Regdst = 0;
		end
		6'b011110://lw
		begin
			Jump = 0;
			ALUOp = 3'b000;
			ALUSrc = 1;
			Branch = 0;
			BranchType = 0;
			MemWrite = 0;
			MemRead = 1;
			MemtoReg = 1;
			RegWrite = 1;
			Regdst = 0;
		end
		6'b011100://sw
		begin
			Jump = 0;
			ALUOp = 3'b000;
			ALUSrc = 1;
			Branch = 0;
			BranchType = 0;
			MemWrite = 1;
			MemRead = 0;
			MemtoReg = 0;
			RegWrite = 0;
			Regdst = 0;
		end
		6'b000100://beq
		begin
			Jump = 0;
			ALUOp = 3'b001;
			ALUSrc = 0;
			Branch = 1;
			BranchType = 0;
			MemWrite = 0;
			MemRead = 0;
			MemtoReg = 0;
			RegWrite = 0;
			Regdst = 0;
		end
		6'b011010://bne
		begin
			Jump = 0;
			ALUOp = 3'b110;
			ALUSrc = 0;
			Branch = 1;
			BranchType = 1;
			MemWrite = 0;
			MemRead = 0;
			MemtoReg = 0;
			RegWrite = 0;
			Regdst = 0;
		end
		6'b011101://jump
		begin
			Jump = 1;
			ALUOp = 3'b000;
			//ALUSrc = 0;
			//Branch = 0;
			//BranchType = 0;
			MemWrite = 0;
			MemRead = 0;
			//MemtoReg = 0;
			RegWrite = 0;
			//Regdst = 1;
		end
		6'b011000://jal
		begin
			Jump = 1;
			ALUOp = 3'b000;
			ALUSrc = 0;
			Branch = 0;
			BranchType = 0;
			MemWrite = 0;
			MemRead = 0;
			MemtoReg = 2;
			RegWrite = 1;
			Regdst = 2;
		end
		6'b011001://blt
		begin
			Jump = 0;
			ALUOp = 3'b011;
			ALUSrc = 0;
			Branch = 1;
			BranchType = 1;
			MemWrite = 0;
			MemRead = 0;
			//MemtoReg = 0;
			RegWrite = 0;
			//Regdst = 1;
		end
		6'b010010://bnez
		begin
			Jump = 0;
			ALUOp = 3'b110;
			ALUSrc = 0;
			Branch = 1;
			BranchType = 1;
			MemWrite = 0;
			MemRead = 0;
			//MemtoReg = 0;
			RegWrite = 0;
			//Regdst = 0;
		end
		6'b001110://bgez
		begin
			Jump = 0;
			ALUOp = 3'b111;
			ALUSrc = 0;
			Branch = 1;
			BranchType = 0;
			MemWrite = 0;
			MemRead = 0;
			//MemtoReg = 0;
			RegWrite = 0;
			//Regdst = 0;
		end
	endcase
end

assign Jump_o = Jump;
assign ALUOp_o = ALUOp;
assign ALUSrc_o = ALUSrc;
assign Branch_o = Branch;
assign BranchType_o = BranchType;
assign MemWrite_o = MemWrite;
assign MemRead_o = MemRead;
assign MemtoReg_o = MemtoReg;
assign RegWrite_o = RegWrite;
assign Regdst_o = Regdst;
endmodule
