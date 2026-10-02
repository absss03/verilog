module maquina_estados_alarma (
    input rst,
    input clk,
    input sw_1,
    input sw_2,
    input sw_3,
    input sensor,
    output led
);
    localparam [1:0] EN_ALARMA  = 2'b00,
                     ARMADO     = 2'b01,
                     DESARMADO  = 2'b10;

    localparam [2:0] SECUENCIA = 3'b101;

    reg [1:0] state_reg;
    reg [1:0] state_next;

    wire [2:0] switches = {sw_3, sw_2, sw_1};
                
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            state_reg <= DESARMADO;
        end else begin
            state_reg <= state_next;
        end
    end

    always @(*) begin
        state_next = state_reg;

        case (state_reg)
            EN_ALARMA: begin
                if (switches == SECUENCIA)
                    state_next = DESARMADO;
            end
            ARMADO: begin
                if (sensor == 1'b1) 
                    state_next = EN_ALARMA;
                else if (switches == SECUENCIA) 
                   state_next = DESARMADO; 
            end
            DESARMADO: begin  
                if (switches == SECUENCIA)
                    state_next = ARMADO;
            end            
            default: 
                state_next = DESARMADO;
        endcase
    end

    // El led deberia prenderse cuando ??? la consigna no especifica
    // Suponemos que con la alarma
    assign led = (state_reg == EN_ALARMA) ? 1'b1 : 1'b0;
    
endmodule