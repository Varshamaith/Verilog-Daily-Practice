//simple test bench to verify the functionality of parallel in parallel out register

module tb_pipo;
    reg clk, rst;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo dut (
        .clk(clk),
        .rst(rst),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        parallel_in = 4'b0000;
        #10 rst = 0;

        parallel_in = 4'b1101; #10;
        parallel_in = 4'b1010; #10;
        parallel_in = 4'b0111; #10;

        #30 $stop;
    end
endmodule
