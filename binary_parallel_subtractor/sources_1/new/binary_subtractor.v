//Module description: 
//parallel binary subtractor is a circuit that performs the subtraction of 2 N bit numbers
//using 2's complement binary number system

//Author: Varshamai T H
//Thiagarajar College of Engineering

//Module creation on date: 30.11.2025

module binary_subtractor #(
    parameter N = 8   
)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    output [N-1:0] DIFF,
    output BORROW
);

    wire [N-1:0] B_comp;
    wire [N:0]   carry;

    assign B_comp = ~B;   // 1's complement of B
    assign carry[0] = 1; // +1 to form 2's complement

    genvar i;
    generate
        for(i = 0; i < N; i = i + 1) begin : SUB_FA
            full_adder FA (
                .a(A[i]),
                .b(B_comp[i]),
                .cin(carry[i]),
                .sum(DIFF[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    assign BORROW = ~carry[N];

endmodule


//full adder module (1 bit)
module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
