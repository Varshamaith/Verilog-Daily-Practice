//verilog code to implement the serial in serial out shift register
//Varshamai T H, BE(ECE) at Thiagarajar College of Engineering

module siso_shift_register (
    input clk,
    input rst,
    input serial_in,
    output reg serial_out,
    output reg [3:0] shift_reg
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};
    end

    always @(posedge clk) begin
        serial_out <= shift_reg[3];
    end
endmodule
