module testbench();

reg clk, reset;

reg PB1, PB2; //entradas selector
reg [3:0]T; //input taller
reg [3:0]C; //input car wash
reg BF, BF1; //push buttons
wire CT, CT1;
wire [2:0]SA;
wire [2:0]SA1; //salidas

megafsm  u1 (reset, clk, PB1, PB2, BF, BF1, T, C,  CT, CT1, SA, SA1);

always
#2 clk  <= ~clk;

initial begin
$display(" Selector ");
$display (" RST CLK PB1 PB2 BF BF1 T C | SA SA1 CT CT1");
$display("-----------------------------|------------");
$monitor("%b %b %b %b %b %b %b %b   |  %b %b %b %b", reset, clk, PB1, PB2, BF, BF1, T, C, SA, SA1, CT, CT1);
    reset = 0; clk = 1;
    #4 reset = 1; PB1 = 0; PB2 = 0; BF = 0; BF1 = 0; T[3] = 0; T[2] = 0; T[1] = 0; T[0] = 0; C[3] = 0; C[2] = 0; C[1] = 0; C[0] = 0;
    #1 reset = 0;
    #1 PB1 = 1;
    #4 PB1 = 0; C[3] = 1;
    #4 BF = 1;
    #4 BF = 0;
    #4 BF = 1;
    #4 BF = 0;
    #4 BF = 1;
    #4 BF = 0;
    #4 BF = 1;
    #4 BF = 0;
    #4 BF = 1;
    #4 BF = 0;
    #4 BF = 1;
    #4 BF = 0;
    #4 reset = 1; PB1 = 0; PB2 = 0; BF = 0; BF1 = 0; T[3] = 0; T[2] = 0; T[1] = 0; T[0] = 0; C[3] = 0; C[2] = 0; C[1] = 0; C[0] = 0;
    #1 reset = 0;
    #1 PB2 = 1;
    #4 PB2 = 0; T[0] = 1;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;
    #4 BF1 = 1;
    #4 BF1 = 0;





  end

  initial
    #145 $finish;

  initial begin
    $dumpfile("PROYECTO_tb.vcd");
    $dumpvars(0, testbench);

  end
  endmodule
