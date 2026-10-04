// Implementar celda lógica que calculará sobre los bits a y b las operaciones lógicas inversión del bit a, and, or y xor
// cuando el vector de dos bits S vale 00, 01, 10 y 11 respectivamente

module cl(output wire out, input wire a, b, input wire [1:0] S);
    wire w_not, w_and, w_or, w_xor;
    assign w_not = ~a;
    assign w_and = a & b;
    assign w_or = a | b;
    assign w_xor = a ^ b;
    /* 
    * Otra manera:
    * not g1(w_not, a); and g2(w_and, a, b); or g3(w_or, a, b); xor g4(w_xor, a, b);
    */
    mux4_1 mux(out, w_not, w_and, w_or, w_xor, S);
endmodule