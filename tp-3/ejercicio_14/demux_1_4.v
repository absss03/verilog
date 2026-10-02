module modulo_demux (
    input data_i,
    input wire [1:0] sel_i,
    output reg [3:0] y_o
);
    always @(*) begin
        case (sel_i)
            2'b00 : y_o[0] = data_i;
            2'b01 : y_o[1] = data_i;
            2'b10 : y_o[2] = data_i;
            2'b11 : y_o[3] = data_i;
            default: y_o = 4'b0000;
        endcase
    end
endmodule