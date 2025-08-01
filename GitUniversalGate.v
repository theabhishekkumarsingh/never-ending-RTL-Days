//--------------------------------------Logic Gates using Nand Gate by GATE LEVEL MODELLING
module universal_gate_nand_gatelevel (a,b,NOTout,ANDout,ORout,NORout,XORout,XNORout);
input a,b;
output NOTout,ANDout,ORout,NORout,XORout,XNORout;
wire and1,or1,or2,nor1,nor2,nor3,xor1,xor2,xor3,xnor1,xnor2,xnor3,xnor4;

// NOT Gate 
nand (NOTout,a,a);
// AND Gate 
nand (and1,a,b);
nand (ANDout,and1,and1);
// OR Gate
nand (or1,a,a);
nand (or2,b,b);
nand (ORout,or1,or2);
// NOR Gate 
nand (nor1,a,a);
nand (nor2,b,b);
nand (nor3,nor1,nor2);
nand (NORout,nor3,nor3);
// XOR Gate
nand (xor1,a,b);
nand (xor2,a,xor1);
nand (xor3,b,xor1);
nand (XORout,xor2,xor3);
// XNOR Gate
nand (xnor1,a,b);
nand (xnor2,a,xnor1);
nand (xnor3,b,xnor1);
nand (xnor4,xnor2,xnor3);
nand (XNORout,xnor4,xnor4);
endmodule
module universal_gate_nand_gatelevel_tb; //testbench
reg a,b;
wire NOTout,ANDout,ORout,NORout,XORout,XNORout;

universal_gate_nand_gatelevel naxcn4(a,b,NOTout,ANDout,ORout,NORout,XORout,XNORout);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule

//--------------------------------------------Logic gates using NAND Gate by DATA FLOW MODELLING
module universal_gate_nand_dataflow (a,b,NOTout,ANDout,ORout,NORout,XORout,XNORout);
input a,b;
output NOTout,ANDout,ORout,NORout,XORout,XNORout;

assign NOTout = ~(a);
assign ANDout = (a & b);
assign ORout = (a | b);
assign NORout = ~(a | b);
assign XORout = (a ^ b);
assign XNORout = ~(a ^ b);
endmodule
module universal_gate_nand_dataflow_tb; // testbench
reg a,b;
wire NOTout,ANDout,ORout,NORout,XORout,XNORout;

universal_gate_nand_dataflow as462x(a,b,NOTout,ANDout,ORout,NORout,XORout,XNORout);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule 
//-----------------------------------------------------------------------------------------------------------------------------------
// -------------------------------Logic Gates using NOR GATE by GATE LEVEL MODELLING
module universal_gate_nor_gatelevel (a,b,NOTout,ANDout,ORout,NANDout,XORout,XNORout);
input a,b;
output NOTout,ANDout,ORout,NANDout,XORout,XNORout;
wire or1,and1,and2,nand1,nand2,nand3,xor1,xor2,xor3,xor4,xnor1,xnor2,xnor3;

// NOT GATE 
nor (NOTout,a,a);
// OR GATE 
nor (or1,a,b);
nor (ORout,or1,or1);
// AND GATE 
nor (and1,a,a);
nor (and2,b,b);
nor (ANDout,and1,and2);
// NAND GATE
nor (nand1,a,a);
nor (nand2,b,b);
nor (nand3,nand1,nand2);
nor (NANDout,nand3,nand3);
// XOR GATE
nor (xor1,a,b);
nor (xor2,a,xor1);
nor (xor3,b,xor1);
nor (xor4,xor2,xor3);
nor (XORout,xor4,xor4);
// XNOR GATE
nor (xnor1,a,b);
nor (xnor2,xor1,a);
nor (xnor3,xor1,b);
nor (XNORout,xor2,xor3);

endmodule
module universal_gate_nor_gatelevel_tb; // testbench
reg a,b;
wire NOTout,ANDout,ORout,NANDout,XORout,XNORout;

universal_gate_nor_gatelevel kjsc4(a,b,NOTout,ANDout,ORout,NANDout,XORout,XNORout);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
// -------------------------------Logic Gates using NOR GATE by DATA FLOW MODELLING
module universal_gate_nor_dataflow (a,b,NOTout,ANDout,ORout,NANDout,XORout,XNORout);
input a,b;
output NOTout,ANDout,ORout,NANDout,XORout,XNORout;

assign NOTout = ~(a);
assign ANDout = (a & b);
assign ORout = (a | b);
assign NANDout = ~(a & b);
assign XORout = (a ^ b);
assign XNORout = ~(a ^ b);
endmodule
module universal_gate_nor_dataflow_tb; // testbench
reg a,b;
wire NOTout,ANDout,ORout,NANDout,XORout,XNORout;

universal_gate_nor_dataflow mksx6 (a,b,NOTout,ANDout,ORout,NANDout,XORout,XNORout);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
