module Mux2to1( data0_i, data1_i, select_i, data_o );

parameter size = 0;

//I/O ports
input wire	[size-1:0] data0_i;
input wire	[size-1:0] data1_i;
input wire	select_i;
output wire	[size-1:0] data_o;

reg         [size-1:0] out;

//Main function
/*your code here*/

always @(data0_i or data1_i or select_i)begin

	if(~select_i)
	begin
		out <= data0_i;
	end

	else
	begin
		out <= data1_i;
	end

end

assign data_o = out;

endmodule
