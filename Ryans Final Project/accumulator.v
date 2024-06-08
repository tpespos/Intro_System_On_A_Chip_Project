// Accumulator with two MUX for CSE 664 project
module ACC_MUX ( 
	//accumulator inputs and output
	input wire clk,
	input wire clb,
	input wire load_acc,
	output reg [7:0] acc_out,

	input wire [1:0] SelAcc,
	input reg [7:0] data_in, // data in from registers
	input reg [3:0] immediate, // load immediate

	//MUX1 inputs and output

	input reg [7:0] ALU_out // output from ALU


	 
);

reg SelAcc1;
reg SelAcc0;
reg [7:0] ACC_store;

    always @(posedge clk) begin
	assign SelAcc1 = SelAcc[1];
	assign SelAcc0 = SelAcc[0];

	if(load_acc) begin
		if(SelAcc1) begin
			ACC_store = ALU_out;
		end
		else begin
			if(SelAcc0) begin
				ACC_store = data_in;
			end
			else begin
			 ACC_store = immediate;
			end
		end
	end
	acc_out <= ACC_store;
    end //end always

endmodule