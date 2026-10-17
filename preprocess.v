/**
 * En este módulo, las salidas AMod y BMod son modificaciones de A y B cuyo valor final depende de las
 * entradas de control a cada multiplexor y al negador en complemento a 1. La nube en rojo representa la
 * lógica que hay que implementar para, a partir de la señal general de control de la ALU (Op), calcular las
 * señales de control específicas que permiten modificar los operandos. Tres de esas señales sólo se usan
 * internamente en el módulo, pero add1 es una salida que se conectará a la entrada de c_in del sumador
 * que diseñaste, de manera que puedas sumar una unidad adicional.
 * 
 * En el caso de que vayamos a realizar una operación lógica, debemos configurar las señales de control
 * (op1_A, op2_B, cpl) para que AMod = A y BMod = B. Para las operaciones aritméticas que requieren la
 * negación de uno de sus operandos, necesitamos calcular ese número negativo en complemento a 2. Para
 * ello, calcularemos el negativo en complemento a 1 (cpl = 1) y nos aseguraremos de que se sume una
 * unidad adicional (add1 = 1). 
 * 
 * Para crear las funciones lógicas que determinan el valor de las señales de control (add1, op1_A, op2_B, cpl)
 * a partir del valor de Op, lo más recomendable es escribir las tablas de verdad de cada una y construir
 * mediante puertas o expresiones lógicas estas funciones.
*/

module preprocess(output wire [3:0] AMod, output wire [3:0] BMod, output wire add1, input wire [3:0] A, input wire [3:0] B, input wire [2:0] Op);
    // Instanciamos algunos cables internos
    wire op1_A, op2_B, cpl; 
    wire [3:0] mux_B_out;

    // Decodificador de control -> expresiones lógicas con assign
    assign cpl = ~Op[2] & Op[0];
    assign add1 = cpl; 
    assign op2_B = Op[2] | Op[1];
    assign op1_A = Op[2] | Op[1]; //| ~Op[0]; -> assign op1_A = (Op == 3'b001) ? 1'b0 : 1'b1;)

   
    assign AMod = (op1_A == 1'b1) ? A : 4'b0000; 
    assign mux_B_out = (op2_B == 1'b1) ? B : A;
    
    // Instancia del módulo complemento a 1
    compl1 cpl1(BMod, mux_B_out, cpl);

endmodule