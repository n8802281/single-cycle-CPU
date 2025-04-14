module Mux2to1( data0_i, data1_i, select_i, data_o );

parameter size = 0;

//I/O ports
input wire	[size-1:0] data0_i;
input wire	[size-1:0] data1_i;
input wire	select_i;
output wire	[size-1:0] data_o;

reg         [size-1:0] out;

//Main function
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



module BranchMux2to1( data0_i, data1_i, BranchType_i, zero_i, Branch_i, data_o );

parameter size = 0;

//I/O ports
input wire	[size-1:0] data0_i;
input wire	[size-1:0] data1_i;
input wire	BranchType_i;
input wire	zero_i;
input wire	Branch_i;
output wire	[size-1:0] data_o;

reg         [size-1:0] out;

//Main function
always @(data0_i or data1_i or BranchType_i or zero_i or Branch_i)
begin
	if(Branch_i == 1 && BranchType_i == 1 && zero_i == 0)
			out <= data1_i;
	else if (Branch_i == 1 && BranchType_i == 0 && zero_i == 1)
			out <= data1_i;
	else
		out <= data0_i;
end

assign data_o = out;

endmodule
