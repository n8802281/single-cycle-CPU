module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles

wire [31:0] pcout;
wire [31:0] newpc;
wire [31:0] instr;
wire [4:0]  mux1out;
wire [31:0] rsdata;
wire [31:0] rtdata;
wire        RegDst;
wire        RegWrite;
wire [3:0]  ALU_Ctrl;
wire        leftright;
wire [1:0]  FURslt;
wire [2:0]  ALU_op;
wire        ALUSrc;
wire [31:0] signExtendData;
wire [31:0] zeroExtendData;
wire [31:0] mux2out;
wire        Zero;
wire [31:0] ALUResult;
wire        overflow;
wire [31:0] shifterResult;
wire [31:0] mux3data;



//modules
Program_Counter PC(
  .clk_i(clk_i),
	.rst_n(rst_n),
	.pc_in_i(newpc),
	.pc_out_o(pcout)
	);

Adder Adder1(
  .src1_i(pcout),
	.src2_i(32'd4),
	.sum_o(newpc)
	);

Instr_Memory IM(
  .pc_addr_i(pcout),
	.instr_o(instr)
	);

Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),
        .data1_i(instr[15:11]),
        .select_i(RegDst),
        .data_o(mux1out)
        );

Reg_File RF(
        .clk_i(clk_i),
	.rst_n(rst_n),
        .RSaddr_i(instr[25:21]),
        .RTaddr_i(instr[20:16]),
        .RDaddr_i(mux1out),
        .RDdata_i(mux3data),
        .RegWrite_i(RegWrite),
        .RSdata_o(rsdata),
        .RTdata_o(rtdata)
        );

Decoder Decoder(
  .instr_op_i(instr[31:26]),
	.RegWrite_o(RegWrite),
	.ALUOp_o(ALU_op),
	.ALUSrc_o(ALUSrc),
	.RegDst_o(RegDst)
	);

ALU_Ctrl AC(
        .funct_i(instr[5:0]),
        .ALUOp_i(ALU_op),
        .ALU_operation_o(ALU_Ctrl),
	.FURslt_o(FURslt),
        .leftRight(leftright)
        );

Sign_Extend SE(
        .data_i(instr[15:0]),
        .data_o(signExtendData)
        );

Zero_Filled ZF(
        .data_i(instr[15:0]),
        .data_o(zeroExtendData)
        );

Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(rtdata),
        .data1_i(signExtendData),
        .select_i(ALUSrc),
        .data_o(mux2out)
        );

ALU ALU(
	.aluSrc1(rsdata),
	.aluSrc2(mux2out),
	.ALU_operation_i(ALU_Ctrl),
	.result(ALUResult),
	.zero(Zero),
	.overflow(overflow)
	);

Shifter shifter(
	.result(shifterResult),
	.leftRight(leftright),
	.shamt(instr[10:6]),
	.sftSrc(mux2out)
	);

Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALUResult),
        .data1_i(shifterResult),
	.data2_i(zeroExtendData),
        .select_i(FURslt),
        .data_o(mux3data)
        );

endmodule
