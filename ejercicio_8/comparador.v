module comparador (
    input     [3:0] a_i,
    input     [3:0] b_i,
    output    reg mayor,
    output    reg menor,
    output    reg igual
);
    always @(*) begin
        menor = 1'b0;
        mayor = 1'b0;
        igual = 1'b0;

        if (a_i < b_i) begin
            menor = 1'b1;
        end else if (a_i > b_i) begin
            mayor = 1'b1;
        end else begin
            igual = 1'b1;
        end
    end
    
endmodule