`timescale 1ns/1ps

// This is the simple test bench to verify the functionality of 8-bit ALU
module tb_pipelined_alu;

reg clk, reset;
reg [2:0] op_code;
reg [7:0] A, B;
wire [7:0] result;

alu_with_pipelining dut (
    .clk(clk),
    .reset(reset),
    .op_code(op_code),
    .A(A),
    .B(B),
    .result(result)
);

always #5 clk = ~clk; // Clock with 10ns period (positive edge triggered)

initial begin
    $monitor("Time=%0t | Opcode=%b | A=%d | B=%d | Result=%d", $time, op_code, A, B, result);

    clk = 0;
    reset = 1;
    op_code = 3'b000;
    A = 8'd0;
    B = 8'd0;
    #10;

    reset = 0;

    // Test ADD
    op_code = 3'b000; A = 8'd25; B = 8'd17; #10;
    // Test SUB
    op_code = 3'b001; A = 8'd50; B = 8'd10; #10;
    // Test AND
    op_code = 3'b010; A = 8'b10101010; B = 8'b11001100; #10;
    // Test OR
    op_code = 3'b011; A = 8'b00110011; B = 8'b11000011; #10;
    // Test XOR
    op_code = 3'b100; A = 8'b11110000; B = 8'b00001111; #10;
    // Test NOT
    op_code = 3'b101; A = 8'b10101010; B = 8'd0; #10;
    // Test SHL
    op_code = 3'b110; A = 8'd10; B = 8'd0; #10;
    // Test SHR
    op_code = 3'b111; A = 8'd16; B = 8'd0; #10;

    #100; // Wait for pipeline to flush
    $finish;
end

endmodule
