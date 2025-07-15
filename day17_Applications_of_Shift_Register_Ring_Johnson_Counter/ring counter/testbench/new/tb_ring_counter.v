//simple test bench to verify the functionality of ring counter
//right shift

module tb_ring_counter;
    reg clk, reset;
    wire [3:0] q;

    ring_counter uut (.clk(clk), .reset(reset), .q(q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10 reset = 0;
        #100 $stop;
    end

    initial begin
        $monitor("Time=%0t q=%b", $time, q);
    end
endmodule
