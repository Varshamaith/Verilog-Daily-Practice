//test bench to verify the functionality of parallel in serial out shift register

module tb_piso;
    reg clk, rst, load;
    reg [3:0] parallel_in;
    wire serial_out;
    wire [3:0] shift_reg;  // To observe shift_reg I declared it as a output port even though it is a internal signal in shift registers

    piso dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out),
        .shift_reg(shift_reg)   // Connect shift_reg output
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    initial begin
        rst = 1;
        load = 0;
        parallel_in = 4'b0000;
        #10 rst = 0;

        load = 1;
        parallel_in = 4'b1011;
        #10 load = 0;

        #50;

        load = 1;
        parallel_in = 4'b1100;
        #10 load = 0;

        #50;

        $stop;
    end

    initial begin
        $monitor("Time=%0t | load=%b | parallel_in=%b | shift_reg=%b | serial_out=%b",
                 $time, load, parallel_in, shift_reg, serial_out);
    end
endmodule
