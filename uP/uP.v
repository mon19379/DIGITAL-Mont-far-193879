
///Flip Flop 1 bit
module FlipF1(input wire clk, reset, EN,
            input wire D,
            output reg Q);
            always @ (posedge clk or posedge reset)begin
              if (reset) begin
              Q <= 1'b0;
              end
              else if (EN) begin
                Q <= D;
                  end
                    end

endmodule

//Flip Flop 2 bits
module FlipF2 (input wire clk, reset, EN, input wire [1:0]D, output wire [1:0]Q);

  FlipF1 a1(clk, reset, EN, D[0], Q[0]);
  FlipF1 a2(clk, reset, EN, D[1], Q[1]);

endmodule

//Flip Flop 4 bits
module FlipF4(input wire clk, reset, EN,
            input wire [3:0]D,
            output reg [3:0]Q);

            always @ (posedge clk or posedge reset)begin
             if (reset) begin
              Q <= 4'b0000;
              end
              else if (EN) begin
              Q <= D;
              end
            end

endmodule

//Contador de 12 bits
module cont(input wire clk, reset, EN, LDEN,
            input wire [11:0]LD,
            output reg[11:0]Q);

            always@(posedge clk or posedge reset or posedge LDEN)begin

            if(reset)
            Q <= 12'b000000000000; //si se activa el reset, todos los bits en 0

            else if (LDEN)
            Q <= LD;                //si se activa el load, se precarga un valor

            else if (EN)  //si se activa el enabled cuenta
            Q <= Q + 12'b1;
            end

endmodule

//ROM
module  memrom(input wire [11:0]D,
               output wire [7:0]Dout); //se indican las entradas y salidas

               assign Dout = larom[D]; // se establece que lo que saca la memoria es lo mismo que le entra
               reg [7:0]   larom[0:4095]; //se declara el width y el depth de la memoria

               initial begin
               $readmemh("memory.list", larom); // se establece que se lea en hexadecimal lo del archivo (lo que entra) y salida
               end

endmodule

//Fetch
module FlipF8(input wire clk, reset, EN,
              input wire[7:0]D,
              output wire[3:0]Q,
              output wire[3:0]Q1);


              FlipF4 a1(clk, reset, EN, D[7:4], Q[3:0]);
              FlipF4 a2(clk, reset, EN, D[3:0], Q1[3:0]);

endmodule

//FF tipo T -phase
module FlipFT(input wire clk, reset, EN,
              output wire Q1);
    wire D;
    not (D, Q1);
    FlipF1  a1(clk, reset, EN, D, Q1);
endmodule

//Buffer tri estado
module BUFFTRI(input wire EN, input wire [3:0]A, output wire [3:0]out);
  assign out = EN ? A:4'bz;
  endmodule

//accu
module accu(input wire clk, reset, EN, input wire [3:0]D, output wire [3:0]Q);

  FlipF2 a3(clk, reset, EN, D[1:0], Q[1:0]);
  FlipF2 a4(clk, reset, EN, D[3:2], Q[3:2]);

  endmodule

//ALU
module ALU(input [3:0] A, B,
           input [2:0] F,
           output C, Z,
           output [3:0] S);

    reg [4:0] ope;

    always @ (A, B, F)
        case (F)
            3'b000: ope = A;
            3'b001: ope = A - B;
            3'b010: ope = B;
            3'b011: ope = A + B;
            3'b100: ope = {1'b0, ~(A & B)};
            default: ope = 5'b10101;
        endcase

    assign S = ope[3:0];
    assign C = ope[4];
    assign Z = ~(ope[3] | ope[2] | ope[1] | ope[0]);

endmodule

//RAM
module RAM(input wire chips, wrte, input wire [11:0]adr, inout [3:0]data);
  reg[3:0] mem[0:4095];
  reg[3:0] out;

  assign data = (chips && !wrte)? out: 8'bz; //buffer tri estado

  always @ (adr or data or chips or wrte)
  begin: MEM_write
    if (chips && wrte) begin
      mem[adr] = data;
    end
  end

  always @ (adr or chips or wrte)
  begin : MEM_rd
    if (chips && !wrte) begin
      out = mem[adr];
      end
    end
endmodule

//microcode
module ROM(input wire [6:0]A, output reg[12:0]Y);
  always @(*) begin

    casex(A)

      7'bxxxxxx0: Y = 13'b1000000001000;
      7'b00001x1: Y = 13'b0100000001000;
      7'b00000x1: Y = 13'b1000000001000;
      7'b00011x1: Y = 13'b1000000001000;
      7'b00010x1: Y = 13'b0100000001000;
      7'b0010xx1: Y = 13'b0001001000010;
      7'b0011xx1: Y = 13'b1001001100000;
      7'b0100xx1: Y = 13'b0011010000010;
      7'b0101xx1: Y = 13'b0011010000100;
      7'b0110xx1: Y = 13'b1011010100000;
      7'b0111xx1: Y = 13'b1000000111000;
      7'b1000x11: Y = 13'b0100000001000;
      7'b1000x01: Y = 13'b1000000001000;
      7'b1001x11: Y = 13'b1000000001000;
      7'b1001x01: Y = 13'b0100000001000;
      7'b1010xx1: Y = 13'b0011011000010;
      7'b1011xx1: Y = 13'b1011011100000;
      7'b1100xx1: Y = 13'b0100000001000;
      7'b1101xx1: Y = 13'b0000000001001;
      7'b1110xx1: Y = 13'b0011100000010;
      7'b1111xx1: Y = 13'b1011100100000;
      default: Y = 13'b1000000001000;

    endcase
  end
endmodule


module uP(input wire clock, reset,
          input wire [3:0]pushbuttons,
          output wire phase, c_flag, z_flag,
          output wire [3:0]instr,
          output wire [3:0]oprnd,
          output wire [3:0]data_bus,
          output wire [3:0]FF_out,
          output wire [3:0]accu,
          output wire [7:0]program_byte,
          output wire [11:0]PC,
          output wire [11:0]address_RAM);

          wire [12:0] decode_O;
          wire [3:0] ALU_Out;
          wire Zero;
          wire Carry;
          wire [6:0] decode_I;
          assign address_RAM = {oprnd, program_byte};
          assign decode_I = {instr, c_flag, z_flag, phase};



          cont  conta   (clock, reset, decode_O[12], decode_O[11], address_RAM, PC);
          memrom rom    (PC, program_byte);
          FlipF8 fetch  (clock, reset, ~phase, program_byte, instr, oprnd);
          FlipFT pha    (clock, reset, 1'b1, phase);
          FlipF2 flags  (clock, reset, decode_O[9], {Carry, Zero}, {c_flag, z_flag});
          ROM    deco   (decode_I, decode_O);
          accu   acumul (clock, reset, decode_O[10], ALU_Out, accu);
          ALU    alu    (accu, data_bus, {decode_O[8], decode_O[7], decode_O[6]}, Carry, Zero, ALU_Out);
          RAM    ram    (decode_O[5], decode_O[4], address_RAM, data_bus);
          BUFFTRI in    (decode_O[2], pushbuttons, data_bus);
          BUFFTRI aluo  (decode_O[3], ALU_Out, data_bus);
          BUFFTRI fetcho(decode_O[1], oprnd, data_bus);
          FlipF4  sal   (clock, reset, decode_O[0], data_bus, FF_out);


endmodule
