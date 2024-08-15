module half_adder(a_in, b_in, sum_out, carry_out);
    input wire a_in, b_in;
    output wire sum_out, carry_out;

    assign sum_out = a_in ^ b_in;
    assign carry_out = a_in & b_in;
endmodule

