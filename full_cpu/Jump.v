module Jump(instr_i, pc_i, jump_o);

//I/O ports
input wire	[25:0] instr_i;
input wire	[3:0] pc_i;

output wire	[31:0] jump_o;

reg         [31:0] out;

//Main function
always @(instr_i or pc_i)
begin
  out[0] = 0;
  out[1] = 0;
  out[27:2] = instr_i[25:0];
  out[31:28] = pc_i[3:0];
end

assign jump_o = out;

endmodule
