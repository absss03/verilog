module moore_fsm (
    input d_in,
    input clk,
    input rst,
    output det
);

    localparam [1:0] IDLE = 2'b00,
                     S1   = 2'b01,
                     S10  = 2'b10,
                     S101 = 2'b11;

    reg [1:0] state_reg, state_next;
                
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            state_reg <= IDLE;
        end else begin
            state_reg <= state_next;
        end
    end
    always @(*) begin
        case (state_reg)
            IDLE: 
                state_next = (d_in == 1'b1) ? S1 : IDLE;
            S1:   
                state_next = (d_in == 1'b0) ? S10 : S1;
            S10:  
                state_next = (d_in == 1'b1) ? S101 : IDLE;
            S101: 
                state_next = (d_in == 1'b0) ? S10 : S1; 
            default: 
                state_next = IDLE;
        endcase
    end

    assign det = (state_reg == S101) ? 1'b1 : 1'b0;
    
endmodule