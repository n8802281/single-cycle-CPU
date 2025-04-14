module Shifter( result, leftRight, shamt, sftSrc  );

  output wire[31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire[31:0] sftSrc;

  reg[31:0] out;
  always@ (leftRight or shamt or sftSrc)
  begin 
    case(leftRight)
      1'b0:
      begin
        out[0] = sftSrc[1];
        out[1] = sftSrc[2];
        out[2] = sftSrc[3];
        out[3] = sftSrc[4];
        out[4] = sftSrc[5];
        out[5] = sftSrc[6];
        out[6] = sftSrc[7];
        out[7] = sftSrc[8];
        out[8] = sftSrc[9];
        out[9] = sftSrc[10];
        out[10] = sftSrc[11];
        out[11] = sftSrc[12];
        out[12] = sftSrc[13];
        out[13] = sftSrc[14];
        out[14] = sftSrc[15];
        out[15] = sftSrc[16];
        out[16] = sftSrc[17];
        out[17] = sftSrc[18];
        out[18] = sftSrc[19];
        out[19] = sftSrc[20];
        out[20] = sftSrc[21];
        out[21] = sftSrc[22];
        out[22] = sftSrc[23];
        out[23] = sftSrc[24];
        out[24] = sftSrc[25];
        out[25] = sftSrc[26];
        out[26] = sftSrc[27];
        out[27] = sftSrc[28];
        out[28] = sftSrc[29];
        out[29] = sftSrc[30];
        out[30] = sftSrc[31];
        out[31] = 0;
      end
      1'b1:
      begin
        out[0] = 0;
        out[1] = sftSrc[0];
        out[2] = sftSrc[1];
        out[3] = sftSrc[2];
        out[4] = sftSrc[3];
        out[5] = sftSrc[4];
        out[6] = sftSrc[5];
        out[7] = sftSrc[6];
        out[8] = sftSrc[7];
        out[9] = sftSrc[8];
        out[10] = sftSrc[9];
        out[11] = sftSrc[10];
        out[12] = sftSrc[11];
        out[13] = sftSrc[12];
        out[14] = sftSrc[13];
        out[15] = sftSrc[14];
        out[16] = sftSrc[15];
        out[17] = sftSrc[16];
        out[18] = sftSrc[17];
        out[19] = sftSrc[18];
        out[20] = sftSrc[19];
        out[21] = sftSrc[20];
        out[22] = sftSrc[21];
        out[23] = sftSrc[22];
        out[24] = sftSrc[23];
        out[25] = sftSrc[24];
        out[26] = sftSrc[25];
        out[27] = sftSrc[26];
        out[28] = sftSrc[27];
        out[29] = sftSrc[28];
        out[30] = sftSrc[29];
        out[31] = sftSrc[30];
      end
    endcase
  end

  assign result = out;

endmodule
