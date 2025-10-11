// Designing 2x1 MuX using Gate level modelling
module mux_2x1_a (a,b,sel,out);
input a,b,sel;
output out ;
wire not1, and1, and2;
 
not (not1, sel);
and (and1, a, not1);
and (and2, b, sel);
or (out, and1, and2);
endmodule
module mux_2x1_a_tb; // TESTBENCH
reg a,b,sel;
wire out;

mux_2x1_a jaj(a,b,sel,out);
initial begin
a = 0; b = 1; sel = 0;
#10 sel = 1;
#10 sel = 0;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
// Designing 2x1 MuX using Ternary Operator (DataFlow Modelling)
module mux_2x1_b (a,b,sel,out1);
input a,b,sel;
output out1;

assign out1 = sel ? b : a;
endmodule
module mux_2x1_b_tb; // TESTBENCH
reg a,b,sel;
wire out1;

mux_2x1_b asa(a,b,sel,out1);
initial begin
 a = 1; b = 0; sel = 0;
 #10 sel = 1;
 #10 sel = 0;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------
// Designing 2x1 MuX using ifElse Statement (Behavioural Modelling)
module mux_2x1_c (a,b,sel,out2);
input a,b,sel;
output reg out2;

always @(*)begin
    if (sel == 0)
    out2 = a;
    else 
    out2 = b;
end
endmodule
module mux_2x1_c_tb ; // TESTBENCH
reg a,b,sel;
wire out2;

mux_2x1_c awd(a,b,sel,out2);
initial begin
 a = 1; b = 0; sel = 0;
 #10 sel = 1;
 #10 sel = 0;
end
endmodule
//------------------------------------------------------------------------------------------------------------------------------
// Designing 2x1 MuX using Case Statement (Behavioural Modelling)
module mux_2x1_d (a,b,sel,out3);
input a,b,sel;
output reg out3;

always@(*) begin
    case (sel)
     1'b0: out3 = a;
     1'b1: out3 = b;
     default: out3 = 1'bx;
    endcase
end
endmodule
module mux_2x1_d_tb; // TESTBENCH
reg a,b,sel;
wire out3;

mux_2x1_d ac22d(a,b,sel,out3);
initial begin
    $monitor("Time=%0t : a=%b b=%b sel=%b out2=%b", $time, a, b, sel, out3);
    a = 0; b =1; sel = 0;
    #10 a = 1; b = 0; sel = 0;
    #10 a = 1; b = 1; sel = 1;
    #10 a = 0; b = 0; sel = 1;
end
endmodule

//---------------------------------------------------------------------------------------------------------------------------------