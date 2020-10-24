//Contador de 12 bits

module cont(input wire clk, EN, reset, LDEN, input wire [11:0]LD, output reg[11:0]Q);

always@(posedge clk or posedge reset or posedge LDEN)begin

if(reset)
  Q <= 12'b000000000000; //si se activa el reset, todos los bits en 0

  else if (LDEN)
  Q <= LD;                //si se activa el load, se precarga un valor

  else if (EN)  //si se activa el enabled cuenta
  Q <= Q + 12'b1;
   end

endmodule
