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


module FlipFJK(input clk, reset, EN, J, K, output wire Q);

wire sal1;
wire sal2;
wire sal3;
wire sal4;
wire sal5;
wire S0;

not(sal1,S0);
not(sal2,K);
nand(sal3,J,sal1);
nand(sal4, sal2, S0);
nand(Q, sal3, sal4);

FlipF jk(clk, reset, EN, Q, S0);

endmodule
