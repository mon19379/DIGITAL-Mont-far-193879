//Francisco Montúfar #19379
//Archivo de la SOP de la tabla 2

module Ecuacion3(); //se crea el módulo

reg A;
reg B;
reg C; //Se crean las variables de entrada, en este caso A, B y C

wire sal1;
wire sal2;
wire sal3; // variables de las salidas, en este caso son las salidas de los NOT
wire sal4;
wire sal5;
wire sal6;// variables de salida de los AND
wire Y;   //variable de salida del OR

not s0(sal1, A);
not s1(sal2, B); //comandos para realizar la operacion de la compuerta
not s2(sal3, C); //en este caso son NOT, la estructura es [Compuerta nombre(salida,entrada(s))]

and s3(sal4, sal1, sal2, C);
and s4(sal5, A, B, sal3); //comandos para realizar operacion de compuerta
and s5(sal6, A, B, C);    //en este caso son AND

or s6(Y, sal4, sal5, sal6); //comando para el OR, ojo: se usan de entradas las salidas de los anteriores

// iniciar operaciones
initial begin

  $display("A B C | Y"); // se agrega un formato para facilitar comprension
  $display("------------");

  $monitor("%b %b %b | %b", A, B, C, Y); //monitorea las variables con el formato dado
  A = 0; B = 0; C = 0;  //condiciones iniciales de las entradas
  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 A = 1; B = 0; C = 0;  // se van cambiando los valores depende a la tabla
  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 $finish;
end


//habilitar GTKWave
  initial
      begin
          $dumpfile("Ecuacion3_tb.vcd");
          $dumpvars (0, Ecuacion3);
      end
endmodule
