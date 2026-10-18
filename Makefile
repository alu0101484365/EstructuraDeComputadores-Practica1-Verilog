# Lista de archivos fuente
SRCS = alu.v alu_tb_profe.v flags.v mux2_4.v preprocess.v sum4.v ul4.v cl.v compl1.v fa.v mux4_1.v
TARGET = alu.out

# Compila y ejecuta
all:
	iverilog -o $(TARGET) $(SRCS)

# Limpieza de archivos generados
clean:
# rm -f $(TARGET) *.vcd
	rm -f $(TARGET) alu.vcd
.PHONY: all clean
