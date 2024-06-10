

module PC_module(

	output wire [7:0] IM,
	input wire  [7:0] A,
	input wire  [3:0] B,
	input wire	SelPC,
	input wire	CLK,
	input wire	CLB,
	input wire	IncPC,
	input wire	LoadPC );

	wire [7:0] MUX2_to_PC;

	MUX2 mux2instance(MUX2_to_PC, A, B, SelPC);
	PC PCinstance(IM, MUX2_to_PC, CLK, CLB, IncPC, LoadPC);

endmodule
