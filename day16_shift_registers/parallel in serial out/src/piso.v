//verilog code to implement the parallel in serial out register

//Varshamai T H, Thiagarajar College of Engineering

module piso (
    input clk,
    input rst,
    input load,
    input [3:0] parallel_in,
    output reg serial_out,
    output reg [3:0] shift_reg   // <-- Expose shift_reg
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else if (load)
            shift_reg <= parallel_in;
        else
            shift_reg <= {shift_reg[2:0], 1'b0};  // Shift left
    end

    always @(posedge clk) begin
        serial_out <= shift_reg[3];
    end
endmodule
