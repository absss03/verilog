module modulo_mux (
    input a_i,
    input b_i,
    input c_i,
    input d_i,
    input wire [1:0] sel_i,
    output reg y_o
);
    always @(*) begin
        case (sel_i)
            2'b00 : y_o = a_i;
            2'b01 : y_o = b_i;
            2'b10 : y_o = c_i;
            2'b11 : y_o = d_i;
            default: y_o = 1'b0;
        endcase
    end
endmodule