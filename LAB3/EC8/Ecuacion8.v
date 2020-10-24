//Francisco Montúfar #19379
//Archivo de la POS de la tabla 4

module Ecuacion8();

reg A;
reg B;
reg C;
reg D;  //Se crean las variables de entrada, en este caso A, B, C y D

wire sal1;
wire sal2;
wire sal3;
wire sal4; // variables de las salidas, en este caso son las salidas de los NOT
wire sal5;
wire sal6;
wire sal7;
wire sal8;
wire sal9;
wire sal10;
wire sal11;
wire sal12;
wire sal13; //variables de salida del OR
wire Y;     //variable de salida del AND

not s0(sal1, A);
not s1(sal2, B);
not s2(sal3, C); //comandos para realizar la operacion de la compuerta
not s3(sal4, D); //en este caso son NOT, la estructura es [Compuerta nombre(salida,entrada(s))]

or s4(sal5, A, B, C, sal4);
or s5(sal6, A, sal2, C, D);
or s6(sal7, A, sal2, C, sal4);
or s7(sal8, sal1, B, C, sal4);
or s8 (sal9, sal1, B, sal3, sal4);
or s9(sal10, sal1, sal2, C, D);
or s10 (sal11, sal1, sal2, C, sal4);
or s11 (sal12, sal1, sal2, sal3, D); //comandos para realizar operacion
or s12 (sal13, sal1, sal2, sal3, sal4); //en este caso es OR

and s13(Y, sal5, sal6, sal7, sal8, sal9, sal10, sal11, sal12, sal13);  //comando para el AND, ojo: se usan de entradas las salidas de los anteriores

// iniciar operaciones
initial begin

  $display("A B C D | Y"); // se agrega un formato para facilitar comprension
  $display("------------");

  $monitor("%b %b %b %b | %b", A, B, C, D, Y); //monitorea las variables con el formato dado
  A = 0; B = 0; C = 0; D = 0;  //condiciones iniciales de las entradas
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 A = 1; B = 0; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1;  D = 0;
  #1 D = 1;
  #1 $finish;
end

//habilitar GTKWave
  initial
      begin
          $dumpfile("Ecuacion8_tb.vcd");
          $dumpvars (0, Ecuacion8);
      end
endmodule
