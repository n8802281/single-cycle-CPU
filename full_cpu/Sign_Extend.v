module Sign_Extend( data_i, data_o );

//I/O ports
input	[16-1:0] data_i;
output	[32-1:0] data_o;

//Internal Signals
wire	[32-1:0] data_o;

reg     [32-1:0] out;

//Sign extended
always @(data_i)
begin
  out[15:0]  = data_i[15:0];
	out[31:16] = {16{data_i[15]}};
end

assign data_o = out;

endmodule
