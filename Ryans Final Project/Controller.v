//c
module ControllerFSM (
    input wire CLK,
    input wire CLB,
    input wire Z,
    input wire C,
    input wire [3:0] Opcode,
    output reg LoadIR,
    output reg IncPC,
    output reg SelPC,
    output reg LoadPC,
    output reg LoadReg,
    output reg LoadAcc,
    output reg [1:0] SelAcc,
    output reg [3:0] SelALU
);

reg doThings = 0;

always @(negedge CLK) begin
doThings = ~doThings;
end

always @(posedge doThings) begin //, Opcode) begin

//default state:
//begin
LoadIR <= 1;
IncPC <= 1;
SelPC <= 1;
LoadPC <= 1;
LoadReg <= 0;
LoadAcc <= 0;
SelAcc <= 2'b00;
SelALU <= Opcode;
//end


//////////////////////////////////////////////////// ALU Operations ////////////////////////////////////////////////////
if (Opcode == 4'b0001) begin //Add
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b10;

end else if (Opcode == 4'b0010) begin //Sub
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b10;

end else if (Opcode == 4'b0011) begin //Nor
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b10;

end else if (Opcode == 4'b1100) begin //Shift right
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b10;

end else if (Opcode == 4'b1011) begin //Shift left
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b10;

end 
//////////////////////////////////////////////////// Register/ACC Load ////////////////////////////////////////////////////
else if (Opcode == 4'b0100) begin //reg -> acc
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b10;

end else if (Opcode == 4'b0101) begin //ACC -> reg
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 1;
	LoadAcc <= 0;
	SelAcc <= 2'b00;

end else if (Opcode == 4'b1101) begin //Imidiate (IMM) -> ACC
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 1;
	SelAcc <= 2'b00;

end 
//////////////////////////////////////////////////// Branch Instructions ////////////////////////////////////////////////////
else if (Opcode == 4'b0110) begin //if ACC = 0, reg -> PC (jump if 0)...else PC+1 -> PC
	if (Z == 0) begin //branch = yes
		LoadIR <= 1;
		IncPC <= 0;
		SelPC <= 0;
		LoadPC <= 1;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;

	end else begin //branch = no
		LoadIR <= 1;
		IncPC <= 1;
		SelPC <= 0;
		LoadPC <= 0;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;
	end

end else if (Opcode == 4'b0111) begin //if ACC = 0, Imm -> PC (jump if 0) else PC+1 -> PC
	if (Z == 0) begin //branch = yes
		LoadIR <= 1;
		IncPC <= 0;
		SelPC <= 1;
		LoadPC <= 1;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;

	end else begin //branch = no
		LoadIR <= 1;
		IncPC <= 1;
		SelPC <= 0;
		LoadPC <= 0;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;
	end
	
end else if (Opcode == 4'b1000) begin //if ACC <0, Reg -> PC (jump if carry) else PC +1 -> PC
	if (C == 1) begin //branch = yes
		LoadIR <= 1;
		IncPC <= 0;
		SelPC <= 0;
		LoadPC <= 1;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;

	end else begin //branch = no
		LoadIR <= 1;
		IncPC <= 1;
		SelPC <= 0;
		LoadPC <= 0;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;
	end
	
end else if (Opcode == 4'b1010) begin //if ACC <0, Imm -> PC (jump if carry) else PC +1 -> PC
	if (C == 1) begin //branch = yes
		LoadIR <= 1;
		IncPC <= 0;
		SelPC <= 1;
		LoadPC <= 1;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;

	end else begin //branch = no
		LoadIR <= 1;
		IncPC <= 1;
		SelPC <= 0;
		LoadPC <= 0;
		LoadReg <= 0;
		LoadAcc <= 0;
		SelAcc <= 2'b00;
	end
	
end
//////////////////////////////////////////////////// Control Operations ////////////////////////////////////////////////////
else if (Opcode == 4'b0000) begin //NOP
	LoadIR <= 1;
	IncPC <= 1;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 0;
	SelAcc <= 2'b00;

end else if (Opcode == 4'b1111) begin //HALT
	LoadIR <= 0;
	IncPC <= 0;
	SelPC <= 0;
	LoadPC <= 0;
	LoadReg <= 0;
	LoadAcc <= 0;
	SelAcc <= 2'b00;

end //end ifs

end//end always

endmodule



