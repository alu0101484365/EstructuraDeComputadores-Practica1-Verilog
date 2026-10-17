/**
 * Diseña el módulo que se encarga de calcular los flags de la ALU: acarreo (carry), cero (zero) y signo (sign):
 * ● zero tiene valor de 1 si el resultado fue 0 (R == 0)
 * ● sign tomará el valor del bit más significativo de R
 * ● carry será 1 si hubo acarreo en la operación aritmética realizada
 * Los bits de acarreo y signo no importan en las operaciones lógicas, así que se pueden dejar conectados igual que en las operaciones aritméticas.
*/
module flags(output wire carry, zero, sign, input wire [3:0] R, input wire c_out);
    assign zero = (R == 4'b0000);
    assign sign = R[3];
    assign carry = (c_out == 1'b1); // carry = c_out
endmodule