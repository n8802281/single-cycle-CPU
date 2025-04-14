module Sign_Extend( data_i, data_o );

//I/O ports
input	[16-1:0] data_i;
output	[32-1:0] data_o;

//Internal Signals
wire	[32-1:0] data_o;

reg     [32-1:0] temp;

//Sign extended
/*your code here*/

always @(data_i)
begin
  temp[15:0]  = data_i[15:0];
	temp[31:16] = {16{data_i[15]}};
end

assign data_o = temp;

endmodule
