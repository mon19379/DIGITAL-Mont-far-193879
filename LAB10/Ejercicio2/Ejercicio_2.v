
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

module FlipF2 (input wire clk, reset, EN, input wire [1:0]D, output wire [1:0]Q);

FlipF a1(clk, reset, EN, D[0], Q[0]);
FlipF a2(clk, reset, EN, D[1], Q[1]);

endmodule


module accu(input wire clk, reset, EN, input wire [3:0]D, output wire [3:0]Q);

FlipF2 a3(clk, reset, EN, D[1:0], Q[1:0]);
FlipF2 a4(clk, reset, EN, D[3:2], Q[3:2]);

endmodule


module ALU(input wire[3:0]W,
           input wire [3:0]B,
           input wire [2:0]S,
           output reg C, Z,
           output reg [3:0]O);

reg[4:0]A;

always @(W, B, S)
begin

case (S)


3'b000:
      begin
      A = 5'b00000;
      A = W;
      C = 0;
      Z = 0;
      O = A[3:0];

end

3'b010:
        begin
        A = 5'b00000;
        A = B;
        C = 0;
        Z = 0;
        O = A[3:0];
  end
  3'b100:
        begin
        A = 5'b00000;
        A = ~(W&B);
        C = 0;
        Z = 0;
        O = A[3:0];
  end
  3'b001:
        begin
        A = 5'b00000;
        A = W-B;
        C = A[4];
        Z = (A==5'b00000);
        O = A[3:0];
  end
  3'b011:
        begin
        A = 5'b00000;
        A = W+B;
        C = A[4];
        Z = (A==5'b00000);
        O = A[3:0];
  end
  endcase // Sel
end
endmodule

module buff(input wire EN, input wire [3:0]S, output wire [3:0]Q);

assign Q = EN ? S:4'bz;

endmodule


module uni(input wire clk, reset, EN, EB1, EB2, input wire [3:0]in, input wire[2:0]S, output wire C, Z, output wire[3:0]Ou);

      wire [3:0]B;
      wire [3:0]ALU;
      wire [3:0]AC;
      wire [3:0]O;

buff f1(EB1, in, B);
accu f2(clk, reset, EN, O, AC);
ALU  f3(AC, B, S, C, Z, O);
buff f4(EB2, O, Ou);

endmodule
