module reg_file (
    input wire clk,
    input wire reset,
    input wire [3:0] reg_write_addr,
    input wire [3:0] reg_read_addr1,
    input wire [3:0] reg_read_addr2,
    input wire [7:0] reg_write_data,
    input wire reg_write_enable,
    output wire [7:0] reg_read_data1,
    output wire [7:0] reg_read_data2
);
    reg [7:0] registers [15:0]; // 16 8-bit registers
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin          
            for (i = 0; i < 16; i = i + 1) begin
                registers[i] <= 8'b0; // Sets each register to 0 (clears the registers).
            end
        end else if (reg_write_enable) begin
            registers[reg_write_addr] <= reg_write_data;
        end
    end

    assign reg_read_data1 = registers[reg_read_addr1];
    assign reg_read_data2 = registers[reg_read_addr2];

endmodule

