//LAB 5
//FRANCISCO MONTÚFAR 19379


//mux2:1
module mux2a1(input wire  d0, d1,  //mux2:1 (entradas)
                    input wire s, //entrada (selector)
                  output wire y); //salida

assign y = s ? d1 : d0;

endmodule


//mux4:1 implementado con un 2:1
module mux4a1(input wire d0, d1, d2, d3,
                      input wire s0, s1,
                         output wire y);

wire l1,h1 ;

mux2a1  lowmux(d0, d1, s0, l1);
mux2a1  highmux(d2, d3, s0, h1);
mux2a1  outmux(l1, h1, s1, y);

endmodule


//mux8:1 implementado con 4:1

module mux8a1(input wire d0, d1, d2, d3, d4, d5, d6, d7,
                                   input wire s, s1, s2,
                                         output wire y);
wire sal1, sal2;

mux4a1  fun1(d0, d1, d2, d3, s, s1, sal1);
mux4a1  fun2(d4, d5, d6, d7, s, s1, sal2);
mux2a1  fun3(sal1, sal2, s2, y);

endmodule


//tabla 01 con multiplexores

//tabla 01 con mux8:1

module t1mux8a1(input wire A, B, C, output wire Y);

wire l, h;

assign l = 0;
assign h = 1;


mux8a1 fun1(l, h, h, l, h, l, l, h, C, B, A, Y);

endmodule

//tabla 01 con mux4:1

module t1mux4a1(input wire A, B, C, output wire y);

mux4a1 f1(C, ~C, ~C, C, B, A, y);

endmodule

//tabla 01 con mux2:1

module t1mux2a1(input wire A, B, C, output wire y);

mux2a1 c1(B^C, B~^C, A, y);

endmodule

// tabla 02 con multiplexores

//tabla 02 con mux8:1

module t2mux8a1(input wire A, B, C, output wire y);

wire l, h;

assign l = 0;
assign h = 1;

mux8a1 fun2(h, h, l, l, h, h, h, l, C, B, A, y);

endmodule

// tabla 02 con mux4:1

module t2mux4a1(input wire A, B, C, output wire y);

wire l;
assign l = 0;

mux4a1 f2(~C, l, C, ~C, B, A, y);

endmodule

//tabla 02 con mux 2:1

module t2mux2a1(input wire A, B, C, output wire y);

mux2a1 b2(B~|C, B~&C, A, y);

endmodule
