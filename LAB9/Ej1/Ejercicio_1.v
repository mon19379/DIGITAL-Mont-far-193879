//Ejercicio 1
//Flip flop tipo D

module FlipF(input wire clk, reset, EN,
            input wire D,
            output reg Q);

always @ (posedge clk or posedge reset)begin
  if (reset) begin
      Q <= 1'b0;
  end
  else if (EN) begin
      Q <= D;
  end
  end

endmodule

module FlipF2(input wire clk, reset, EN,
              input wire [1:0]D,
              output wire [1:0]Q);

FlipF  f1(clk, reset, EN, D[0], Q[0]);
FlipF  f2(clk, reset, EN, D[1], Q[1]);

endmodule


module FlipF4(input wire clk, reset, EN,
              input wire [3:0]D,
              output wire [3:0]Q);

FlipF f3(clk, reset, EN, D[0], Q[0]);
FlipF f4(clk, reset, EN, D[1], Q[1]);
FlipF f5(clk, reset, EN, D[2], Q[2]);
FlipF f6(clk, reset, EN, D[3], Q[3]);

endmodule
