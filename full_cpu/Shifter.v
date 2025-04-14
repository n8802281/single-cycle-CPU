module Shifter( result, leftRight, shamt, sftSrc );

//I/O ports
output	[32-1:0] result;

input			 leftRight;
input	[5-1:0]  shamt;
input	[32-1:0] sftSrc ;

//Internal Signals
wire	[32-1:0] result;
reg     [31:0] out;

//Main function

always@ (leftRight or sftSrc)
begin
    case(leftRight)
      1'b0:
      begin
          out = sftSrc >> shamt;
        end
      1'b1://left
      begin
          out = sftSrc << shamt;
        end
    endcase
end

assign result = out;

endmodule
