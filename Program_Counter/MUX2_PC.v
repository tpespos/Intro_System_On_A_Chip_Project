
module MUX2(dataOut, A, B, SelPC);

	output [7:0]	dataOut;
	input  [7:0]	A;
	input  [3:0]	B;
	input 			SelPC;

	assign dataOut = SelPC ? A:B;

endmodule