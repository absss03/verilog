module comparador (
    input  [3:0] a_i,
    input  [3:0] b_i,
    output       mayor,
    output       menor,
    output       igual
);

    assign menor = (a_i < b_i);
    assign mayor = (a_i > b_i);
    assign igual = (a_i == b_i);

endmodule