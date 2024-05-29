module ACC (
    input wire clk,
    input wire clb,
    input wire load_acc,
    input wire [7:0] data_in,
    output reg [7:0] acc_out
);

    always @(posedge clk) begin
	if (load_acc) begin
            acc_out <= data_in;
        end
    end

endmodule
