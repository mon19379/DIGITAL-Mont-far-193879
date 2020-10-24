//Francisco Montúfar
//Carnet 19379
//Ejercicio 4



module testbench();

  reg a1, a2, a3; // entradas modulo 1
  reg a4, a5, a6; //entradas modulo 2
  reg a7, a8, a9, a10;// entradas modulo 3
  reg a11, a12, a13, a14;// entradas modulo 4
  reg b1, b2, b3, b4; // entradas modulo 5
  reg b5, b6, b7; // entradas modulo 6
  reg b8, b9, b10, b11; //entradas modulo 7
  reg b12, b13, b14; //entradas modulo 8
  reg c1, c2, c3; //entradas modulo 9
  reg c4, c5, c6;
  reg c7, c8, c9;
  wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11; //salidas

//Tablas ejercicio 1

    Ecuacion1     e1(a1, a2, a3, s1); //configuracion del modulo[(nombre modulo)(entradas, salida)]
    Ecuacion2     e2(a4, a5, a6, s2);
    Ecuacion3     e3(a7, a8, a9, a10, s3);
    Ecuacion4     e4(a11, a12, a13, a14, s4);

//Tablas ejercicio 2

    Ecuacion5     d5(b1, b2, b3, b4, s5);
    Ecuacion6     d6(b5, b6, b7, s6);
    Ecuacion7     d7(b8, b9, b10, b11, s7);
    Ecuacion8     d8(b12, b13, b14, s8);
    Ecuacionmin   d9(c1, c2, c3, s9);
    SOP           d10(c4, c5, c6, s10);
    POS           d11(c7, c8, c9, s11);

//Inicio de las primeras 4 ecuaciones

initial begin //tabla 1

    $display("Tabla 1, ejercicio 1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", a1, a2, a3, s1);
      a1 = 0; a2 = 0; a3 = 0;
    #1 a1 = 0; a2 = 0; a3 = 1;
    #1 a1 = 0; a2 = 1; a3 = 0;
    #1 a1 = 0; a2 = 1; a3 = 1;
    #1 a1 = 1; a2 = 0; a3 = 0;
    #1 a1 = 1; a2 = 0; a3 = 1;
    #1 a1 = 1; a2 = 1; a3 = 0;
    #1 a1 = 1; a2 = 1; a3 = 1;
end //Termina en 8

initial begin//tabla 2

    #9
    $display("\n");
    $display("Tabla 2, ejercicio 1");
    $display("A B C | Y");
    $display("--------|---");
    $monitor("%b %b %b  | %b", a4, a5, a6, s2);
      a4 = 0; a5 = 0; a6 = 0;
    #1 a4 = 0; a5 = 0; a6 = 1;
    #1 a4 = 0; a5 = 1; a6 = 0;
    #1 a4 = 0; a5 = 1; a6 = 1;
    #1 a4 = 1; a5 = 0; a6 = 0;
    #1 a4 = 1; a5 = 0; a6 = 1;
    #1 a4 = 1; a5 = 1; a6 = 0;
    #1 a4 = 1; a5 = 1; a6 = 1;
end //Termina en 16

initial begin//tabla 3

    #17
    $display("\n");
    $display("Tabla 3, ejercicio 1");
    $display("A B C D | Y");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", a7, a8, a9, a10, s3);
      a7 = 0; a8 = 0; a9 = 0; a10 = 0;
    #1 a7 = 0; a8 = 0; a9 = 0; a10 = 1;
    #1 a7 = 0; a8 = 0; a9 = 1; a10 = 0;
    #1 a7 = 0; a8 = 0; a9 = 1; a10 = 1;
    #1 a7 = 0; a8 = 1; a9 = 0; a10 = 0;
    #1 a7 = 0; a8 = 1; a9 = 0; a10 = 1;
    #1 a7 = 0; a8 = 1; a9 = 1; a10 = 0;
    #1 a7 = 0; a8 = 1; a9 = 1; a10 = 1;
    #1 a7 = 1; a8 = 0; a9 = 0; a10 = 0;
    #1 a7 = 1; a8 = 0; a9 = 0; a10 = 1;
    #1 a7 = 1; a8 = 0; a9 = 1; a10 = 0;
    #1 a7 = 1; a8 = 0; a9 = 1; a10 = 1;
    #1 a7 = 1; a8 = 1; a9 = 0; a10 = 0;
    #1 a7 = 1; a8 = 1; a9 = 0; a10 = 1;
    #1 a7 = 1; a8 = 1; a9 = 1; a10 = 0;
    #1 a7 = 1; a8 = 1; a9 = 1; a10 = 1;
