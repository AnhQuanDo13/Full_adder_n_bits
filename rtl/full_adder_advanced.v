module full_adder_advanced #(parameter N = 32)(a, b, sum, carry);
    input wire[N-1:0] a, b;
    output wire [N:0] sum;
    output wire carry;
    wire [N:0] C;

assign C[0] = 1'b0;

genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin
        full_adder fa_inst(
            .a(a[i]),
            .b(b[i]),
            .c(C[i]),
            .sum(sum[i]),
            .carry(C[i+1])
            );
        end
endgenerate
    
assign carry = C[N];

endmodule

