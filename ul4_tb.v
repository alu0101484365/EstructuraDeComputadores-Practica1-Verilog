// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module ul4_tb;

//declaracion de se�ales
wire[3:0] test_out;
reg[3:0] test_a, test_b;
reg[1:0] test_s;

//instancia del modulo a testear
ul4 ul1(test_out, test_a, test_b, test_s);

initial
begin
  $monitor("tiempo=%0d a=%b b=%b s=%b -> out=%b", $time, test_a, test_b, test_s, test_out);
  $dumpfile("ul4.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_s = 2'b00;
  test_a = 4'b0000;
  test_b = 4'b0000;
  # 20;
  
  test_s = 2'b01;
  test_a = 4'b0000;
  test_b = 4'b0001;
  # 20;
  
  test_s = 2'b10;
  test_a = 4'b0001;
  test_b = 4'b0000;
  # 20;
 
  test_s = 2'b11;
  test_a = 4'b0001;
  test_b = 4'b0001;
  # 20;

  test_s = 2'b00;
  test_a = 4'b0010;
  test_b = 4'b0000;
  # 20;

  //fin simulacion
  $finish;
end

endmodule
