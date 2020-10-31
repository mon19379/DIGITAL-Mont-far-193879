module testbench();
  reg clk, reset, EN;
  reg J;
  reg K;
  wire Q;


FlipFJK a1(clk, reset, EN, J, K, Q);



  always
  #1 clk  = ~clk;


initial begin

$display(" ejercicio 1");
$display ("clk RST EN  J K | Q ");
$display("----------------------------|------------");
$monitor("%b %b %b %b %b  | %b", clk, reset, EN,J, K, Q);
      clk = 0; reset = 0; EN = 0; J = 0; K = 0;
   #1 reset = 1;
   #1 reset = 0;
   #1 EN = 1; J = 1;
   #1 J = 0; K = 1;
   #1 J = 1;


end

initial
  #6 $finish;

  initial begin
  $dumpfile("Ejercicio3_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
