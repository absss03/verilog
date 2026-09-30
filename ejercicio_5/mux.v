module modulo_mux (
    input a_i,
    input b_i,
    input sel_i,
    output y_o
);
    always @(*) begin
        case (sel_i)
            1'b0 : y_o = a_i;
            1'b1 : y_o = b_i;
            default: y_o = a_i;
        endcase
    end
endmodule