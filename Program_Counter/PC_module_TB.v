

module PC_module_TB();

reg SelPC, CLK, CLB, IncPC, LoadPC;
reg [7:0] A;
reg [3:0] B;

wire [7:0] count;

PC_module  dut(count, A, B, SelPC, CLK, CLB, IncPC, LoadPC);

initial
begin
	CLK = 0;
	CLB = 0;
	SelPC = 0;
	IncPC = 5;
	LoadPC = 0;
	
	A = 33;
	B = 14;
	
	forever #5 CLK=~CLK;

end


initial
begin

	#50
	SelPC = 1;
	#50
	IncPC = 1;
	#50
	LoadPC = 1;
	#50
	LoadPC = 0;
	#50
	SelPC  = 0;
	#50
	IncPC = 0;
	#50
	LoadPC = 1;
	

end

endmodule
