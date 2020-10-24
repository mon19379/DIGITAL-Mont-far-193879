//Francisco Montúfar
//carnet 19379


module testbench();
reg a1, a2, a3; // entradas mux8:1 tabla1
reg a4, a5, a6; //entradas mux4:1 tabla1
reg a7, a8, a9;// entradas mux2:1 tabla1

reg b1, b2, b3;// entradas mux8:1 tabla2
reg b4, b5, b6; //entradas mux 4:1 tabla2
reg b7, b8, b9; // entrads mux 2:1 tabla2

wire s1, s2, s3, s4, s5, s6; //salidas

//mux tabla 1

t1mux8a1  m81(a1, a2, a3, s1);
t1mux4a1  m41(a4, a5, a6, s2);
t1mux2a1  m21(a7, a8, a9, s3);

t2mux8a1  x81(b1, b2, b3, s4);
t2mux4a1  x41(b4, b5, b6, s5);
t2mux2a1  x21(b7, b8, b9, s6);


initial begin //mux 8:1 tabla1

$display("Tabla 1, mux 8:1");
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


initial begin//mux 4:1 tabla 1

    #9
    $display("\n");
    $display("Tabla 1, mux 4:1");
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


initial begin//mux2:1 tabla1

    #17
    $display("\n");
    $display("Tabla 1, mux2:1");
    $display("A B C | Y");
    $display("--------|---");
    $monitor("%b %b %b  | %b", a7, a8, a9, s3);
      a7 = 0; a8 = 0; a9 = 0;
    #1 a7 = 0; a8 = 0; a9 = 1;
    #1 a7 = 0; a8 = 1; a9 = 0;
    #1 a7 = 0; a8 = 1; a9 = 1;
    #1 a7 = 1; a8 = 0; a9 = 0;
    #1 a7 = 1; a8 = 0; a9 = 1;
    #1 a7 = 1; a8 = 1; a9 = 0;
    #1 a7 = 1; a8 = 1; a9 = 1;
end //Termina en 24



initial begin //mux8:1 tabla2
  #25
  $display("\n");
  $display("Tabla 2, mux8:1");
  $display("A B C | Y");
  $display("--------|---");
  $monitor("%b %b %b | %b", b1, b2, b3, s4);
    b1 = 0; b2 = 0; b3 = 0;
  #1 b1 = 0; b2 = 0; b3 = 1;
  #1 b1 = 0; b2 = 1; b3 = 0;
  #1 b1 = 0; b2 = 1; b3 = 1;
  #1 b1 = 1; b2 = 0; b3 = 0;
  #1 b1 = 1; b2 = 0; b3 = 1;
  #1 b1 = 1; b2 = 1; b3 = 0;
  #1 b1 = 1; b2 = 1; b3 = 1;

end//termina en 32

initial begin //mux4:1 tabla 2
  #33
  $display("\n");
  $display("Tabla 2, mux4:1");
  $display("A B C | Y");
  $display("--------|---");
  $monitor("%b %b %b | %b", b4, b5, b6, s5);
    b4 = 0; b5 = 0; b6 = 0;
  #1 b4 = 0; b5 = 0; b6 = 1;
  #1 b4 = 0; b5 = 1; b6 = 0;
  #1 b4 = 0; b5 = 1; b6 = 1;
  #1 b4 = 1; b5 = 0; b6 = 0;
  #1 b4 = 1; b5 = 0; b6 = 1;
  #1 b4 = 1; b5 = 1; b6 = 0;
  #1 b4 = 1; b5 = 1; b6 = 1;

end//termina en 40

initial begin //tabla 6
  #41
  $display("\n");
  $display("Tabla 2, mux2:1");
  $display("A B C | Y");
  $display("--------|---");
  $monitor("%b %b %b | %b", b7, b8, b9, s6);
    b7 = 0; b8 = 0; b9 = 0;
  #1 b7 = 0; b8 = 0; b9 = 1;
  #1 b7 = 0; b8 = 1; b9 = 0;
  #1 b7 = 0; b8 = 1; b9 = 1;
  #1 b7 = 1; b8 = 0; b9 = 0;
  #1 b7 = 1; b8 = 0; b9 = 1;
  #1 b7 = 1; b8 = 1; b9 = 0;
  #1 b7 = 1; b8 = 1; b9 = 1;

end//termina en 48

initial
        #49 $finish;

    initial begin
        $dumpfile("lab5_tb.vcd");
        $dumpvars(0, testbench);
    end
endmodule
