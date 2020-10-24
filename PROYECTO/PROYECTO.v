//Proyecto
//Flip flop tipo D de 3 bits, reset asíncrono
module FlipF3(input wire clk, reset, E,
              input wire [2:0]D,
              output reg [2:0]Q);
always @ (posedge clk or posedge reset)begin
  if (reset) begin
      Q <= 3'b0;
end
else if (E) begin
Q <= D;
end
end
endmodule

//Flip flop tipo D de 2 bits, reset asíncrono
module FlipF2(input wire clk, reset, E,
            input wire [1:0]D,
            output reg [1:0]Q);
always @ (posedge clk or posedge reset)begin
  if (reset) begin
      Q <= 2'b0;
  end
  else if (E) begin
  Q <= D;
  end
end
endmodule

//Flip flop tipo de de 1 bit, reset asíncrono
module FlipF1(input wire clk, reset,E,
            input wire D,
            output reg Q);
always @ (posedge clk or posedge reset)begin
  if (reset) begin
      Q <= 1'b0;
  end
  else if (E) begin
  Q <= D;
  end
end

endmodule

//Antirebote
module antireb (input wire clk, reset, PB, output wire Q);
wire Y1, Y2;
assign Y2 = (PB);
FlipF1  F1(clk, reset, 1'b1 , Y2, Y1);
assign Q = (~Y1 & PB);
endmodule

//selector de local
module selector(input wire reset, clk, PB1, PB2, output wire E, E1);
wire s0, s1;
wire [1:0]s;
wire [1:0]sf;
assign s1 = s[1];
assign s0 = s[0];
assign sf[1] = (~s1 & ~s0 & PB2 & ~PB1) | (s1 & ~s0 & ~PB2 & ~ PB1) | (s1 & ~s0 & ~PB2 & PB1) | (s1 & ~s0 & PB2 & PB1);
assign sf[0] = (~s1 & ~s0 & ~PB2 & PB1) | (~s1 & s0 & ~PB2 & ~PB1) | (~s1 & s0 & PB2 & PB1) | (~s1 & s0 & PB2 & PB1);
FlipF2  t1(clk, reset, 1'b1, sf, s);
assign E = (~s1 & s0);
assign E1 = (s1 & ~s0);
endmodule

//modulo del car carwash
module carwash(input wire reset, clk, EN, input wire[3:0]L, input wire BF, output wire CT0, output wire [2:0]SA);
wire sc0, sc1, sc2;
wire [2:0]s_c;
wire [2:0]sf_c;
assign sc2 = s_c[2];
assign sc1 = s_c[1];
assign sc0 = s_c[0];

assign sf_c[2] = (~sc2 & sc1 & ~sc0 & ~L[3] & ~L[2] & ~L[1] & L[0] & BF) | (~sc2 & sc1 & sc0 & L[3] & ~L[2] & ~L[1] & ~L[0] & BF) | (~sc2 & sc1 & sc0 & ~L[3] & L[2] & ~L[1] & ~L[0] & BF) |
                 (~sc2 & ~sc1 & sc0 & ~L[3] & ~L[2] & L[1] & ~L[0] & BF) | (sc2 & ~sc1 & sc0 & ~L[3] & ~L[2] & L[1] & ~L[0] & ~BF) | (sc2 & ~sc1 & sc0 & ~L[3] & ~L[2] & ~L[1] & L[0] & ~BF) |
                 (sc2 & ~sc1 & ~sc0 & L[3] & ~L[2] & ~L[1] & ~L[0]) | (sc2 & ~sc1 & ~sc0 & ~L[3] & L[2] & ~L[1] & ~L[0]) | (sc2 & ~sc1 & L[3] & ~L[2] & ~L[1] & ~L[0] & ~BF) |
                 (sc2 & ~sc1 & ~L[3] & L[2] & ~L[1] & ~L[0] & ~BF);

assign sf_c[1] = (~sc2 & ~sc1 & ~sc0 & ~L[3] & L[2] & ~L[1] & ~L[0] & BF) | (~sc2 & ~sc1 & sc0 & ~L[3] & ~L[2] & ~L[1] & L[0] & BF) | (~sc2 & sc1 & sc0 & ~L[3] & L[2] & ~L[1] & ~L[0] & ~BF) |
                 (~sc2 & sc1 & ~sc0 & ~L[3] & ~L[2] & ~L[1] & L[0] & ~BF) | (~sc2 & ~sc1 & sc0 & L[3] & ~L[2] & ~L[1] & ~L[0] & BF) | (~sc2 & sc1 & L[3] & ~L[2] & ~L[1] & ~L[0] & ~BF) |
                 (~sc2 & sc1 & ~sc0 & L[3] & ~L[2] & ~L[1] & ~L[0]);

assign sf_c[0] = (~sc2 & ~sc0 & ~L[3] & ~L[2] & ~L[1] & L[0] & BF) | (~sc2 & sc1 & sc0 & ~L[3] & L[2] & ~L[1] & ~L[0] & ~BF) | (~sc2 & ~sc0 & L[3] & ~L[2] & ~L[1] & ~L[0] & BF) |
                 (~sc1 & ~sc0 & ~L[3] & L[2] & ~L[1] & ~L[0] & BF) | (~sc2 & sc0 & L[3] & ~L[2] & ~L[1] & ~L[0] & ~BF) | (sc2 & ~sc1 & sc0 & ~L[3] & L[2] & ~L[1] & ~L[0] & ~BF) |
                 (~sc1 & sc0 & ~L[3] & ~L[2] & L[1] & ~L[0] & ~BF) | (~sc1 & sc0 & ~L[3] & ~L[2] & ~L[1] & L[0] & ~BF) | (~sc1 & ~sc0 & L[3] & ~L[2] & ~L[1] & ~L[0] & BF) |
                 (~sc1 & sc0 & L[3] & ~L[2] & ~L[1] & ~L[0] & ~BF) | (~sc2 & ~sc1 & ~L[3] & ~L[2] & L[1] & ~L[0] & BF);

FlipF3  t2(clk, reset, EN, sf_c, s_c);
assign CT0 = (sc2 & ~sc1 & sc0);
assign SA = {sc2, sc1, sc0};
endmodule

//modulo del taller
module taller (input wire reset, clk, EN, input wire [3:0]T, input wire BF1, output wire CT1, output wire [2:0]SA1);
wire st0, st1, st2;
wire [2:0]s_t;
wire [2:0]sf_t;
assign st2 = s_t[2];
assign st1 = s_t[1];
assign st0 = s_t[0];
assign sf_t[2] = (st2 & ~st1 & ~T[3] & ~T[2] & ~T[1] & T[0]) | (st2 & ~st0 & ~T[3] & ~T[2] & ~T[1] & T[0]) | (st2 & ~T[3] & ~T[2] & ~T[1] & T[0] & ~BF1) | (st2 & ~st1 & ~st0 & ~T[3] & T[2] & ~T[1] & ~T[0]) |
                 (st2 & ~st1 & st0 & T[3] & ~T[2] & ~T[1] & ~T[0]) | (st2 & st1 & ~st0 & T[3] & ~T[2] & ~T[1] & ~T[0]) | (~st1 & ~st0 & ~T[3] & T[2] & ~T[1] & ~T[0] & BF1) |
                 (~st2 & st1 & st0 & ~T[3] & ~T[2] & ~T[1] & T[0] & BF1) | (~st2 & st1 & st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & BF1) | (~st2 & ~st1 & ~st0 & T[3] & ~T[2] & ~T[1] & ~T[0] & BF1) | (st2 & st1 & st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & ~BF1) |
                 (st2 & st1 & st0 & ~T[3] & T[2] & ~T[1] & ~T[0] & ~BF1) | (st2 & st0 & T[3] & ~T[2] & ~T[1] & ~T[0] & ~BF1);

assign sf_t[1] = (st1 & ~st0 & ~T[3] & ~T[2] & ~T[1] & T[0]) | (~st2 & st1 & ~T[3] & ~T[2] & T[1] & ~T[0]) | (st1 & ~T[3] & ~T[2] & ~T[1] & T[0] & ~BF1) | (st2 & st1 & ~st0 & T[3] & ~T[2] & ~T[1] & ~T[0]) |
                 (~st1 & st0 & ~T[3] & ~T[2] & ~T[1] & T[0] & BF1) | (~st2 & st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & BF1) | (st1 & st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & ~BF1) | (st2 & st1 & T[3] & ~T[2] & ~T[1] & ~T[0] & ~BF1) |
                 (st2 & ~st1 & ~st0 & ~T[3] & T[2] & ~T[1] & ~T[0] & BF1) | (st2 & ~st1 & st0 & T[3] & ~T[2] & ~T[1] & ~T[0] & BF1) |
                 (st2 & st1 & st0 & ~T[3] & T[2] & ~T[1] & ~T[0] & ~BF1);

assign sf_t[0] = (~st0 & ~T[3] & ~T[2] & ~T[1] & T[0] & BF1) | (st0 & ~T[3] & ~T[2] & ~T[1] & T[0] & ~BF1) | (~st2 & ~st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & BF1) | (~st2 & st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & ~BF1) |
                 (st1 & st0 & ~T[3] & ~T[2] & T[1] & ~T[0] & ~BF1) | (st2 & st0 & T[3] & ~T[2] & ~T[1] & ~T[0] & ~BF1) | (st2 & ~st1 & ~st0 & ~T[3] & T[2] & ~T[1] & ~T[0] & BF1) | (st2 & st1 & ~st0 & T[3] & ~T[2] & ~T[1] & ~T[0] & BF1) |
                 (~st2 & ~st1 & ~st0 & T[3] & ~T[2] & ~T[1] & ~T[0] & BF1) | (st2 & st1 & st0 & ~T[3] & T[2] & ~T[1] & ~T[0] & ~BF1) | (~st2 & st1 & ~T[3] & ~T[2] & T[1] & ~T[0] & BF1);

FlipF3 t3(clk, reset, EN, sf_t, s_t);
assign CT1 = (st2 & st1 & st0);
assign SA1 = {st2, st1, st0};
endmodule

//modulo donde se unen todas las fsm
module megafsm (input wire reset, clk, PB1, PB2, BF, BF1, input wire [3:0]T, input wire[3:0]C, output wire CT, CT1, output wire [2:0]SA, output wire [2:0]SA1);

wire C1, C2, T1, T2, E, E1;

antireb a1(clk, reset, PB1, C1);
antireb a2(clk, reset, PB2, T1);
antireb a3(clk, reset, BF, C2);
antireb a4(clk, reset, BF1, T2);


selector  m1(reset, clk, C1, T1, E, E1);
carwash   m2(reset, clk, E, C, C2, CT, SA);
taller    m3(reset, clk, E1, T, T2, CT1, SA1);

endmodule
