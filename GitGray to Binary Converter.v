module graytobinaryconverter (g,b); // g is for gray & b is for binary
input [5:0]g;
output [5:0]b;

assign b[5] = g[5];
assign b[4] = g[5] ^ g[4];
assign b[3] = b[4] ^ g[3];
assign b[2] = b[3] ^ g[2];
assign b[1] = b[2] ^ g[1];
assign b[0] = b[1] ^ g[0];
endmodule
module graytobinaryconverter_tb; // TESTBENCH
reg [5:0]g;
wire [5:0]b;

graytobinaryconverter g2b(g,b);
initial begin
    g = 6'b111011;
    #10 g = 6'b100101;
    #10 g = 6'b111110;
    #10 g = 6'b101101;
    #10 g = 6'b111111;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
