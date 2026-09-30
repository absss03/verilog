`timescale 1ns/1ps

module tb_generico;

    // 1. Parámetros y Señales Locales[cite: 1]
    localparam int CLK_PERIOD = 10;
    logic clk = 1'b0;
    logic rst_n;
    logic d_in;
    logic q_out;

    // 2. Generación de Reloj Continua[cite: 1]
    always #(CLK_PERIOD/2.0) clk = ~clk;

    // 3. Instanciación del DUT (Conexión por nombre)[cite: 7]
    mi_modulo u_dut (
        .clk   (clk),
        .rst_n (rst_n),
        .d_in  (d_in),
        .q_out (q_out)
    );

    // 4. Hilo Principal de Verificación[cite: 1]
    initial begin
        // Inicialización y pulso de Reset[cite: 1]
        rst_n = 1'b0;
        d_in  = 1'b0;
        #20ns;
        rst_n = 1'b1;

        // Inyección sincronizada con el reloj[cite: 1]
        @(posedge clk);
        d_in = 1'b1;
        
        @(posedge clk);
        d_in = 1'b0;

        #100ns;
        $display("Prueba finalizada");
        $finish; // Comando nativo para detener el simulador[cite: 1]
    end

endmodule