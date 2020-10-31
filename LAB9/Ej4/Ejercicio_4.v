module BUFFTRI(input wire EN, input wire [3:0]A, output wire [3:0]out);
assign out = EN ? A:4'bz;
endmodule
