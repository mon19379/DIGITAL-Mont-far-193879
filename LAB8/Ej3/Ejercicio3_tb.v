module testbench();

reg [3:0]A; //input
reg [3:0]B;
reg [2:0]Selector; //selector
wire [3:0]Out;     //salidas

ALU  u1 (A, B, Selector, Out);



initial begin
$display ("\n");
$display(" ALU ");
$display ("A    |    B   |  SEL   |   Out");
$display("---------|------------");
$monitor(" %b | %b  | %b | %b ", A, B, Selector, Out);
#1 A = 4'b0000; B = 4'b0000; Selector = 3'b000;
#1 A = 4'b0011; B = 4'b0100; Selector = 3'b000;
#1 A = 4'b0010; B = 4'b1000; Selector = 3'b001;
#1 A = 4'b0011; B = 4'b0010; Selector = 3'b010;
#1 A = 4'b0110; B = 4'b1010; Selector = 3'b100;
#1 A = 4'b0110; B = 4'b1100; Selector = 3'b101;
#1 A = 4'b1010; B = 4'b1001; Selector = 3'b110;
#1 A = 4'b1110; B = 4'b0110; Selector = 3'b111;




  end

  initial
    #145 $finish;

  initial begin
    $dumpfile("Ejercicio3_tb.vcd");
    $dumpvars(0, testbench);

  end
  endmodule
