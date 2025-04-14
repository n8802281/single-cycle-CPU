module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles

wire [31:0] pcWB;
wire [31:0] pcout;
wire [31:0] newpc;

wire [31:0] instr;

wire [31:0] jumpdata;

wire jump;
wire [2:0] aluop;
wire alusrc;
wire branch;
wire branchtype;
wire memwrite;
wire memread;
wire [1:0] memtoreg;
wire regwrite;
wire [1:0] regdst;

wire [4:0] WBreg;

wire [31:0] memtoregdata;
wire [31:0] WBdata;

wire [31:0] rsdata;
wire [31:0] rtdata;

wire [31:0] SEdata;
wire [31:0] ZFdata;

wire [31:0] shiftedSEdata;

wire [31:0] adder2result;

wire zero;
wire [31:0] BranchMuxData;

wire [31:0] jumpMuxData;

wire [31:0] ALUResult;
wire jrmux;

wire [31:0] ALUsrcdata;

wire [3:0] ALUoperation;
wire [1:0] FURslt;
wire ALUshifterlr;

wire overflow;

wire [31:0] ALUshifterResult;

wire [31:0] WBmuxdata;

wire [31:0] DMresult;

//modules

Program_Counter PC(
  .clk_i(clk_i),
	.rst_n(rst_n),
	.pc_in_i(pcWB),
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

Jump J(
  .instr_i(instr[25:0]),
  .pc_i(newpc[31:28]),
  .jump_o(jumpdata)
);

Decoder decoder(
  .instr_op_i(instr[31:26]),
  .Jump_o(jump),
  .ALUOp_o(aluop),
  .ALUSrc_o(alusrc),
  .Branch_o(branch),
  .BranchType_o(branchtype),
  .MemWrite_o(memwrite),
  .MemRead_o(memread),
  .MemtoReg_o(memtoreg),
  .RegWrite_o(regwrite),
  .Regdst_o(regdst)
);

Mux3to1 #(.size(5)) muxforWBaddr(
.data0_i(instr[20:16]),
.data1_i(instr[15:11]),
.data2_i(5'b11111),
.select_i(regdst),
.data_o(WBreg)
);

ALU_Ctrl aluctrl(
  .funct_i(instr[5:0]),
  .ALUOp_i(aluop),
  .ALU_operation_o(ALUoperation),
  .FURslt_o(FURslt),
  .Jrmux_o(jrmux),
  .LeftRight(ALUshifterlr)
  );

Reg_File RF(
  .clk_i(clk_i),
	.rst_n(rst_n),
  .RSaddr_i(instr[25:21]),
  .RTaddr_i(instr[20:16]),
  .RDaddr_i(WBreg),
  .RDdata_i(WBdata),
  .RegWrite_i(regwrite),
  .RSdata_o(rsdata),
  .RTdata_o(rtdata)
);

Sign_Extend SE(
  .data_i(instr[15:0]),
  .data_o(SEdata)
);

Zero_Filled ZF(
  .data_i(instr[15:0]),
  .data_o(ZFdata)
);

Shifter shifterforSE(
  .result(shiftedSEdata),
  .leftRight(1'b1),
  .shamt(5'b00010),
  .sftSrc(SEdata)
);

Adder Adder2(
  .src1_i(newpc),
	.src2_i(shiftedSEdata),
	.sum_o(adder2result)
	);

BranchMux2to1 #(.size(32)) muxforbranch(
  .data0_i(newpc),
  .data1_i(adder2result),
  .BranchType_i(branchtype),
  .zero_i(zero),
  .Branch_i(branch),
  .data_o(BranchMuxData)
);

Mux2to1 #(.size(32)) muxforjump(
  .data0_i(BranchMuxData),
  .data1_i(jumpdata),
  .select_i(jump),
  .data_o(jumpMuxData)
);

Mux2to1 #(.size(32)) muxforpcwb(
  .data0_i(jumpMuxData),
  .data1_i(rsdata),
  .select_i(jrmux),
  .data_o(pcWB)
);

Mux2to1 #(.size(32)) muxforALUsrc(
  .data0_i(rtdata),
  .data1_i(SEdata),
  .select_i(alusrc),
  .data_o(ALUsrcdata)
);

ALU alu(
  .aluSrc1(rsdata),
  .aluSrc2(ALUsrcdata),
  .ALU_operation_i(ALUoperation),
  .result(ALUResult),
  .zero(zero),
  .overflow(overflow)
);

Shifter ALUshifter(
  .result(ALUshifterResult),
  .leftRight(ALUshifterlr),
  .shamt(instr[10:6]),
  .sftSrc(ALUsrcdata)
);

Mux3to1 #(.size(32)) muxforaludata(
.data0_i(ALUResult),
.data1_i(ALUshifterResult),
.data2_i(ZFdata),
.select_i(FURslt),
.data_o(WBmuxdata)
);

Data_Memory DM(
.clk_i(clk_i),
.addr_i(WBmuxdata),
.data_i(rtdata),
.MemRead_i(memread),
.MemWrite_i(memwrite),
.data_o(DMresult)
);

Mux3to1 #(.size(32)) muxforWBdata(
.data0_i(WBmuxdata),
.data1_i(DMresult),
.data2_i(newpc),
.select_i(memtoreg),
.data_o(WBdata)
);



endmodule
