module full_adder_4b (
    input       [3:0]   a_i, 
    input       [3:0]   b_i, 
    input           carry_i,
    output      [3:0] sum_o, 
    output          carry_o
);
    wire [4:0] aux_carry;
    assign aux_carry[0] = carry_i;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
                full_adder m_full_adder (
                    .a_i (a_i[i]),
                    .b_i (b_i[i]),
                    .c_i (aux_carry[i]),
                    .s_o (sum_o[i]),
                    .c_o (aux_carry[i+1])
            );
        end
    endgenerate
    assign carry_o = aux_carry[4]
endmodule