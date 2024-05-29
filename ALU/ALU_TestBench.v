module ALU_tb;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] ALU_Sel;

    // Outputs
    wire [7:0] ALU_Out;
    wire CarryOut;
    wire Z;

    // Instantiate the ALU
    ALU uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut), 
        .Z(Z)
    );

    initial begin
        // Test addition
        A = 8'd15; B = 8'd10; ALU_Sel = 4'b0001; // 15 + 10 = 25
        #10;
        $display("Add: A = %d, B = %d, ALU_Out = %d, CarryOut = %b, Z = %b", A, B, ALU_Out, CarryOut, Z);

        // Test subtraction
        A = 8'd20; B = 8'd25; ALU_Sel = 4'b0010; // 20 - 25 = -5 (borrow)
        #10;
        $display("Sub: A = %d, B = %d, ALU_Out = %d, CarryOut = %b, Z = %b", A, B, ALU_Out, CarryOut, Z);

        // Test NOR
        A = 8'b10101010; B = 8'b01010101; ALU_Sel = 4'b0011; // NOR of A and B
        #10;
        $display("NOR: A = %b, B = %b, ALU_Out = %b, Z = %b", A, B, ALU_Out, Z);

        // Test left shift
        A = 8'b00001111; B = 8'b0; ALU_Sel = 4'b1011; // A << 1
        #10;
        $display("LShift: A = %b, ALU_Out = %b, Z = %b", A, ALU_Out, Z);

        // Test right shift
        A = 8'b11110000; B = 8'b0; ALU_Sel = 4'b1100; // A >> 1
        #10;
        $display("RShift: A = %b, ALU_Out = %b, Z = %b", A, ALU_Out, Z);

        // Test less than
        A = 8'd10; B = 8'd20; ALU_Sel = 4'b1000; // A < B
        #10;
        $display("LessThan: A = %d, B = %d, ALU_Out = %b, Z = %b", A, B, ALU_Out, Z);

        // Test equal
        A = 8'd30; B = 8'd30; ALU_Sel = 4'b0110; // A == B
        #10;
        $display("Equal: A = %d, B = %d, ALU_Out = %b, Z = %b", A, B, ALU_Out, Z);

        //$finish;
    end

endmodule
