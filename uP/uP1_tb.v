module testbench();

    reg clock, reset;
    reg [3:0] pushbuttons;
    wire phase, c_flag, z_flag;
    wire [3:0] instr, oprnd, accu, data_bus, FF_out;
    wire [7:0] program_byte;
    wire [11:0] PC, address_RAM;

uP union(.clock(clock),
         .reset(reset),
         .pushbuttons(pushbuttons),
         .phase(phase),
         .c_flag(c_flag),
         .z_flag(z_flag),
         .instr(instr),
         .oprnd(oprnd),
         .accu(accu),
         .data_bus(data_bus),
         .FF_out(FF_out),
         .program_byte(program_byte),
         .PC(PC),
         .address_RAM(address_RAM));


always
#5 clock = ~clock;
initial begin
  $display("Proyecto uP");
  $display("clk  rst   PBS|  ph   C   Z   instr  oprnd  acc    db      ffout    progb   pc   adr");
  $display("-------------|--------------------------------------------------------------------------------");
  $monitor("%b   %b   %b |   %b    %b   %b   %h   %b   %b   %b   %b   %h   %d  %b", clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, accu, data_bus, FF_out, program_byte, PC, address_RAM);
  clock = 0; reset = 0; pushbuttons = 4'b1010;
  #2 reset = 1;
  #1 reset = 0;
  end
  initial
  #500 $finish;
  initial begin
    $dumpfile("uP1_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule
