module counter (
    input clk,
    input rst,
    output reg [3:0] y_o
);
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            y_o <= 4'b0000;
        end else begin
            y_o <= y_o + 1'b1;
        end
    end
endmodule