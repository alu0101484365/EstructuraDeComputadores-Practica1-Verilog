// Implementa un “Full-Adder” usando asignación continua y el operador concatenación ‘{…}’

module fa(output wire c_out, sum, input wire a, b, c_in);
    assign {c_out, sum} = a + b + c_in;
endmodule

// Al sumar los tres bits (a + b + c_in), el valor máximo posible es 1 + 1 + 1 = 3 (que en binario de 2 bits es 2'b11):
// El bit más significativo (peso 2) va automáticamente a c_out.
// El bit menos significativo (peso 1) va a sum.