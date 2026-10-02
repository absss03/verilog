module d_latch (
    input d_i,
    input ena,
    output q_o
);
    always @(*) begin
        if (ena == 1'b1) begin
            q_o = d_i;
        end
    end
endmodule