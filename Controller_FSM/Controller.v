
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
    
always @(Z, C, Opcode) begin

//default state:
//begin
LoadIR <= 1;
IncPC <= 1;
SelPC <= 0;
LoadPC <= 0;
LoadReg <= 0;
LoadAcc <= 0;
SelAcc <= 2'b00;
SelALU <= 4'b0000;
//end


//////////////////////////////////////////////////// ALU Operations ////////////////////////////////////////////////////
if (Opcode == 4'b0001) begin //Add
//do things

end else if (Opcode == 4'b0010) begin //Sub
//do things

end else if (Opcode == 4'b0011) begin //Nor
//do things

end else if (Opcode == 4'b1100) begin //Shift right
//do things

end else if (Opcode == 4'b1011) begin //Shift left
//do things

end 
//////////////////////////////////////////////////// Register/ACC Load ////////////////////////////////////////////////////
else if (Opcode == 4'b0100) begin //reg -> acc load
//do things

end else if (Opcode == 4'b0101) begin //ACC -> reg
//do things

end else if (Opcode == 4'b1101) begin //Imidiate (IMM) -> ACC
//do things

end 
//////////////////////////////////////////////////// Branch Instructions ////////////////////////////////////////////////////
else if (Opcode == 4'b0110) begin //if ACC = 0, reg -> PC (jump if 0)...else PC+1 -> PC
//do things

end else if (Opcode == 4'b0111) begin //if ACC = 0, Imm -> PC (jump if 0) else PC+1 -> PC
//do things

end else if (Opcode == 4'b1000) begin //if ACC <0, Reg -> PC (jump if carry) else PC +1 -> PC
//do things

end else if (Opcode == 4'b1010) begin //if ACC <0, Imm -> PC (jump if carry) else PC +1 -> PC
//do things

end
//////////////////////////////////////////////////// Control Operations ////////////////////////////////////////////////////
else if (Opcode == 4'b0000) begin //NOP
//do things

end else if (Opcode == 4'b1111) begin //HALT
//do things

end //end ifs

end//end always

endmodule




