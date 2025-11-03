// Binary to gray Converter using Data Flow Modelling
module binarytograyconverter (b,g); // b is for binary & g is for gray
input [5:0]b;
output [5:0]g;

assign g[5] = b[5];
assign g[4] = b[5] ^ b[4];
assign g[3] = b[4] ^ b[3];
assign g[2] = b[3] ^ b[2];
assign g[1] = b[2] ^ b[1];
assign g[0] = b[1] ^ b[0];
endmodule
module binarytograyconverter_tb; // TESTBENCH
reg [5:0]b;
wire [5:0]g;

binarytograyconverter b2g(b,g);
initial begin
    b = 6'b101101;
    #10 b = 6'b101010;
    #10 b = 6'b101011;
    #10 b = 6'b111001;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
