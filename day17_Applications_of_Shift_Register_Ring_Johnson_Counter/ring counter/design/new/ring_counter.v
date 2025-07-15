//this is the verilog code to implement the one of the applications of shift register
//that is ring counter (right shift)
//Varshamai T H, Thiagarajar College of Engineering

module ring_counter (
    input clk,
    input reset,
    output reg [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0001;   // Initialize with single 1 bit at lsb
    else
        q <= {q[0], q[3:1]};  // Right cyclic shift
end

endmodule
