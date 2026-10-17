/**
 * Módulo capaz de cambiar el signo de un número en complemento a 1. El módulo debe incluir
 * una señal de control cpl, de manera que podamos elegir entre dejar pasar el dato sin modificar o calcular
 *el número cambiado de signo.
 * Si cpl = 1, Out = Inv(Inp) y si no, Out = Inp
*/

module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);
    
    assign Out = (cpl == 1'b1) ? ~Inp : Inp;

endmodule