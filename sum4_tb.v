// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module sum4_tb;

//declaracion de se�ales
reg[3:0] test_a, test_b;
reg test_c_in;
wire test_c_out;
wire[3:0] test_s;

//instancia del modulo a testear
sum4 sum4_1(test_s, test_c_out, test_a, test_b, test_c_in);

initial
begin
  $monitor("tiempo=%0d a=%b b=%b c=%b out=%b sum=%b", $time, test_a, test_b, test_c_in, test_c_out, test_s);
  $dumpfile("sum4.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_c_in = 1'b0;
  test_a = 4'b0000;
  test_b = 4'b0000;
  # 20;
  
  test_c_in = 1'b0;
  test_a = 4'b0011;
  test_b = 4'b0101;
  # 20;

  test_c_in = 1'b0;
  test_a = 4'b0111;
  test_b = 4'b0001;
  # 20;

  test_c_in = 1'b1;
  test_a = 4'b1111;
  test_b = 4'b0000;
  # 20;

  test_c_in = 1'b1;
  test_a = 4'b1111;
  test_b = 4'b1111;
  # 20;

  //fin simulacion
  $finish;
end

endmodule
