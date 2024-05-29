module Master_System_TestBench;

reg clk;
reg clb;
reg load_acc;
reg [7:0] A;
reg [7:0] B;
reg [3:0] ALU_Sel;

wire [7:0] acc_out;
wire CarryOut;
wire Z;

// Instantiate the Master_System
Master_System uut (
    .clk(clk),
    .clb(clb),
    .load_acc(load_acc),
    .acc_out(acc_out),
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .CarryOut(CarryOut),
    .Z(Z)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end


// Stimulus generation
initial begin
    // Initialize inputs
    clb = 1;
    load_acc = 1;
    A = 8'h00;
    B = 8'h00;
    ALU_Sel = 4'b0000;
    #10;
    
        // Test addition
        A = 8'd15; B = 8'd10; ALU_Sel = 4'b0001; // 15 + 10 = 25
        #10;
        $display("Add: A = %d, B = %d, acc_out = %d, CarryOut = %b, Z = %b", A, B, acc_out, CarryOut, Z);

        // Test subtraction
        A = 8'd20; B = 8'd25; ALU_Sel = 4'b0010; // 20 - 25 = -5 (borrow)
        #10;
        $display("Sub: A = %d, B = %d, acc_out = %d, CarryOut = %b, Z = %b", A, B, acc_out, CarryOut, Z);

        // Test NOR
        A = 8'b10101010; B = 8'b01010101; ALU_Sel = 4'b0011; // NOR of A and B
        #10;
        $display("NOR: A = %b, B = %b, acc_out = %b, Z = %b", A, B, acc_out, Z);

        // Test left shift
        A = 8'b00001111; B = 8'b0; ALU_Sel = 4'b1011; // A << 1
        #10;
        $display("LShift: A = %b, acc_out = %b, Z = %b", A, acc_out, Z);

        // Test right shift
        A = 8'b11110000; B = 8'b0; ALU_Sel = 4'b1100; // A >> 1
        #10;
        $display("RShift: A = %b, acc_out = %b, Z = %b", A, acc_out, Z);

        // Test less than
        A = 8'd10; B = 8'd20; ALU_Sel = 4'b1000; // A < B
        #10;
        $display("LessThan: A = %d, B = %d, acc_out = %b, Z = %b", A, B, acc_out, Z);

        // Test equal
        A = 8'd30; B = 8'd30; ALU_Sel = 4'b0110; // A == B
        #10;
        $display("Equal: A = %d, B = %d, acc_out = %b, Z = %b", A, B, acc_out, Z);
end

// Monitor the outputs
initial begin
    $monitor("At time %t, acc_out = %h, CarryOut = %b, Z = %b", $time, acc_out, CarryOut, Z);
end

endmodule
