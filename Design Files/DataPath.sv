module DataPath(
	input logic clock,
	input logic reset,
	input logic [7:0] exadd,
//	output logic [31:0] crAdd,
//	output logic [31:0] aluOut,
//	output logic [31:0] instr,
//	output logic [31:0] rdData1,
//	output logic [31:0] rdData2,
//	output logic [31:0] dataStore,
	output logic [31:0] exdata
	
);
	
	logic [31:0] crAdd;
	logic [31:0] dataStore;
	logic [31:0] aluOut;
	logic [31:0] instr;
	logic [31:0] rdData1;
	logic [31:0] rdData2;
	logic[31:0] wrData;
	logic [31:0] b;
	logic [31:0] pc4;
	logic [31:0] nxAdd;
	logic [31:0] imm;
	
	logic [31:0] memDataR;
	logic [31:0] dataLoad;
	//logic [31:0] dataStore;
	logic [31:0] pcBranch;
	logic [4:0] conAddr;
	logic pcSel;
	logic regWrEn;
	logic memWrEn;
	logic aluB;	
	logic [3:0] aluOp;
	logic [2:0] immSel;
	logic [1:0] wrbk;
	logic z,l,g;
	


	Mux2 pcMux(
	
		.d0(pc4),
		.d1(pcBranch),//(aluOut),
		.sel(pcSel),
		.y(nxAdd)
	);

	
	PCadder4	pcAdd4(
	
		.current_addr(crAdd),
		.next_addr(pc4)
	
	);
	
	
	ProgramCounter pc(
		 .clk(clock), 
		 .rst(reset), 
		 .next_addr(nxAdd), 
		 .current_addr(crAdd)
	);

	
	InstructionMemory insMem(
	
		.ins_addr(crAdd),
		.instruction(instr)
	
	);
	
	ImmediateGenerator immGen(
	
		.ins(instr),
		.imm_sel(immSel),
		.imm_out(imm)
	
	);
	
	Adder32 adder32(
		.A(crAdd),    
		.B(imm), 
		.Y(pcBranch)

	);
	
	RegisterFile regFile(
	
		.clk(clock),
		.rst(reset),
		.reg_wr_en(regWrEn),
		.instruction(instr),
		.wr_data(wrData),
		.rd_data1(rdData1),
		.rd_data2(rdData2)
	
	);
	
	DataExtract dataExtStore(
	
	.inst(instr),
	.data(rdData2),
	.y(dataStore)
	
	);
	
	
	Mux2 muxB(
	
		.d0(dataStore),
		.d1(imm),
		.sel(aluB),
		.y(b)
	
	);
	
	ALU alu(
	
		.A(rdData1),
		.B(b),
		.ALUop(aluOp),
		.ALUout(aluOut),
		.ZeroFlag(z),
		.BLT(l),
		.BGT(g)
	
	);

	DataMemory dataMem(
	
		.clk(clock),
		.wr_en(memWrEn),
		.addr(aluOut),
		.wr_data(dataStore),
		.extaddr(exadd),
		.rd_data(memDataR),
		.extdata(exdata)
	
	);
	
	DataExtract dataExtLoad(
	
	.inst(instr),
	.data(memDataR),
	.y(dataLoad)
	
	);
	
	
	Mux3 muxWB(
	
		.d0(dataLoad),
		.d1(aluOut),
		.d2(pc4),
		.sel(wrbk),
		.y(wrData)
	
	);
	
	AddressDecorder addrDecode(
		.ins(instr),
		.blt(l),
		.bge(g),
		.zero(z),
		.Y(conAddr)
	);
	
	Controller control(
	
	  .controlMemAddr(conAddr),   
	  .aluOp(aluOp),
	  .immSel(immSel),
	  .wrbk(wrbk),
	  .aluB(aluB), 
	  .memWrEn(memWrEn), 
	  .regWrEn(regWrEn), 
	  .pcSel(pcSel)
  
	);

endmodule
