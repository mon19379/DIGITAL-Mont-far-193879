//Flip Flop

module FlipF(input wire clk, reset, EN,
            input wire [3:0]D,
            output reg [3:0]Q);

always @ (posedge clk or posedge reset)begin
  if (reset) begin
      Q <= 4'b0000;
  end
  else if (EN) begin
      Q <= D;
  end
  end

endmodule


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


//ROM

module  memrom(input wire [11:0]D, output wire [7:0]Dout); //se indican las entradas y salidas

assign Dout = larom[D]; // se establece que lo que saca la memoria es lo mismo que le entra
reg [7:0]   larom[0:4095]; //se declara el width y el depth de la memoria

initial begin
  $readmemh("memory.list", larom); // se establece que se lea en hexadecimal lo del archivo (lo que entra) y salida
  end

endmodule


//Fetch
module FlipF8(input wire clk, reset, EN,
              input wire[7:0]D,
              output wire[3:0]Q,
              output wire[3:0]Q1);


FlipF a1(clk, reset, EN, [7:4]D, [3:0]Q);
FlipF a2(clk, reset, EN, [3:0]D, [3:0]Q);

endmodule

module union(clk, reset, EN1, ldbit, input wire[11:0]load, EN2, output wire[3:0]Y, Y1);
wire [11:0]A;
wire [8:0]B;

cont   f1 (clk, reset, EN1, ldbit, load, A);
memrom f2 (A,B);
FlipF8 f3 (clk, reset, EN2, B, Y, Y1);

endmodule 
