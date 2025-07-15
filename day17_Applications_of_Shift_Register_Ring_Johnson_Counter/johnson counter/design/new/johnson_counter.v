//verilog code to implement the johnson counter (right shift)
//which is one of the main application of the shift registers
//Varshamai T H, Thiagarajar College of Engineering

module johnson_counter (
    input clk,
    input reset,
    output reg [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else
        q <= {~q[0], q[3:1]};  // Feedback inverted LSB to MSB (right shift)
end

endmodule
