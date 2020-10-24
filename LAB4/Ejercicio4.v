//Francisco Montúfar
//Carnet 19379
//Ejercicio 4

//Ecuacion1, ejercicio 1

module Ecuacion1(input wire A, B, C, output wire Y);

  wire sal1;
  wire sal2;
  wire sal3; //variables de salidad de los not
  wire sal4;
  wire sal5;
  wire sal6; //variables de salida de los AND

  not s0(sal1, A);
  not s1(sal2, B);
  not s2(sal3, C); //comandos para realizar la operación de la compuerta

  and s3(sal4, sal1, sal3);
  and s4(sal5, A, C);
  and s5(sal6, A, sal2);

  or s6(Y, sal4, sal5, sal6);
endmodule


//Ecuacion 2, ejercicio 1
module Ecuacion2(input wire A, B, C, output wire Y);

  not s1(Y, B); //comandos para realizar la operación de la compuerta

endmodule

//Ecuacion 3, ejercicio 1
module Ecuacion3(input wire A, B, C, D, output wire Y);

  wire sal1;
  wire sal2;
  wire sal3;
  wire sal4; //variables de salida de los NOT
  wire sal5;
  wire sal6;
  wire sal7;
  wire sal8;
  wire sal9;
  wire sal10;
  wire sal11;
  wire sal12; //variables de salida de los AND


  not s0(sal1, A);
  not s1(sal2, B);
  not s2(sal3, C);
  not s3(sal4, D); //comandos para realizar la operación de la compuerta

  and s4(sal5, sal1, sal2, sal3, sal4);
  and s5(sal6, sal1, B, sal3, D);
  and s6(sal7, sal1, sal2, C, D);
  and s7(sal8, sal1, B, C, sal4);
  and s8(sal9, A, B, sal3, sal4);
  and s9(sal10, A, B, C, D);
  and s10(sal11, A, sal2, sal3, D);
  and s11(sal12, A, sal2, C, sal4);

  or s12(Y, sal5, sal6, sal7, sal8, sal9, sal10, sal11, sal12);

endmodule

//Ecuacion4, ejercicio 1

module Ecuacion4(input wire A, B, C, D, output wire Y);

  wire sal1; //variables de salida de los NOT
  wire sal2;
  wire sal3;
  wire sal4; //variables de salida de los AND


  not s0(sal1, D);

  and s1(sal2, B, D);
  and s2(sal3, A, sal1);
  and s3(sal4, A, C);

  or s4(Y, sal2, sal3, sal4);

endmodule

//Ecuacion1, ejericio 2

module Ecuacion5(input wire A, B, C, D, output wire Y);

  assign Y = (A & ~C) | (~B & ~C & ~D) | (A & ~B) | (A & ~D);

endmodule

//Ecuacion 2, ejercicio 2

module Ecuacion6(input wire A, B, C, output wire Y);

  assign Y = ~B | C;

endmodule

//Ecuacion 3, ejercicio 2

module Ecuacion7(input wire A, B, C, D, output wire Y);

  assign Y = (~C & D) | B | (A & D);

endmodule

//Ecuacion 4, ejercicio 2

module Ecuacion8(input wire A, B, C, output wire Y);

  assign Y = (~A & ~C) | B;

endmodule

//Ecuacion minimizada ejercicio 5

module Ecuacionmin(input wire A, B, C, output wire Y);

  assign Y = (A & ~B) | (A & C);

endmodule

//Ecuacion SOP ejercicio 5

module SOP(input wire A, B, C, output wire Y);

  assign Y = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);

endmodule

//Ecuacion POS  ejercicio 5

module POS(input wire A, B, C, output wire Y);

  assign Y = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (A | ~B | ~C) & (~A | ~B | C);

endmodule

//Ecuacion minimizada, ejercicio 5

module Gmin(input wire A, B, C, output wire Y);

  wire sal1; //variables de salida del NOT
  wire sal2;
  wire sal3; //variable de salida de los AND

  not s0(sal1, B);

  and s1(sal2, A, sal1);
  and s2(sal3, A, C);

  or s3(Y, sal2, sal3);

endmodule


//SOP ejercicio 5

module GSOP(input wire A, B, C, output wire Y);

  wire sal1;
  wire sal2; //variables de salida del NOT
  wire sal3;
  wire sal4;
  wire sal5;//variables de salida de los and


  not s0(sal1, B);
  not s1(sal2, C);

  and s2(sal3, A, sal1, sal2);
  and s3(sal4, A, sal1, C);
  and s4(sal5, A, B, C);

  or s5(Y, sal3, sal4, sal5);

endmodule

//POS ejercicio 5

module GPOS(input wire A, B, C, output wire Y);

  wire sal1;
  wire sal2;
  wire sal3; //variables de salida de los NOT
  wire sal4;
  wire sal5;
  wire sal6;
  wire sal7;
  wire sal8; //variables de salida de los OR

  not s0(sal1, A);
  not s1(sal2, B);
  not s2(sal3, C);

  or s4(sal4, A, B, C, D);
  or s5(sal5, A, B, sal3);
  or s6(sal6, A, sal2, C);
  or s7(sal7, A, sal2, sal3);
  or s8(sal8, sal1, sal2, C);

  and s9(Y, sal4, sal5, sal6, sal7, sal8);

endmodule
