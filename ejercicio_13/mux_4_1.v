module modulo_mux (
    input a_i,
    input b_i,
    input c_i,
    input d_i,
    input wire [1:0] sel_i,
    output y_o
);
    always @(*) begin
        case (sel_i)
            1'b00 : y_o = a_i;
            1'b01 : y_o = b_i;
            1'b10 : y_o = a_i;
            1'b11 : y_o = b_i;
            default: y_o = a_i;
        endcase
    end
endmodule