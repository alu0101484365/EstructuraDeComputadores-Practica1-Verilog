// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module flags_tb;

//declaracion de se�ales
reg[3:0] test_r;
reg test_c_out;
wire test_carry, test_zero, test_sign;

//instancia del modulo a testear
flags flag1(test_carry, test_zero, test_sign, test_r, test_c_out);

initial
begin
  $monitor("tiempo=%0d c_out=%b R=%b -> carry=%b zero=%b sign=%b", $time, test_c_out, test_r, test_sign, test_zero, test_carry);
  $dumpfile("flags.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_c_out = 1'b0;
  test_r = 4'b0000;
  # 20;
  
  test_c_out = 1'b1;
  test_r = 4'b1110;
  # 20;
  
  test_c_out = 1'b0;
  test_r = 4'b1010;
  # 20;
 
  test_c_out = 1'b1;
  test_r = 4'b0001;
  # 20;
  
  //fin simulacion
  $finish;
end

endmodule
