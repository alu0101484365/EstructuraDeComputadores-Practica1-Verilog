

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [2:0] Op);

    // Instanciamos los cables internos que nos permitirán conectar las salidas de los bloques
    wire [3:0] AMod, BMod, sum_out, ul_out;
    wire add1, c_out;

    preprocess preprocess_1(AMod, BMod, add1, A, B, Op);
    sum4 sum4_1(sum_out, c_out, AMod, BMod, add1);
    ul4 ul4_1(ul_out, AMod, BMod, Op[1:0]);
    mux2_4 mux_1(R, sum_out, ul_out, Op[2]);
    flags flags_1(carry, zero, sign, R, c_out);


endmodule