// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module cl_tb;

//declaracion de se�ales
wire test_out;
reg test_a, test_b;
reg[1:0] test_s;
//instancia del modulo a testear
cl cl1(test_out, test_a, test_b, test_s);

initial
begin
  $monitor("tiempo=%0d a=%b b=%b s=%b -> out=%b", $time, test_a, test_b, test_s, test_out);
  $dumpfile("cl.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_s = 2'b00;
  test_a = 1'b0;
  test_b = 1'b0;
  # 20;
  
  test_s = 2'b01;
  test_a = 1'b0;
  test_b = 1'b1;
  # 20;
  
  test_s = 2'b10;
  test_a = 1'b1;
  test_b = 1'b0;
  # 20;
 
  test_s = 2'b11;
  test_a = 1'b1;
  test_b = 1'b1;
  # 20;
  //fin simulacion
  $finish;
end

endmodule
