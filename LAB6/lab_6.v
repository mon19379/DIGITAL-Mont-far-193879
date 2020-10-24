//FRANCISCO MONTÚFAR
//CARNET 19379







//Ejercicio 6 con rst asincrono

module FLIPflop (input clk, reset, D,
            output reg Q);
        always @ (posedge clk or posedge reset)begin
            if (reset) begin
                Q <= 1'b0;
            end
            else begin
                Q <= D;
            end
        end
endmodule

//ejercicio 1

module  ejer1(input A, B, clk, reset, output wire Q, output wire [1:0] S2, F2);
wire S0, S1, F0, F1;

        assign  F0 = (~S1 & ~S0 & A);
        assign F1 = (S0 & B) | (S1 & A & B);

        FLIPflop U1(clk, reset, F0, S0);
        FLIPflop U2(clk, reset, F1, S1);
        assign Q = (S1 & ~S0 & A & B);
        assign S2 = {S1, S0};
        assign F2 = {F1, F0};

endmodule

module ejer3 (input A, clk, reset,
output Y3, Y2, Y1,
output wire [2:0]F3, S3);
wire S0, S1, S2, F0, F1, F2;

assign F0 = ~S0;
assign F1 = (~S1 & ~S0 & ~A) | (S1 & S0 & ~A) | (S1 & ~S0 & A) | (~S1 & S0 & A);
assign F2 = (S2 & S1 & ~A) | (S2 & ~S0 & A) | (S2 & ~S1 & S0) | (~S2 & ~S1 & ~S0 & ~A) | (~S2 & S1 & S0 & A);

FLIPflop  C0(clk, reset, F0, S0);
FLIPflop  C1(clk, reset, F1, S1);
FLIPflop  C3(clk, reset, F2, S2);


assign S3 = {S2, S1, S0};
assign F3 = {F2, F1, F0};
assign Y3 = S2;
assign Y2 = (S2 & ~S1) | (~S2 & S1);
assign Y1 = (S1 & ~S0) | (~S1 & S0);

endmodule
