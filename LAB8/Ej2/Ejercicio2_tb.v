module testbench();
reg [11:0]D; //input
wire [0:7]Dout; //salidas

memrom  u1 (D, Dout);



initial begin
$display ("\n");
$display(" ROM ");
$display ("D | D| Dout | Dout");
$display("---------|------------");
$monitor(" %h | %b  | %h | %b ", D, D, Dout, Dout);
#1 D = 0;
#1 D = 1;
#1 D = 2;
#1 D = 3;
#1 D = 4;
#1 D = 5;
#1 D = 6;
#1 D = 7;
#1 D = 8;
#1 D = 9;
#1 D = 10;
#1 D = 4094;


  end

  initial
    #145 $finish;

  initial begin
    $dumpfile("Ejercicio2_tb.vcd");
    $dumpvars(0, testbench);

  end
  endmodule
