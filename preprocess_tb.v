// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module preprocess_tb;

//declaracion de se�ales
reg [3:0] test_a, test_b;
reg [2:0] test_op;
wire test_add1;
wire[3:0] test_a_mod, test_b_mod;

//instancia del modulo a testear
preprocess preprocess1(test_a_mod, test_b_mod, test_add1, test_a, test_b, test_op);

initial
begin
  $monitor("tiempo=%0d Op=%b a=%b b=%b aMod=%b bMod=%b add1=%b", $time, test_op, test_a, test_b, test_a_mod, test_b_mod, test_add1);
  $dumpfile("preprocess.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_a = 4'b0101;
  test_b = 4'b0011;
  
  test_op = 3'b000; // Identidad
  #20;

  test_op = 3'b001; // Negativo de A
  #20;

  test_op = 3'b010; // Suma
  #20;

  test_op = 3'b011; // Resta
  #20;

  test_op = 3'b100; // Lógica: negación bit a bit de A
  #20;

  //fin simulacion
  $finish;
end

endmodule
