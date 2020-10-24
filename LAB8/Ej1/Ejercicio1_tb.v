//testbench

module testbench();
reg clk, reset, EN, LDEN;
reg [11:0]LD; //input contador
wire [11:0]Q; //salidas

cont  u1 (clk, EN, reset, LDEN, LD, Q);

always
#1 clk  = ~clk;

initial begin
#1
$display(" Selector ");
$display ("CLK EN RST LDEN LD| Q");
$display("-----------------------------|------------");
$monitor(" %b %b %b %b %b  |  %b ",clk, EN, reset, LDEN, LD, Q);
    clk = 0; reset = 0; EN = 0; LDEN = 0; LD = 0;
    #1 reset = 1;
    #1 reset = 0;
    #1 reset = 0;
    #1 EN = 1;
    #10 reset = 0;
    #10 reset = 0;
    #1 reset = 1; EN = 0;
    #1 reset = 0;
    #5 LDEN = 1; LD = 12'b111110000000;
    #1 EN = 1; LDEN = 0;


  end

  initial
    #145 $finish;

  initial begin
    $dumpfile("Ejercicio1_tb.vcd");
    $dumpvars(0, testbench);

  end
  endmodule
