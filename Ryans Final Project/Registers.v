//c
module reg_file (
	input wire clk,
	input wire clb,
	input wire LoadReg,
	input wire [3:0] regAdd,
	input wire signed [7:0] fromACC,
	output wire signed [7:0] toPC,
	output wire signed [7:0] toALUandACC

);
    reg [7:0] registers [15:0]; // 16 8-bit registers

reg doThings = 1;

always @(posedge clk) begin
doThings = ~doThings;
end

always @(posedge doThings) begin
        
        if (LoadReg) begin
            registers[regAdd] <= fromACC;
        end
    end

    assign toPC = registers[regAdd];
    assign toALUandACC = registers[regAdd];

endmodule
