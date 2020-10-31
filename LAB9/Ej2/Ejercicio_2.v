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


module FlipFT(input wire clk, reset, EN,
              output wire Q1);

    wire D;
    not (D, Q1);
    FlipF  a1(clk, reset, EN, D, Q1);

endmodule
