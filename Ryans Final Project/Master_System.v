module Master_System (
	input CLK,
	input CLB,
	input [7:0] FromInstructionMemroy,
	output wire [7:0] ToInstructionMemory
);

wire Z;
wire C;
wire [3:0] Opcode;
wire [3:0] RegAddOrImmediate;
wire LoadIR;
wire LoadReg;
wire IncPC;
wire SelPC;
wire LoadPC;
wire LoadAcc;
wire [1:0] SelACC;
wire [3:0] SelALU;
wire [7:0] RegToPC;
wire [7:0] ACCtoALUandREG;
wire [7:0] REGtoALUandACC;
wire [7:0] ALUtoACC;


reg_file regFileActual(
.clk(CLK),
.clb(CLB),
.LoadReg(LoadReg),
.regAdd(RegAddOrImmediate),
.fromACC(ACCtoALUandREG),
.toPC(RegToPC),
.toALUandACC(REGtoALUandACC)
);

ALU ALUActual(
.A(ACCtoALUandREG),
.B(REGtoALUandACC),
.ALU_Sel(SelALU),
.ALU_Out(ALUtoACC),
.CarryOut(C),
.Z(Z)
);

ACC_MUX AccumulatorActual( 
.clk(CLK),
.clb(CLB),
.load_acc(LoadAcc),
.acc_out(ACCtoALUandREG),
.SelAcc(SelACC),
.data_in(REGtoALUandACC),
.immediate(RegAddOrImmediate), 
.ALU_out(ALUtoACC)
);

PC_module PC_moduleActual(
.IM(ToInstructionMemory),
.A(fromRegToPC),
.B(RegAddOrImmediate),
.SelPC(SelPC),
.CLK(CLK),
.CLB(CLB),
.IncPC(IncPC),
.LoadPC(LoadPC) 
);

ControllerFSM ControllerFSMActual(
.CLK(CLK),
.CLB(CLB),
.Z(Z),
.C(C),
.Opcode(Opcode),
.LoadIR(LoadIR),
.IncPC(IncPC),
.SelPC(SelPC),
.LoadPC(LoadPC),
.LoadReg(LoadReg),
.LoadAcc(LoadAcc),
.SelAcc(SelACC),
.SelALU(SelALU)
);

instructionReg instructionRegActual(
.clk(CLK),
.clb(CLB),
.loadIR(LoadIR),
.FromInstructionMemory(FromInstructionMemroy),  // 8-bit input
.Opcode(Opcode), // 4-bit high part of input
.RegAddOrImmediate(RegAddOrImmediate)   // 4-bit low part of input
);

endmodule


