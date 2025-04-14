module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o, Jrmux_o, LeftRight);

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;
output     [2-1:0] FURslt_o;
output             LeftRight;
output Jrmux_o;

//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;
wire LeftRight;
wire Jrmux_o;

reg         [4-1:0] out;
reg                 lr;
reg         [2-1:0] FUR;
reg jr;
//Main function

always @(ALUOp_i or funct_i)
begin
      case(ALUOp_i)
        3'b010://add sub and or nor slt sll srl jr
        begin
          case(funct_i)
            6'b010010://add
            begin
              out = 4'b0010;
              FUR = 2'b00;
              jr = 0;
            end
            6'b010000://sub
            begin
              out = 4'b0110;
              FUR = 2'b00;
              jr = 0;
            end
            6'b010100://and
            begin
              out = 4'b0000;
              FUR = 2'b00;
              jr = 0;
            end
            6'b010110://or
            begin
              out = 4'b0001;
              FUR = 2'b00;
              jr = 0;
            end
            6'b010101://nor
            begin
              out = 4'b1100;
              FUR = 2'b00;
              jr = 0;
            end
            6'b100000://slt
            begin
              out = 4'b0111;
              FUR = 2'b00;
              jr = 0;
            end
            6'b000000://sll
            begin
              lr = 1;
              FUR = 2'b01;
              jr = 0;
            end
            6'b000010://srl
            begin
              lr = 0;
              FUR = 2'b01;
              jr = 0;
            end
            6'b001000://jr
            begin
              jr = 1;
            end
          endcase
        end

        3'b100://addi
        begin
          out = 4'b0010;
          FUR = 2'b00;
          jr = 0;
        end

        3'b000://lw sw j jal
        begin
          out = 4'b0010;
          FUR = 2'b00;
          jr = 0;
        end

        3'b001://beq
        begin
          out = 4'b0110;
          jr = 0;
        end

        3'b110://bne bnez
        begin
          out = 4'b0110;
          jr = 0;
        end

        3'b111://bgez
        begin
          out = 4'b0100;
          jr = 0;
        end

        3'b011://blt
        begin
          out = 4'b0111;
          jr = 0;
        end

      endcase
end

assign LeftRight = lr;
assign ALU_operation_o = out;
assign FURslt_o = FUR;
assign Jrmux_o = jr;

endmodule
