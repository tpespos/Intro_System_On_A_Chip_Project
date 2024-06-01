
module PC( count, dataIn, CLK, CLB, IncPC, LoadPC);

	output [7:0] count;
	input [7:0] dataIn;
	input CLK;
	input CLB;
	input IncPC;
	input LoadPC;
	reg [7:0] count;
	
always @(posedge CLK or negedge CLB) begin

	if(CLB == 0)	
		count  <= 0;
	else if (LoadPC)
		count <= dataIn;
	else if (IncPC)
		count <= count + 1'b1;

end

endmodule