end// termina en 32

initial begin //tabla 4

  #33
  $display("\n");
  $display("Tabla 4, ejercicio 1");
  $display("A B C D | Y");
  $display("--------|---");
  $monitor("%b %b %b %b | %b", a11, a12, a13, a14, s4);
    a11 = 0; a12 = 0; a13 = 0; a14 = 0;
  #1 a11 = 0; a12 = 0; a13 = 0; a14 = 1;
  #1 a11 = 0; a12 = 0; a13 = 1; a14 = 0;
  #1 a11 = 0; a12 = 0; a13 = 1; a14 = 1;
  #1 a11 = 0; a12 = 1; a13 = 0; a14 = 0;
  #1 a11 = 0; a12 = 1; a13 = 0; a14 = 1;
  #1 a11 = 0; a12 = 1; a13 = 1; a14 = 0;
  #1 a11 = 0; a12 = 1; a13 = 1; a14 = 1;
  #1 a11 = 1; a12 = 0; a13 = 0; a14 = 0;
  #1 a11 = 1; a12 = 0; a13 = 0; a14 = 1;
  #1 a11 = 1; a12 = 0; a13 = 1; a14 = 0;
  #1 a11 = 1; a12 = 0; a13 = 1; a14 = 1;
  #1 a11 = 1; a12 = 1; a13 = 0; a14 = 0;
  #1 a11 = 1; a12 = 1; a13 = 0; a14 = 1;
  #1 a11 = 1; a12 = 1; a13 = 1; a14 = 0;
  #1 a11 = 1; a12 = 1; a13 = 1; a14 = 1;
end// termina en 48

initial begin //tabla 5
  #49
  $display("\n");
  $display("Tabla 1, ejercicio 2");
  $display("A B C D | Y");
  $display("--------|---");
  $monitor("%b %b %b %b | %b", b1, b2, b3, b4, s5);
    b1 = 0; b2 = 0; b3 = 0; b4 = 0;
  #1 b1 = 0; b2 = 0; b3 = 0; b4 = 1;
  #1 b1 = 0; b2 = 0; b3 = 1; b4 = 0;
  #1 b1 = 0; b2 = 0; b3 = 1; b4 = 1;
  #1 b1 = 0; b2 = 1; b3 = 0; b4 = 0;
  #1 b1 = 0; b2 = 1; b3 = 0; b4 = 1;
  #1 b1 = 0; b2 = 1; b3 = 1; b4 = 0;
  #1 b1 = 0; b2 = 1; b3 = 1; b4 = 1;
  #1 b1 = 1; b2 = 0; b3 = 0; b4 = 0;
  #1 b1 = 1; b2 = 0; b3 = 0; b4 = 1;
  #1 b1 = 1; b2 = 0; b3 = 1; b4 = 0;
  #1 b1 = 1; b2 = 0; b3 = 1; b4 = 1;
  #1 b1 = 1; b2 = 1; b3 = 0; b4 = 0;
  #1 b1 = 1; b2 = 1; b3 = 0; b4 = 1;
  #1 b1 = 1; b2 = 1; b3 = 1; b4 = 0;
  #1 b1 = 1; b2 = 1; b3 = 1; b4 = 1;
end// termina en 64

initial begin //tabla 6
  #65
  $display("\n");
  $display("Tabla 2, ejercicio 2");
  $display("A B C | Y");
  $display("--------|---");
  $monitor("%b %b %b | %b", b5, b6, b7, s6);
    b5 = 0; b6 = 0; b7 = 0;
  #1 b5 = 0; b6 = 0; b7 = 1;
  #1 b5 = 0; b6 = 1; b7 = 0;
  #1 b5 = 0; b6 = 1; b7 = 1;
  #1 b5 = 1; b6 = 0; b7 = 0;
  #1 b5 = 1; b6 = 0; b7 = 1;
  #1 b5 = 1; b6 = 1; b7 = 0;
  #1 b5 = 1; b6 = 1; b7 = 1;

end//termina en 72

