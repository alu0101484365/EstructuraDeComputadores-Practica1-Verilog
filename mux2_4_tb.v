// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module mux2_4_tb;

//declaracion de se�ales
wire[3:0] test_out;
reg test_s;
reg[3:0] test_a, test_b;

//instancia del modulo a testear
mux2_4 mux(test_out, test_a, test_b, test_s);

initial
begin
  $monitor("tiempo=%0d a=%b b=%b s=%b -> out=%b", $time, test_a, test_b, test_s, test_out);
  $dumpfile("mux2_4.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_s = 1'b0;
  test_a = 4'b0001;
  test_b = 4'b0000;
  # 20;
  
  test_s = 1'b1;
  test_a = 4'b0000;
  test_b = 4'b0101;
  # 20;
  
  test_s = 1'b0;
  test_a = 4'b1111;
  test_b = 4'b0000;
  # 20;
 
  test_s = 1'b1;
  test_a = 4'b0000;
  test_b = 4'b1110;
  # 20;
  
  test_s = 1'b0;
  test_a = 4'b1001;
  test_b = 4'b0000;
  # 20;
  
  //fin simulacion
  $finish;
end

endmodule
