//verilog code to implement the parallel in parallel out register

//Varshamai T H, Thiagarajar college of engineering

module pipo (
    input clk,
    input rst,
    input [3:0] parallel_in,
    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            parallel_out <= 4'b0000;
        else
            parallel_out <= parallel_in;
    end
endmodule
