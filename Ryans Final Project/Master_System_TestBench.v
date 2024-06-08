module Master_System_TestBench();

reg CLK;
reg CLB;
reg [7:0] instructionToSend;
wire [7:0] PCcounter;
integer PCtoINT;

    reg [7:0] instructions [20:0];

    initial begin
        instructions[0]  = 8'b11010101; // set ACC to 5
        instructions[1]  = 8'b01010000; // acc to reg0 (acc=5)
        instructions[2]  = 8'b11010011; // set ACC to 3
        instructions[3]  = 8'b01010001; // acc to reg1 (acc=3)
        instructions[4]  = 8'b11010000; // set ACC to 0
        instructions[5]  = 8'b00010000; // acc add reg0 (acc=5 at end)
        instructions[6]  = 8'b00100001; // acc sub reg1 (acc=2 at end)
        instructions[7]  = 8'b01010010; // set reg1 to acc (reg1=2)
        instructions[8]  = 8'b10110000; // multiply acc * 2 (shift left) (acc=4)
        instructions[9]  = 8'b00000000; // NOP
        instructions[10] = 8'b00000000; // NOP
        instructions[11] = 8'b00000000; // NOP
        instructions[12] = 8'b11011101; // set acc to imm (-3)
        instructions[13] = 8'b10101111; // branch if acc neg, goto address in imm (15)
        instructions[14] = 8'b11010000; // set acc to imm (0) // SHOULD SKIP
        instructions[15] = 8'b11010001; // set acc to imm (1)
        instructions[16] = 8'b00000000; // NOP
        instructions[17] = 8'b00000000; // NOP
        instructions[18] = 8'b11110000; // HALT
    end

// Instantiate the Master_System
Master_System Master_SystemActual(
	.CLK(CLK),
	.CLB(CLB),
	.FromInstructionMemroy(instructionToSend),
	.ToInstructionMemory(PCcounter)
);

// Clock generation
initial begin
    CLK = 1;
    forever #5 CLK = ~CLK; // 10ns clock period
end


    // Stimulus generation
    initial begin
        // Initialize inputs
        //PCcounter = 0;
        PCtoINT = 0;

        // Stimulus
        forever begin
//            #10;
		if(PCcounter != 0) begin
            		PCtoINT = PCcounter;
		end
	
            instructionToSend = instructions[PCtoINT];
            //PCtoINT = PCtoINT + 1;
	#10;
        end

end


endmodule
