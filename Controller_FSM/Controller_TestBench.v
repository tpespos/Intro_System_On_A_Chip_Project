

module ControllerFSM_tb;

    // Inputs
    reg CLK;
    reg CLB;
    reg Z;
    reg C;
    reg [3:0] Opcode;

    // Outputs
    wire LoadIR;
    wire IncPC;
    wire SelPC;
    wire LoadPC;
    wire LoadReg;
    wire LoadAcc;
    wire [1:0] SelAcc;
    wire [3:0] SelALU;

    // Instantiate the Unit Under Test (UUT)
    ControllerFSM uut (
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
        .SelAcc(SelAcc), 
        .SelALU(SelALU)
    );

    initial begin
        // Initialize Inputs
        CLK = 0;
        CLB = 0;
        Z = 0;
        C = 0;
        Opcode = 4'b0000;

        // Monitor outputs
        $monitor("Time=%0d CLK=%b CLB=%b Z=%b C=%b Opcode=%b | LoadIR=%b IncPC=%b SelPC=%b LoadPC=%b LoadReg=%b LoadAcc=%b SelAcc=%b SelALU=%b", 
                  $time, CLK, CLB, Z, C, Opcode, LoadIR, IncPC, SelPC, LoadPC, LoadReg, LoadAcc, SelAcc, SelALU);

        // Reset sequence
        #10 CLB = 1;
        #10 CLB = 0;

        // Apply test vectors
        #10 Opcode = 4'b0001; // Add
        #20 Opcode = 4'b0010; // Sub
        #20 Opcode = 4'b0011; // Nor
        #20 Opcode = 4'b0100; // reg -> acc
        #20 Opcode = 4'b0101; // ACC -> reg
        #20 Opcode = 4'b0110; // if ACC = 0, reg -> PC (jump if 0)
        Z = 1;
        #20 Opcode = 4'b0111; // if ACC = 0, Imm -> PC (jump if 0)
        Z = 0;
        #20 Opcode = 4'b1000; // if ACC < 0, Reg -> PC (jump if carry)
        C = 1;
        #20 Opcode = 4'b1010; // if ACC < 0, Imm -> PC (jump if carry)
        C = 0;
        #20 Opcode = 4'b1100; // Shift right
        #20 Opcode = 4'b1101; // Immediate -> ACC
        #20 Opcode = 4'b1111; // HALT
        #20 Opcode = 4'b0000; // NOP
        #20;

        // Finish simulation

    end

    always #5 CLK = ~CLK; // Clock generation with a period of 10 units

endmodule
