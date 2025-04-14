module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );

  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;

  wire set;
  wire[31:0] CarryOut;

  ALU_1bit    ALU0(.result(result[0]), .carryOut(CarryOut[0]), .a(aluSrc1[0]), .b(aluSrc2[0]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(1'b0), .less(set));
  ALU_1bit    ALU1(.result(result[1]), .carryOut(CarryOut[1]), .a(aluSrc1[1]), .b(aluSrc2[1]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[0]), .less(1'b0));
  ALU_1bit    ALU2(.result(result[2]), .carryOut(CarryOut[2]), .a(aluSrc1[2]), .b(aluSrc2[2]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[1]), .less(1'b0));
  ALU_1bit    ALU3(.result(result[3]), .carryOut(CarryOut[3]), .a(aluSrc1[3]), .b(aluSrc2[3]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[2]), .less(1'b0));
  ALU_1bit    ALU4(.result(result[4]), .carryOut(CarryOut[4]), .a(aluSrc1[4]), .b(aluSrc2[4]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[3]), .less(1'b0));
  ALU_1bit    ALU5(.result(result[5]), .carryOut(CarryOut[5]), .a(aluSrc1[5]), .b(aluSrc2[5]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[4]), .less(1'b0));
  ALU_1bit    ALU6(.result(result[6]), .carryOut(CarryOut[6]), .a(aluSrc1[6]), .b(aluSrc2[6]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[5]), .less(1'b0));
  ALU_1bit    ALU7(.result(result[7]), .carryOut(CarryOut[7]), .a(aluSrc1[7]), .b(aluSrc2[7]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[6]), .less(1'b0));

  ALU_1bit    ALU8(.result(result[8]), .carryOut(CarryOut[8]), .a(aluSrc1[8]), .b(aluSrc2[8]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[7]), .less(1'b0));
  ALU_1bit    ALU9(.result(result[9]), .carryOut(CarryOut[9]), .a(aluSrc1[9]), .b(aluSrc2[9]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[8]), .less(1'b0));
  ALU_1bit    ALU10(.result(result[10]), .carryOut(CarryOut[10]), .a(aluSrc1[10]), .b(aluSrc2[10]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[9]), .less(1'b0));
  ALU_1bit    ALU11(.result(result[11]), .carryOut(CarryOut[11]), .a(aluSrc1[11]), .b(aluSrc2[11]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[10]), .less(1'b0));
  ALU_1bit    ALU12(.result(result[12]), .carryOut(CarryOut[12]), .a(aluSrc1[12]), .b(aluSrc2[12]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[11]), .less(1'b0));
  ALU_1bit    ALU13(.result(result[13]), .carryOut(CarryOut[13]), .a(aluSrc1[13]), .b(aluSrc2[13]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[12]), .less(1'b0));
  ALU_1bit    ALU14(.result(result[14]), .carryOut(CarryOut[14]), .a(aluSrc1[14]), .b(aluSrc2[14]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[13]), .less(1'b0));
  ALU_1bit    ALU15(.result(result[15]), .carryOut(CarryOut[15]), .a(aluSrc1[15]), .b(aluSrc2[15]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[14]), .less(1'b0));

  ALU_1bit    ALU16(.result(result[16]), .carryOut(CarryOut[16]), .a(aluSrc1[16]), .b(aluSrc2[16]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[15]), .less(1'b0));
  ALU_1bit    ALU17(.result(result[17]), .carryOut(CarryOut[17]), .a(aluSrc1[17]), .b(aluSrc2[17]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[16]), .less(1'b0));
  ALU_1bit    ALU18(.result(result[18]), .carryOut(CarryOut[18]), .a(aluSrc1[18]), .b(aluSrc2[18]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[17]), .less(1'b0));
  ALU_1bit    ALU19(.result(result[19]), .carryOut(CarryOut[19]), .a(aluSrc1[19]), .b(aluSrc2[19]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[18]), .less(1'b0));
  ALU_1bit    ALU20(.result(result[20]), .carryOut(CarryOut[20]), .a(aluSrc1[20]), .b(aluSrc2[20]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[19]), .less(1'b0));
  ALU_1bit    ALU21(.result(result[21]), .carryOut(CarryOut[21]), .a(aluSrc1[21]), .b(aluSrc2[21]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[20]), .less(1'b0));
  ALU_1bit    ALU22(.result(result[22]), .carryOut(CarryOut[22]), .a(aluSrc1[22]), .b(aluSrc2[22]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[21]), .less(1'b0));
  ALU_1bit    ALU23(.result(result[23]), .carryOut(CarryOut[23]), .a(aluSrc1[23]), .b(aluSrc2[23]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[22]), .less(1'b0));

  ALU_1bit    ALU24(.result(result[24]), .carryOut(CarryOut[24]), .a(aluSrc1[24]), .b(aluSrc2[24]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[23]), .less(1'b0));
  ALU_1bit    ALU25(.result(result[25]), .carryOut(CarryOut[25]), .a(aluSrc1[25]), .b(aluSrc2[25]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[24]), .less(1'b0));
  ALU_1bit    ALU26(.result(result[26]), .carryOut(CarryOut[26]), .a(aluSrc1[26]), .b(aluSrc2[26]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[25]), .less(1'b0));
  ALU_1bit    ALU27(.result(result[27]), .carryOut(CarryOut[27]), .a(aluSrc1[27]), .b(aluSrc2[27]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[26]), .less(1'b0));
  ALU_1bit    ALU28(.result(result[28]), .carryOut(CarryOut[28]), .a(aluSrc1[28]), .b(aluSrc2[28]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[27]), .less(1'b0));
  ALU_1bit    ALU29(.result(result[29]), .carryOut(CarryOut[29]), .a(aluSrc1[29]), .b(aluSrc2[29]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[28]), .less(1'b0));
  ALU_1bit    ALU30(.result(result[30]), .carryOut(CarryOut[30]), .a(aluSrc1[30]), .b(aluSrc2[30]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[29]), .less(1'b0));
  ALU_1bit_num31    ALU31(.result(result[31]), .carryOut(CarryOut[31]), .a(aluSrc1[31]), .b(aluSrc2[31]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(CarryOut[30]), .less(1'b0), .overflow(overflow), .set(set));

  assign zero=~|result;
endmodule
