module full_adder(a, b, c, sum, carry);
    input wire a, b, c;
    output wire sum, carry;

    wire tmp1, tmp2, tmp3;

    half_adder ha_inst1(
        .a_in(a),
        .b_in(b),
        .sum_out(tmp1),
        .carry_out(tmp2)
        );

    half_adder ha_inst2 (
        .a_in(tmp1),
        .b_in(c),
        .sum_out(sum),
        .carry_out(tmp3)
        );
	
    assign carry = tmp2 | tmp3;

endmodule


