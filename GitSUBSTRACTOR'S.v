//------------------------------------------HALF SUBSTRACTOR using GATE LEVEL MODELLING----------------------------------------------
module halfsubstractor_gatelevel (a,b,diff,borrow);
input a,b;
output diff,borrow;
wire comp;

xor (diff,a,b);
not (comp,a);
and (borrow,comp,b);
endmodule
module halfsubstractor_gatelevel_tb; // testbench
reg a,b;
wire diff,borrow;

halfsubstractor_gatelevel Z23(a,b,diff,borrow);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//------------------------------------------HALF SUBSTRACTOR using DATA FLOW MODELLING----------------------------------------------
module halfsubstractor_dataflow (a,b,diff,borrow);
input a,b;
output diff,borrow;

assign diff = (a ^ b);
assign borrow = (~(a)&b);
endmodule
module halfsubstractor_dataflow_tb; // testbench
reg a,b;
wire diff,borrow;

halfsubstractor_dataflow xwn4(a,b,diff,borrow);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//-------------------------------------------HALF SUBSTRACTOR using BEHAVIOURAL MODELLING-------------------------------------------
module halfsubstractor_behavioural (a,b,diff,borrow);
input a,b;
output reg diff,borrow;

always@(*)begin
    diff = (a^b);
    borrow = (~(a)&b);
end
endmodule
module halfsubstractor_behavioural_tb; // testbench
reg a,b;
wire diff,borrow;

halfsubstractor_behavioural cf6(a,b,diff,borrow);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------FULL SUBSTRACTOR using GATE LEVEL MODELLING
module full_substractor_gatelevel (a,b,Bin,diff,Bout);
input a,b,Bin;
output diff,Bout;
wire xor1,not1,and1,and2,and3;

// Difference Part
xor (xor1,a,b);
xor (diff,xor1,Bin);

// Borrow Part
not (not1,a);
and (and1,not1,b);
and (and2,not1,Bin);
and (and3,b,Bin);
or (Bout,and1,and2,and3);
endmodule
module full_substractor_gatelevel_tb; // testbench
reg a,b,Bin;
wire diff,Bout;

full_susbtractor_gatelevel nsc7(a,b,Bin,diff,Bout);
initial begin
    a = 0; b = 0; Bin = 0;
    #10 a = 0; b = 0; Bin = 1;
    #10 a = 0; b = 1; Bin = 0;
    #10 a = 0; b = 1; Bin = 1;
    #10 a = 1; b = 0; Bin = 0;
    #10 a = 1; b = 0; Bin = 1;
    #10 a = 1; b = 1; Bin = 0;
    #10 a = 1; b = 1; Bin = 1;
end
endmodule
//------------------------------------------FULL SUBSTRACTOR using DATA FLOW MODELLING
module full_substractor_dataflow (a,b,Bin,diff,Bout);
input a,b,Bin;
output diff,Bout;

assign diff = (a ^ b ^ Bin);
assign Bout = ((~(a)&Bin)|(~(a)&b)|(b&Bin));
endmodule
module full_substractor_dataflow_tb; // testbench
reg a,b,Bin;
wire diff,Bout;

full_substractor_dataflow nb90(a,b,Bin,diff,Bout);
initial begin
    a = 0; b = 0; Bin = 0;
    #10 a = 0; b = 0; Bin = 1;
    #10 a = 0; b = 1; Bin = 0;
    #10 a = 0; b = 1; Bin = 1;
    #10 a = 1; b = 0; Bin = 0;
    #10 a = 1; b = 0; Bin = 1;
    #10 a = 1; b = 1; Bin = 0;
    #10 a = 1; b = 1; Bin = 1;
end
endmodule
//--------------------------------------FULL SUSBTRACTOR using BEHAVIOURAL MODELLING
module full_substractor_behavioural (a,b,Bin,diff,Bout);
input a,b,Bin;
output reg diff,Bout;

always@(*)begin
   diff = (a ^ b ^ Bin);
   Bout = ((~(a)&Bin)|(~(a)&b)|(b&Bin));
end
endmodule
module full_susbtractor_behavioural_tb; // testbench
reg a,b,Bin;
wire diff,Bout;

full_substractor_behavioural fe4t(a,b,Bin,diff,Bout);
initial begin
    a = 0; b = 0; Bin = 0;
    #10 a = 0; b = 0; Bin = 1;
    #10 a = 0; b = 1; Bin = 0;
    #10 a = 0; b = 1; Bin = 1;
    #10 a = 1; b = 0; Bin = 0;
    #10 a = 1; b = 0; Bin = 1;
    #10 a = 1; b = 1; Bin = 0;
    #10 a = 1; b = 1; Bin = 1;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------






