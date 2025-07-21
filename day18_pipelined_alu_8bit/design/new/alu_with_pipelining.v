//this is the verilog code to implement the 8-bit ALU with pipelining

//Varshami T H, Thiagarajar College of Engineering

module alu_with_pipelining (
    input clk,
    input reset,
    input [2:0] op_code,
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] result
);

//first I declare a registers each stages in this pipelining process
reg [2:0] op_stage1, op_stage2, op_stage3, op_stage4;
reg [7:0] A_stage1, A_stage2, A_stage3, A_stage4;
reg [7:0] B_stage1, B_stage2, B_stage3, B_stage4;
reg [7:0] alu_out_stage3;

// first stage is instruction decode
always @(posedge clk or posedge reset) begin
    if (reset) begin
        op_stage1 <= 0;
        A_stage1 <= 0;
        B_stage1 <= 0;
    end else begin
        op_stage1 <= op_code;
        A_stage1 <= A;
        B_stage1 <= B;
    end
end

// second stage is fetch the operands
always @(posedge clk or posedge reset) begin
    if (reset) begin
        op_stage2 <= 0;
        A_stage2 <= 0;
        B_stage2 <= 0;
    end else begin
        op_stage2 <= op_stage1;
        A_stage2 <= A_stage1;
        B_stage2 <= B_stage1;
    end
end

// third stage is execute the desired operations
always @(posedge clk or posedge reset) begin
    if (reset) begin
        op_stage3 <= 0;
        A_stage3 <= 0;
        B_stage3 <= 0;
        alu_out_stage3 <= 0;
    end else begin
        op_stage3 <= op_stage2;
        A_stage3 <= A_stage2;
        B_stage3 <= B_stage2;

        case (op_stage2)
            3'b000: alu_out_stage3 <= A_stage2 + B_stage2;
            3'b001: alu_out_stage3 <= A_stage2 - B_stage2;
            3'b010: alu_out_stage3 <= A_stage2 & B_stage2;
            3'b011: alu_out_stage3 <= A_stage2 | B_stage2;
            3'b100: alu_out_stage3 <= A_stage2 ^ B_stage2;
            3'b101: alu_out_stage3 <= ~A_stage2;
            3'b110: alu_out_stage3 <= A_stage2 << 1;
            3'b111: alu_out_stage3 <= A_stage2 >> 1;
            default: alu_out_stage3 <= 0;
        endcase
    end
end

// fourth and final stage is write back the final output to the output register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        op_stage4 <= 0;
        A_stage4 <= 0;
        B_stage4 <= 0;
        result <= 0;
    end else begin
        op_stage4 <= op_stage3;
        A_stage4 <= A_stage3;
        B_stage4 <= B_stage3;
        result <= alu_out_stage3;
    end
end

endmodule
