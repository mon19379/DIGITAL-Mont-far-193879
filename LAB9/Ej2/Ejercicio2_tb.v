module testbench();
  reg clk, reset, EN;
  reg T;
  wire Q1;
FlipFT  a1(clk, reset, EN, Q1);



  always
  #1 clk  = ~clk;


initial begin

$display(" ejercicio 2");
$display ("clk RST EN | T | Q1");
$display("----------------------------|------------");
$monitor("%b %b %b %b   | %b", clk, reset, EN, T, Q1);
      clk = 0; reset = 0; EN = 0; T = 0;
   #2 reset = 1;
   #2 reset = 0;
   #2 EN = 1;
   #2 T = 1;


end

initial
  #25 $finish;

  initial begin
  $dumpfile("Ejercicio2_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
