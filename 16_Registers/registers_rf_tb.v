module tb_reg_file;

    reg clk;
    reg reset;
    reg [3:0] reg_write_addr;
    reg [3:0] reg_read_addr1;
    reg [3:0] reg_read_addr2;
    reg [7:0] reg_write_data;
    reg reg_write_enable;
    wire [7:0] reg_read_data1;
    wire [7:0] reg_read_data2;

    // Instantiate the reg_file module
    reg_file uut_reg (
        .clk(clk),
        .reset(reset),
        .reg_write_addr(reg_write_addr),
        .reg_read_addr1(reg_read_addr1),
        .reg_read_addr2(reg_read_addr2),
        .reg_write_data(reg_write_data),
        .reg_write_enable(reg_write_enable),
        .reg_read_data1(reg_read_data1),
        .reg_read_data2(reg_read_data2)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1; //reset is active
        reg_write_enable = 0;
        reg_write_addr = 4'b0000;
        reg_read_addr1 = 4'b0000;
        reg_read_addr2 = 4'b0001;
        reg_write_data = 8'b0;
        
        // Release reset
        #10 reset = 0; //deactivate reset

        // Write data to registers
        reg_write_addr = 4'b0000;
        reg_write_data = 8'hA5; //in binary is 10100101
        reg_write_enable = 1; //write is enabled
        #10;
        reg_write_enable = 0; //disable write

        reg_write_addr = 4'b0001;
        reg_write_data = 8'h5A; //in binary is 01011010
        reg_write_enable = 1; //write is enabled
        #10;
        reg_write_enable = 0;  //disable write

        // Read data from registers
        reg_read_addr1 = 4'b0000;
        reg_read_addr2 = 4'b0001;
        #10;

        // Display read values
        $display("Read Data 1: %h", reg_read_data1);
        $display("Read Data 2: %h", reg_read_data2);

        // End of simulation
        $stop;
    end

endmodule

