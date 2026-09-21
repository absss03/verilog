module full_adder (
    input a_i, b_i, carry_i,
    output sum_o, carry_o
);

    wire aux_sum;
    wire aux_carry_1;
    wire aux_carry_2;

    half_adder half_adder_1 (
        .a_i (a_i),
        .b_i (b_i),
        .sum_o (aux_sum),
        .carry_o (aux_carry_1)
    );

    half_adder half_adder_2 (
        .a_i (aux_sum),
        .b_i (carry_i),
        .sum_o (sum_o),
        .carry_o (aux_carry_2)
    );

    assign carry_o = aux_carry_1 | aux_carry_2;
endmodule