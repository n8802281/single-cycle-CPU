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
    out[0] = data_i[0];
    out[1] = data_i[1];
    out[2] = data_i[2];
    out[3] = data_i[3];
    out[4] = data_i[4];
    out[5] = data_i[5];
    out[6] = data_i[6];
    out[7] = data_i[7];
    out[8] = data_i[8];
    out[9] = data_i[9];
    out[10] = data_i[10];
    out[11] = data_i[11];
    out[12] = data_i[12];
    out[13] = data_i[13];
    out[14] = data_i[14];
    out[15] = data_i[15];
    out[16] = 0;
    out[17] = 0;
    out[18] = 0;
    out[19] = 0;
    out[20] = 0;
    out[21] = 0;
    out[22] = 0;
    out[23] = 0;
    out[24] = 0;
    out[25] = 0;
    out[26] = 0;
    out[27] = 0;
    out[28] = 0;
    out[29] = 0;
    out[30] = 0;
    out[31] = 0;

end

assign data_o = out;
endmodule
