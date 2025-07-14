`timescale 1ns/1ps

module tb_siso;
    reg clk, rst, serial_in;
    wire serial_out;
    wire [3:0] shift_reg;   

    siso_shift_register dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out),
        .shift_reg(shift_reg)  
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock period
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

    initial begin
        $monitor("Time=%0t | serial_in=%b | shift_reg=%b | serial_out=%b", $time, serial_in, shift_reg, serial_out);
    end
endmodule
