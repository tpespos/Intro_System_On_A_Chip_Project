module acc (
    input wire clk,
    input wire reset,
    input wire load_acc,
    input wire [7:0] data_in,
    output reg [7:0] acc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc_out <= 8'b0;
        end 
    else if (load_acc) begin
            acc_out <= data_in;
        end
    end

endmodule
