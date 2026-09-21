module alu (
    input      [3:0]    a_i,
    input      [3:0]    b_i,
    input      [3:0]   op_i,

    output reg [3:0]  data_o

);
    always @(*) begin
        case (op_i)
            4'b0001: data_o = a_i + b_i,
            4'b0010: data_o = a_i - b_i,
            4'b0100: data_o = a_i & b_i,
            4'b1000: data_o = a_i | b_i, 
            default: 
        endcase
    end
endmodule