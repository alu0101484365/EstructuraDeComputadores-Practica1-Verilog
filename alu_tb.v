// Testbench para sumador con predicci�n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module alu_tb;

//declaracion de se�ales
reg [3:0] test_a, test_b;
reg [2:0] test_op;
wire [3:0] test_r;
wire test_zero, test_carry, test_sign;

//instancia del modulo a testear
alu alu1(test_r, test_zero, test_carry, test_sign, test_a, test_b, test_op);

initial
begin
  $monitor("tiempo=%0d Op=%b a=%b b=%b | R=%b zero=%b carry=%b sign=%b", $time, test_op, test_a, test_b, test_r, test_zero, test_carry, test_sign);
  $dumpfile("alu.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_a = 4'b0101;
  test_b = 4'b0011;
  
  // OP. ARITMÉTICAS
  test_op = 3'b000; // R = A
  #20;

  test_op = 3'b001; // R = -A
  #20;

  test_op = 3'b010; // R = A + B
  #20; 

  test_op = 3'b011; // R = A - B
  #20; 

  // OP. LÓGICAS
  test_op = 3'b100; // R = ~A
  #20;

  test_op = 3'b101; // R = A & B
  #20;

  test_op = 3'b110; // R = A | B
  #20; 

  test_op = 3'b111; // R = XOR(A,B)
  #20; 

  //fin simulacion
  $finish;
end

endmodule
