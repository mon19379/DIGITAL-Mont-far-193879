module testbench();
  reg clk, reset, EN;
  reg [3:0]D4;
  reg [1:0]D2;
  reg D;
  wire [3:0]Q4;
  wire [1:0]Q2;
  wire Q;


FlipF  a1(clk, reset, EN, D, Q);
FlipF2 a2(clk, reset, EN, D2, Q2);
FlipF4 a3(clk, reset, EN, D4, Q4);


  always
  #1 clk  = ~clk;


initial begin

$display(" ejercicio 1");
$display ("clk RST EN  D D2 D4  | Q Q2 Q4");
$display("----------------------------|------------");
$monitor("%b %b %b %b %b %b  | %b %b %b", clk, reset, EN, D, D2, D4, Q, Q2, Q4);
      clk = 0; reset = 0; EN = 0; D = 1'b1; D2 = 2'b01; D4 = 4'b0110;
   #5 reset = 1;
   #5 reset = 0;
   #5 EN = 1;


end

initial
  #25 $finish;

  initial begin
  $dumpfile("Ejercicio1_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
