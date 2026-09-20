module decodificador (
    input       [1:0]a_i,
    output      [3:0]y_o
);
    
    always @(*) begin
        case (a_i)
            2'b00 : y_o = 4'b0001;
            2'b01 : y_o = 4'b0010;
            2'b10 : y_o = 4'b0100;
            2'b11 : y_o = 4'b1000;
            default: 
        endcase
    end
endmodule