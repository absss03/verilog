module d_ff (
    input d_i,
    input clk,
    output q_o
);
    always @(posedge clk) begin
        q_o <= d_i;
    end
endmodule