// ------------LOGIC GATE'S USING MULTIPLEXER by Verilog
// 1- NOT GATE
module notgateusingMUX (a,y);
input a;
output y;

assign y = ~ a; ; // used Ternary Operator
endmodule
module notgateusingMUX_tb; // TESTEBENCH for NOT Gate
reg a;
wire y;

notgateusingMUX LOGIC1(a,y);
initial begin
    a = 0;
    #10 a = 1;
    #10 a = 0;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------
// 2- AND GATE 
module andgateusingMUX (a,b,y);
input a,b;
output y;

assign y = (A == 1'b1) ? b : 0; // used ternary operator
endmodule
module andgateusingMUX_tb; // TESTBENCH for AND Gate
reg a,b;
wire y;

andgateusingMUX LOGIC2(a,b,y);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//--------------------------------------------------------------------------------------------------------------------------------
// 3 - OR GATE
module orgateusingMUX (a,b,y);
input a,b;
output y;

assign y ? 1 : b; // used Ternary operator
endmodule
module orgateusingmUX_tb; // TESTBENCH for OR Gate
reg a,b;
wire y;

orgateusingMUX LOGIC3(a,b,y);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//------------------------------------------------------------------------------------------------------------------------------
// 4 - NAND GATE
module nandgateusingMUX (a,b,y);
input a,b;
output y;

assign y ? ~b : 1; // used ternary operator
endmodule
module nandgateusignMUX_tb; // TESTEBENCH  for NAND Gate
reg a,b;
wire y;

nandgateusingMUX LOGIC4(a,b,y);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
// 5 - NOR GATE
module norgateusingMUX (a,b,y);
input a,b;
output y;

assign y ? 0 : ~b; // used Ternary Operator
endmodule
module norgateusingMUX_tb; // TESTEBENCH for NOR Gate
reg a,b;
wire y;

norgateusingMUX LOGIC5(a,b,y);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0; 
    #10 a = 1; b = 1;
end
endmodule
//-------------------------------------------------------------------------------------------------------------------------------------
// 6 - XOR GATE
module xorgateusignMUX (a,b,y);
input a,b;
output y;

assign y ? ~b : b;
endmodule
module xorgateusingMUX_tb; // TESTBENCH for XOR Gate
reg a,b;
wire y;

xorgateusingMUX LOGIC6(a,b,y);
initial begin
    a = 0; b  0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------------
// 7 - XNOR GATE
module xnorgateusingMUX (a,b,y);
input a,b;
output y;

assign y ? b : ~b;
endmodule
module xnorgateusingMUX_tb; // TESTBENCH for XNOR Gate
reg a,b;
wire y;

xnorgateusingMUX LOGIC7(a,b,y);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------------
