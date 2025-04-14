module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o );

//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output			RegDst_o;

//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire			RegDst_o;


reg		[3-1:0] Op;
reg				i;

//Main function

always @(instr_op_i)
begin
	case(instr_op_i)
		6'b000000:
		begin
			i = 1;
			Op = 3'b000;
		end
		6'b001000:
		begin
			i = 0;
			Op = 3'b111;
		end
	endcase
end

assign RegWrite_o = 1;
assign ALUOp_o    = Op;
assign ALUSrc_o   = ~i;
assign RegDst_o   = i;
endmodule
