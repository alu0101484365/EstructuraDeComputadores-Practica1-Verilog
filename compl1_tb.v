// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module cpl_tb;

//declaracion de se�ales
reg test_cpl;
reg[3:0] test_inp;
wire[3:0] test_out;

//instancia del modulo a testear
compl1 compl1_1(test_out, test_inp, test_cpl);

initial
begin
  $monitor("tiempo=%0d test_out=%b <- test_inp=%b test_cpl=%b", $time, test_out, test_inp, test_cpl);
  $dumpfile("cpl.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_cpl = 1'b0;
  test_inp = 4'b0111;
  # 20;
  
  test_cpl = 1'b0;
  test_inp = 4'b1000;
  # 20;

  test_cpl = 1'b1;
  test_inp = 4'b0111;
  # 20;
  
  test_cpl = 1'b1;
  test_inp = 4'b1000;
  # 20;

  //fin simulacion
  $finish;
end

endmodule
