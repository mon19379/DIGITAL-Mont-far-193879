module testbench();
 reg clk, rst, EN, EB1, EB2;
reg [3:0] in;
reg [2:0] S;
wire C, Z;
wire [3:0] Ou;

uni r(clk, rst, EN, EB1, EB2, in, S, C, Z, Ou);


  always
  #2 clk <= ~clk;
  initial begin
    $display("Lab10_Ej2");
    $display("clk rst EN EB1 EB2 in   S    |C Z Ou");
    $display("---------------------------------|----------------");
    $monitor("%b   %b   %b   %b    %b   %b   %b  |%b %b %b", clk, rst, EN, EB1, EB2, in, S, C, Z, Ou);
    rst=0; clk=0; EN = 0; EB1 = 0; EB2 = 0; in = 3; S= 3'b010;
    #4 rst = 1;
    #4 rst = 0;
    #4 EB2 = 1; EB1 = 1; EN = 1;
    #4 S = 3'b000; in = 2;  //Se debe de seguir mostrando el 3 en la tabla
    #4 in =2; EN = 0;
    #4 S = 3'b001;
    #4 S = 3'b011;
    #4 S = 3'b100;


  end
  initial
  #36 $finish;
  initial begin
    $dumpfile("Ejercicio2_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule
