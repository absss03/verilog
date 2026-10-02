module maquina_estados_led (
    input sw_1,
    input sw_2,
    input clk,
    output rst,
    output led_a,
    output led_b
);

    localparam [1:0] LUCES_APAGADAS = 2'b00,
                     LUZ_A          = 2'b01,
                     LUZ_B          = 2'b10,
                     LUZ_A_Y_B      = 2'b11;
    
    reg [1:0] estado, proximo_estado;
    reg [31:0] count; 
    reg blink_1hz;

    always @(posedge clk) begin
        if (count == 24_999_999) begin
            blink_1hz <= ~blink_1hz;
            count <= 0;           
        end else begin
            count <= count + 1;
        end
    end

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1) begin
            estado <= LUCES_APAGADAS;
        else
            estado <= proximo_estado;
        end
    end

    always @(*) begin
        proximo_estado = estado;
        case (estado)
            LUCES_APAGADAS, LUZ_A, LUZ_B, LUZ_A_Y_B: begin
                if (sw_1 == 1'b1 && sw_2 == 1'b0)
                    proximo_estado = LUZ_A;
                else if (sw_1 == 1'b0 && sw_2 == 1'b1)
                    proximo_estado = LUZ_B;
                else if (sw_1 == 1'b1 && sw_2 == 1'b1)
                    proximo_estado = LUZ_A_Y_B;
                else
                    proximo_estado = LUCES_APAGADAS;
            end
        endcase
    end

    assign led_a = ((estado == LUZ_A) || (estado == LUZ_A_Y_B))  ? blink_1hz : 1'b0;
    assign led_b = ((estado == LUZ_B) || (estado == LUZ_A_Y_B)) ? blink_1hz : 1'b0;
endmodule