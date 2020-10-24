//ALU

module  ALU(input wire [3:0]A, input wire [3:0]B, input wire [2:0]Selector, output reg[3:0]Out);


always @(*)
  begin
  case (Selector)
  3'b000: Out = A & B;
  3'b001: Out = A | B;
  3'b010: Out = A + B;
  3'b100: Out = A & ~B;
  3'b101: Out = A | ~B;
  3'b110: Out = A - B;
  3'b111: Out = (A < B) ? 1:0;
  default: Out = A | B;
endcase

end
endmodule
