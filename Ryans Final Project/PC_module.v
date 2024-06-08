

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

module MUX2(dataOut, A, B, SelPC);

	output [7:0]	dataOut;
	input  [7:0]	A;
	input  [3:0]	B;
	input 			SelPC;

	assign dataOut = SelPC ? A:B;

endmodule

module PC( count, dataIn, CLK, CLB, IncPC, LoadPC);

	output [7:0] count;
	input [7:0] dataIn;
	input CLK;
	input CLB;
	input IncPC;
	input LoadPC;
	reg [7:0] count;
	
always @(posedge CLK) begin

	if (LoadPC) 
		count <= dataIn;
		
	else if (IncPC)
		count <= count + 1'b1;
	
	if (IncPC)
		if (LoadPC)
			count <= 'b0;

end

endmodule