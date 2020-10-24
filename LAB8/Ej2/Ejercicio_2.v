//ROM

module  memrom(input wire [11:0]D, output wire [7:0]Dout); //se indican las entradas y salidas

assign Dout = larom[D]; // se establece que lo que saca la memoria es lo mismo que le entra
reg [7:0]   larom[0:4095]; //se declara el width y el depth de la memoria

initial begin
  $readmemh("lista.memoria", larom); // se establece que se lea en hexadecimal lo del archivo (lo que entra) y salida
  end

endmodule
