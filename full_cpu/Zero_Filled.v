module Zero_Filled( data_i, data_o );

//I/O ports
input	[16-1:0] data_i;
output	[32-1:0] data_o;

//Internal Signals
wire	[32-1:0] data_o;

reg     [32-1:0] out;
integer          i;

//Zero_Filled
always @(data_i)
begin
    for(i = 0; i < 16 ; i = i + 1)
    begin
        out[i] = data_i;
    end

    for(i = 16; i < 32; i = i + 1)
    begin
        out[i] = 0;
    end
end

assign data_o = out;
endmodule
