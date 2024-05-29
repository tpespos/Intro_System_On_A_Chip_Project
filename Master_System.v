module Master_System (
    input clk,
    input clb,
    input wire load_acc,

    output wire [7:0] acc_out,

    input [7:0] A,           // First operand
    input [7:0] B,           // Second operand
    input [3:0] ALU_Sel,     // ALU operation selector (4 bits)

    //output reg [7:0] ALU_Out,// ALU output
    output wire CarryOut,     // Carry out flag (borrow flag for subtraction)
    output wire Z             // Zero flag
);

wire [7:0] ALU_Out;

ALU Test_ALU (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut),
    .Z(Z)
);

ACC Test_ACC (
    .clk(clk),
    .clb(clb),
    .load_acc(load_acc),
    .data_in(ALU_Out),
    .acc_out(acc_out)
);

endmodule