initial begin//tabla 7

  #73
  $display("\n");
  $display("Tabla 3, ejercicio 2");
  $display("A B C D | Y");
  $display("--------|---");
  $monitor("%b %b %b %b | %b", b8, b9, b10, b11, s7);
      b8 = 0; b9 = 0; b10 = 0; b11 = 0;
  #1 b8 = 0; b9 = 0; b10 = 0; b11 = 1;
  #1 b8 = 0; b9 = 0; b10 = 1; b11 = 0;
  #1 b8 = 0; b9 = 0; b10 = 1; b11 = 1;
  #1 b8 = 0; b9 = 1; b10 = 0; b11 = 0;
  #1 b8 = 0; b9 = 1; b10 = 0; b11 = 1;
  #1 b8 = 0; b9 = 1; b10 = 1; b11 = 0;
  #1 b8 = 0; b9 = 1; b10 = 1; b11 = 1;
  #1 b8 = 1; b9 = 0; b10 = 0; b11 = 0;
  #1 b8 = 1; b9 = 0; b10 = 0; b11 = 1;
  #1 b8 = 1; b9 = 0; b10 = 1; b11 = 0;
  #1 b8 = 1; b9 = 0; b10 = 1; b11 = 1;
  #1 b8 = 1; b9 = 1; b10 = 0; b11 = 0;
  #1 b8 = 1; b9 = 1; b10 = 0; b11 = 1;
  #1 b8 = 1; b9 = 1; b10 = 1; b11 = 0;
  #1 b8 = 1; b9 = 1; b10 = 1; b11 = 1;
end// termina en 88

initial begin //tabla 8

  #89
  $display("\n");
  $display("Tabla , ejercicio 2");
  $display("A B C | Y");
  $display("--------|---");
  $monitor("%b %b %b | %b", b12, b13, b14, s8);
    b12 = 0; b13 = 0; b14 = 0;
  #1 b12 = 0; b13 = 0; b14 = 1;
  #1 b12 = 0; b13 = 1; b14 = 0;
  #1 b12 = 0; b13 = 1; b14 = 1;
  #1 b12 = 1; b13 = 0; b14 = 0;
  #1 b12 = 1; b13 = 0; b14 = 1;
  #1 b12 = 1; b13 = 1; b14 = 0;
  #1 b12 = 1; b13 = 1; b14 = 1;
end//termina en 96

initial begin //tabla 9

  #97
  $display("\n");
  $display("Tabla 1, ejercicio 5");
  $display("A B C | Y");
  $display("---------|---");
  $monitor("%b %b %b | %b", c1, c2, c3, s9,);
    c1 = 0; c2 = 0; c3 = 0;
  #1 c1 = 0; c2 = 0; c3 = 1;
  #1 c1 = 0; c2 = 1; c3 = 0;
  #1 c1 = 0; c2 = 1; c3 = 1;
  #1 c1 = 1; c2 = 0; c3 = 0;
  #1 c1 = 1; c2 = 0; c3 = 1;
  #1 c1 = 1; c2 = 1; c3 = 0;
  #1 c1 = 1; c2 = 1; c3 = 1;
end//termina en 104


initial begin //tabla 10

  #105
  $display("\n");
  $display("Tabla 2, ejercicio 5");
  $display("A B C | Y");
  $display("---------|---");
  $monitor("%b %b %b | %b", c4, c5, c6, s10);
    c4 = 0; c5 = 0; c6 = 0;
  #1 c4 = 0; c5 = 0; c6 = 1;
  #1 c4 = 0; c5 = 1; c6 = 0;
  #1 c4 = 0; c5 = 1; c6 = 1;
  #1 c4 = 1; c5 = 0; c6 = 0;
  #1 c4 = 1; c5 = 0; c6 = 1;
  #1 c4 = 1; c5 = 1; c6 = 0;
  #1 c4 = 1; c5 = 1; c6 = 1;
end//termina en 112


initial begin

  #113
  $display("\n");
  $display("Tabla 3, ejercicio 5");
  $display("A B C | Y");
  $display("---------|---");
  $monitor("%b %b %b | %b", c7, c8, c9, s11);
     c7 = 0; c8 = 0; c9 = 0;
  #1 c7 = 0; c8 = 0; c9 = 1;
  #1 c7 = 0; c8 = 1; c9 = 0;
  #1 c7 = 0; c8 = 1; c9 = 1;
  #1 c7 = 1; c8 = 0; c9 = 0;
  #1 c7 = 1; c8 = 0; c9 = 1;
  #1 c7 = 1; c8 = 1; c9 = 0;
  #1 c7 = 1; c8 = 1; c9 = 1;

end//termina en 120


initial
        #121 $finish;

    initial begin
        $dumpfile("Ejercicio4_tb.vcd");
        $dumpvars(0, testbench);
    end
endmodule
