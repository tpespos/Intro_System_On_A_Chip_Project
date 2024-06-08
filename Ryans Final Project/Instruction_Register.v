


module instructionReg(

    input wire clk,
    input wire clb,
    input wire loadIR,

    input wire [7:0] FromInstructionMemory,  // 8-bit input
    output reg [3:0] Opcode, // 4-bit high part of input
    output reg [3:0] RegAddOrImmediate   // 4-bit low part of input
);

always @(negedge clk) begin
if (loadIR) begin
    // Assign the higher 4 bits of input_data to output_high
    assign Opcode = FromInstructionMemory[7:4];
    
    // Assign the lower 4 bits of input_data to output_low
    assign RegAddOrImmediate = FromInstructionMemory[3:0];
end
end
endmodule