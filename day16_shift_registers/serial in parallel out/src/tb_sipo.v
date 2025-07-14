//test bench to verify the functionality of serial in parallel out shift register

module tb_sipo;
    reg clk, rst, serial_in;
    wire [3:0] parallel_out;

    sipo dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        serial_in = 0;
        #10 rst = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;

        #50 $stop;
    end
endmodule
