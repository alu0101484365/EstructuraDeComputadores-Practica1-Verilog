// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module fa_tb;

//declaracion de se�ales
reg test_a, test_b, test_c_in;
wire test_c_out, test_sum;

//instancia del modulo a testear
fa fa_1(test_c_out, test_sum, test_a, test_b, test_c_in);

initial
begin
  $monitor("tiempo=%0d a=%b b=%b c=%b out=%b sum=%b", $time, test_a, test_b, test_c_in, test_c_out, test_sum);
  $dumpfile("fa.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_c_in = 1'b0;
  test_a = 1'b0;
  test_b = 1'b0;
  # 20;
  
  test_c_in = 1'b0;
  test_a = 1'b0;
  test_b = 1'b1;
  # 20;

  test_c_in = 1'b0;
  test_a = 1'b1;
  test_b = 1'b1;
  # 20;

  test_c_in = 1'b1;
  test_a = 1'b0;
  test_b = 1'b1;
  # 20;

  test_c_in = 1'b1;
  test_a = 1'b1;
  test_b = 1'b1;
  # 20;

  //fin simulacion
  $finish;
end

endmodule
