`timescale 1ns/1ps

module tb_binary_subtractor;

    parameter N = 8;

    reg  [N-1:0] a, b;
    wire [N-1:0] diff;
    wire borrow;

    binary_subtractor #(N) dut (
        .A(a),
        .B(b),
        .DIFF(diff),
        .BORROW(borrow)
    );

    initial begin

        $display(" A   -  B   =  DIFF   Borrow");

        a = 8'd25;  b = 8'd10;  #10;
        $display("%d - %d = %d    %b", a, b, diff, borrow);

        a = 8'd50;  b = 8'd20;  #10;
        $display("%d - %d = %d    %b", a, b, diff, borrow);
        
        a = 8'd10;  b = 8'd25;  #10;
        $display("%d - %d = %d    %b", a, b, diff, borrow);

        a = 8'd100; b = 8'd100; #10;
        $display("%d - %d = %d    %b", a, b, diff, borrow);

        a = 8'd0;   b = 8'd1;   #10;
        $display("%d - %d = %d    %b", a, b, diff, borrow);

        $stop;
    end

endmodule
