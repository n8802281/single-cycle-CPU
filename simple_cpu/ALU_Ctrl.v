module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o, leftRight);

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;
output     [2-1:0] FURslt_o;
output             leftRight;

//Internal Signals
wire		[3:0] ALU_operation_o;
wire		[1:0] FURslt_o;

reg         [3:0] out;
reg                 lr;
reg                 fur;
//Main function

always @(ALUOp_i or funct_i)
begin
        if (ALUOp_i == 3'b111)
          begin
            out = 4'b0010;
            fur = 0;
          end
          else if (ALUOp_i == 3'b000)
            begin
            if(funct_i == 6'b010010)
                begin
                    out = 4'b0010;
                    fur = 0;
                end
            else if(funct_i == 6'b010000)
                begin
                    out = 4'b0110;
                    fur = 0;
                end
            else if(funct_i == 6'b010100)
                begin
                    out = 4'b0000;
                    fur = 0;
                end
            else if(funct_i == 6'b010110)
                begin
                    out = 4'b0001;
                    fur = 0;
                end
            else if(funct_i == 6'b010101)
                begin
                    out = 4'b1100;
                    fur = 0;
                end
            else if(funct_i == 6'b100000)
                begin
                    out = 4'b0111;
                    fur = 0;
                end
            else if(funct_i == 6'b000000)
                begin
                    lr = 1;
                    fur = 1;
                end
            else if(funct_i == 6'b000010)
                begin
                    lr = 0;
                    fur = 1;
                end
        end


end

assign leftRight = lr;
assign ALU_operation_o = out;
assign FURslt_o = fur;
endmodule
