module codificador (
    input        [7:0]a_i,
    output   reg [2:0]y_o
);
    
    always @(*) begin
        case (a_i)
            8'h00 : y_o =  3'b000;
            8'h01 : y_o =  3'b001;
            8'h02: y_o =   3'b010;
            8'h04 : y_o =  3'b011;
            8'h08 : y_o =  3'b100;
            8'h10 : y_o =  3'b101;
            8'h20 : y_o =  3'b110;
            8'h40 : y_o =  3'b111;
            default: y_o = 3'b000;
        endcase
    end
endmodule