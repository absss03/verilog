module moduleName #(
    parameter N = 8 
) ( 
    input clk,
    input rst,
    output reg [N-1:0] y_o
);
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            y_o <= {N{1'b0}};
        end else begin
            y_o <= y_o + 1'b1;
        end
    end
endmodule