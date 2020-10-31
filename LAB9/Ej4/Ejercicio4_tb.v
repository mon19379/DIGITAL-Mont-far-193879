module testbench();
  reg EN;
  reg [3:0]A;
  wire [3:0]out;


BUFFTRI a1(EN, A, out);




initial begin

$display(" ejercicio 4");
$display ("EN  A | OUT ");
$display("-------|------------");
$monitor("%b %b  | %b", EN, A, out);
      EN = 0; A[3] = 0;  A[2] = 0;  A[1] = 0;  A[0] = 0;
   #1 EN = 1; A[3] = 1;  A[2] = 1;  A[1] = 0;  A[0] = 1;
   #1 EN = 0; A[3] = 1;  A[2] = 1;  A[1] = 0;  A[0] = 1;
   #1 EN = 1; A[3] = 1;  A[2] = 0;  A[1] = 1;  A[0] = 1;
   #1 EN = 0; A[3] = 1;  A[2] = 0;  A[1] = 1;  A[0] = 1;
   #1 EN = 1; A[3] = 1;  A[2] = 1;  A[1] = 1;  A[0] = 1;
   #1 EN = 0; A[3] = 1;  A[2] = 1;  A[1] = 1;  A[0] = 1;
   #1 EN = 1; A[3] = 0;  A[2] = 1;  A[1] = 0;  A[0] = 0;
   #1 EN = 0; A[3] = 0;  A[2] = 1;  A[1] = 0;  A[0] = 0;


end

initial
  #9 $finish;

  initial begin
  $dumpfile("Ejercicio4_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
