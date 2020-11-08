module testbench();
  reg clk, reset, ldbit, EN1, EN2;
  reg [11:0]load;
  wire [3:0]Y;
  wire [3:0]Y1;



todo  a1 (clk, reset, EN1, ldbit, load, EN2, Y, Y1);



  always
  #1 clk  = ~clk;


initial begin

$display(" Ejercicio 1");
$display ("clk RST EN1 EN2 ldbit load | Y, Y1");
$display("----------------------------|------------");
$monitor("%b %b %b %b %b %b  | %b %b", clk, reset, EN1, EN2, ldbit, load, Y, Y1);
      clk = 0; reset = 0; EN1 = 0; EN2 = 0; ldbit = 0; load = 0;
    #1 reset = 1;
    #1 reset = 0; EN1 = 1; EN2 = 1;
    #1 reset = 0;
    #1 load = 12'b000000000001;
    #1 ldbit = 1;
    #6 ldbit = 0;




end

initial
  #25 $finish;

  initial begin
  $dumpfile("Ejercicio1_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
