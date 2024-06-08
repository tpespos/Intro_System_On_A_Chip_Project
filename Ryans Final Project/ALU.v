module ALU (
    input [7:0] A,           // First operand
    input [7:0] B,           // Second operand
    input [3:0] ALU_Sel,     // ALU operation selector (4 bits)
    output reg [7:0] ALU_Out,// ALU output
    output reg CarryOut,     // Carry out flag (borrow flag for subtraction)
    output reg Z             // Zero flag
);

always @(*) begin
    CarryOut = 0; // Default to no carry out
    Z = 0;        // Default to zero flag being low
    case (ALU_Sel)
        4'b0001: begin
            // Perform addition and assign carry out and result
            {CarryOut, ALU_Out} = A + B;
        end
        4'b0010: begin
            // Perform subtraction
            {CarryOut, ALU_Out} = A - B;
            // Explicitly set carry out (borrow) if A < B
            CarryOut = (A < B) ? 1 : 0;
        end
        4'b0011: ALU_Out = ~(A | B);    // NOR
        4'b1011: ALU_Out = A << 1;      // Left shift
        4'b1100: ALU_Out = A >> 1;      // Right shift
        4'b1000: ALU_Out = (A < B) ? 8'b1 : 8'b0; // Less than
        4'b0110: ALU_Out = (A == B) ? 8'b1 : 8'b0; // Equal
        // Add more operations here as needed
        default: ALU_Out = 8'b00000000; // Default case
    endcase
    Z = (A == 8'b0) ? 1 : 0; // Set Zero flag
    CarryOut = (A < 8'b0) ? 1 : 0; // Set Zero flag
end

endmodule
