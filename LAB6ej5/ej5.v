//Ejercicio 5
//Flip flop tipo D

module FlipF(input wire clk, reset, set,
            input wire [3:0]D,
            output reg [3:0]Q);


always @ (posedge clk or posedge reset)begin
  if (reset) begin
      Q <= 4'b0;

  end
  else if (set) begin
  Q <= 4'b1111;
  end

  else 
      Q <= D;
  end

endmodule
