// Accumulator with two MUX for CSE 664 project
module ACC_MUX ( 
	//accumulator inputs and output
	input wire clk,
	input wire clb,
	input wire load_acc,
	output reg [7:0] acc_out,

	//MUX1 inputs and output
	input wire SelAcc1,
	input reg [7:0] ALU_out, // output from ALU
	input reg [7:0] MUX2_in, // output from MUX2
	output reg [7:0] MUX1_out,
	
	//MUX0 inputs and output
	input wire SelAcc0,
	input reg [7:0] data_in, // data in from registers
	input reg [3:0] immediate, // load immediate
	output reg [7:0] MUX0_out
	 
);

    always @(posedge clk) begin
	//MUX0
	assign MUX0_out = SelAcc0 ? immediate:data_in;

	//MUX1
	assign MUX1_out = SelAcc1 ? MUX0_out:ALU_out;

	// accumlator
	if (load_acc) 
	begin
            acc_out <= data_in;
        end
    end

endmodule