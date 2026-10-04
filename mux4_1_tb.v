// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module mux4_1_tb;

//declaracion de se�ales
wire test_out;
reg test_a, test_b, test_c, test_d;
reg[1:0] test_s;

//instancia del modulo a testear
mux4_1 mux(test_out, test_a, test_b, test_c, test_d, test_s);

initial
begin
  $monitor("tiempo=%0d a=%b b=%b c=%b d=%b s=%b -> out=%b", $time, test_a, test_b, test_c, test_d, test_s, test_out);
  $dumpfile("mux4_1.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_s = 2'b00;
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  
  test_s = 2'b01;
  test_a = 1'b0;
  test_b = 1'b1;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  
  test_s = 2'b10;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  # 20;
 
  test_s = 2'b11;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b1;
  # 20;
  
  test_s = 2'b00;
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  
  //fin simulacion
  $finish;
end

endmodule
