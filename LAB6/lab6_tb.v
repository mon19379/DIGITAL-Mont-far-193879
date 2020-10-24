//testbench
// ejercicio 6
module testbench();


reg clk, reset;
reg A, B, A1;
wire [1:0] F, P;
wire Q;
wire [2:0] F2, P2;




  ejer1  a1(A, B, clk, reset, Q, P, F);
  ejer3  a2(A1, clk, reset,Q1, Q2, Q3, F2, P2);

initial begin
        $display("\n");
        $display("Ejercicio 1");
        $display("reset A B F P Q");
        $monitor("%b %b %b %b %b %b", reset, A, B, F, P, Q);
           A = 0; B = 0; clk = 0; reset = 0;
        #1   reset = 1;
        #1   A = 1; B = 1; reset = 0;


    end



 initial begin
        #7
        $display("\n");
        $display("Ejercicio 3");
        $display("reset A1  F2 P2 Q1 Q2 Q3");
        $monitor("%b      %b   %b  %b   %b  %b  %b", reset, A1, F2, P2, Q1, Q2, Q3);
            reset = 1; A1 = 1;
        #8 A1 = 1; reset = 0;
        #2 A1 = 0;

    end


    always
        #5 clk = ~clk;


  initial
      #40 $finish;

      initial begin
        $dumpfile("lab6_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule
