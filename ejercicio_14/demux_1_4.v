module modulo_mux (
    input data_i,
    input wire [1:0] sel_i,
    output reg [3:0] y_o
);
    always @(*) begin
        case (sel_i)
            1'b00 : y_o[0] = data_i;
            1'b01 : y_o[1] = data_i;
            1'b10 : y_o[2] = data_i;
            1'b11 : y_o[3] = data_i;
            default: y_o[0] = data_i;
        endcase
    end
endmodule