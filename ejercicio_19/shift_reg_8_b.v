module shift_reg_8b (
    input            clk,
    input            rst,
    input            load,
    input      [7:0] d_i,
    input            s_i, 
    output reg [7:0] y_o
);

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            y_o <= 8'b00000000;
        end else begin
            if (load == 1'b1) begin
                y_o <= d_i;
            end else begin
                y_o <= {y_o[6:0], s_i};
            end
        end
    end

endmodule