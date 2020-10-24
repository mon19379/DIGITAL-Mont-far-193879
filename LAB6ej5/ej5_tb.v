module testbench();
  reg clk, reset, set;
  reg [3:0] D;
  wire [3:0] Q;


  FlipF  a1(clk, reset, set, D, Q);


  always
  #1 clk  <= ~clk;


initial begin

$display(" ejercicio 5");
$display ("S clk r D  | Q");
$display("----------------------------|------------");
$monitor("%b %b %b %b  | %b  ", set, clk, reset, D, Q);
   reset = 1; set = 1; D[3] = 1; D[2] = 1; D[1] = 0; D[0] = 0;  clk = 0;
#5 reset = 0; set = 0; D[3] = 0; D[2] = 1; D[1] = 1; D[0] = 0;
#5 reset = 0; set = 1; D[3] = 1; D[2] = 1; D[1] = 1; D[0] = 1;
#5 reset = 0; set = 0; D[3] = 0; D[2] = 0; D[1] = 1; D[0] = 1;
#5 reset = 0; set = 0; D[3] = 1; D[2] = 1; D[1] = 0; D[0] = 1;
end

always #2 clk =~clk;

initial
  #11 $finish;

  initial begin
  $dumpfile("ej5_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
