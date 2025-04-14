module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero, overflow );

//I/O ports
input	[32-1:0] aluSrc1;
input	[32-1:0] aluSrc2;
input	 [4-1:0] ALU_operation_i;

output	[32-1:0] result;
output			 zero;
output			 overflow;

//Internal Signals
wire			 zero;
wire			 overflow;
wire	[32-1:0] result;

reg     [32-1:0] out;

//Main function

always @(ALU_operation_i, aluSrc1, aluSrc2)
begin
    case(ALU_operation_i)
    0: out <= aluSrc1 & aluSrc2;
		1: out <= aluSrc1 | aluSrc2;
		2: out <= $signed(aluSrc1) + $signed(aluSrc2);
		6: out <= $signed(aluSrc1) - $signed(aluSrc2);
		7: out <= ($signed(aluSrc1) < $signed(aluSrc2)) ? 1 : 0;
    12: out <= ~(aluSrc1) & ~(aluSrc2);
    endcase
end

assign zero = (result == 0);
assign result = out;
endmodule
