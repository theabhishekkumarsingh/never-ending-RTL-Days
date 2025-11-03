// 2x4 Decoder designing using data flow modelling
module decoder2x4 (a,b,e,q0,q1,q2,q3);
input a,b,e;
output q0,q1,q2,q3;

assign q0 = ~a & ~b & e;
assign q1 = ~a & b & e;
assign q2 = a & ~b & e;
assign q3 = a & b & e;
endmodule
module decoder2x4_tb; // TESTBENCH
reg a,b,e;
wire q0,q1,q2,q3;

decoder2x4 dcd1(a,b,e,q0,q1,q2,q3);
initial begin
    e = 0;a = 0; b = 0; // here, the enable signal is LOW
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;

    #10 e = 1; a = 0; b = 0; // here, the enable signal is HIGH
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//----------------------------------------------------------------------------------------------------------------------------------
// Designing 2x4 Decoder using Behavioural Modelling
module decoder2x4_behavioural (a,en,q);
input [1:0]a;
input en;
output reg [3:0]q;

always@(*) begin
    if (en)begin
        case(a)
        2'b00: q = 4'b0001;
        2'b01: q = 4'b0010;
        2'b10: q = 4'b0100;
        2'b11: q = 4'b1000;
        default : q = 4'b0000;
        endcase
    end else begin
        q = 4'b0000;
    end
end
endmodule
module decoder2x4_behavioural_tb; // TESTBENCH
reg [1:0]a;
reg en;
wire [3:0]q;

decoder2x4_behavioural dcdcx2(a,en,q);
initial begin
    $monitor("Time=%0t | en = %b | a = %b | q = %b", $time,en,a,q );
    en = 0; a = 2'b00;
    #10 en = 1; a = 2'b00;
    #10 a = 2'b01;
    #10 a = 2'b10;
    #10 a = 2'b11;
end
endmodule