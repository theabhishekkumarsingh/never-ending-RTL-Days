//++++++++++++++++++++++++++++++++++++++++ GATE LEVEL MODELLING +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ----------------------------------- OR gate by Gate level modelling 
module or_gatelevel(y,a,b);
input a,b;
output y;

or (y,a,b);
endmodule
module or_gatelevel_tb; // Testbench
reg a,b;
wire y;

or_gatelevel gili(y,a,b);

initial begin
  a = 0; b = 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule

// ------------------------------------AND gate by Gate level modelling
module and_gatelevel(y,a,b);
input a,b;
output y;

and (y,a,b);
endmodule
module and_gatelevel_tb;
reg a,b;
wire y;

and_gatelevel helx(y,a,b);
initial begin 
  a = 0; b = 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule

// --------------------------------------------------- NOT gate 
module not_gatelevel(out, in);
input in;
output out;
 
 not (out,in);
endmodule
module not_gatelevel_tb; // testbench
reg in;
wire out;

not_gatelevel goxx(out,in);
initial begin
  in = 0;
  #10 in = 1;
end
endmodule

// ------------------------------------------------------ NAND GATE
module nand_gatelevel (a,b,y);
input a,b;
output y;

nand (y,a,b);
endmodule
module nand_gatelevel_tb; // testbench
reg a,b;
wire y;

nand_gatelevel jpee(a,b,y);
initial begin
  a = 0; b = 0;
  #10 a = 0; b = 1;
  #10 a = 1; b = 0;
  #10 a = 1; b = 1;
end
endmodule
//--------------------------------------------------- NOR Gate 
module nor_gatelevel (a,b,y);
input a, b;
output y;

nor (y,a,b);
endmodule
module not_gatelevl_tb; // testbench
reg a,b;
wire y;

nor_gatelevel ghjk(a,b,y);
initial begin
a = 0; b = 0;
#10 a = 0; b = 1;
#10 a = 1; b = 0;
#10 a = 1; b = 1;
end
endmodule
//------------------------------------------------------- XOR GATE
module xor_gatelevel (a,b,y);
input a,b;
output y;

xor (y,a,b);
endmodule
module xor_gatelevel_tb; // testbench
reg a,b;
wire y;

xor_gatelevel hkgt(a,b,y);
initial begin
  a = 0; b = 0;
  #10 a = 0; b = 1;
  #10 a = 1; b = 0;
  #10 a = 1; b = 1;
end
endmodule
//------------------------------------------------------------XNOR Gate
module xnor_gatelevel (a,b,y);
input a,b;
output y;

xnor (y,a,b);
endmodule
module xnor_gatelevel_tb; // testbench
reg a,b;
wire y;

xnor_gatelevel hvssw(a,b,y);
initial begin
  a = 0; b = 0;
  #10 a = 0; b = 1;
  #10 a = 1; b = 0;
  #10 a = 1; b = 1;
end
endmodule

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++DATA FLOW MODELLING+++++++++++++++++++++++++++++++++++++++++++++++++++++++
//----------------------------------------------- OR Gate by Data flow modelling
module OR_dataflow(a,b,y);
input a,b;
output y;

assign y = a | b;
endmodule
module OR_dataflow_tb; // testbench
reg a,b;
wire y;

OR_dataflow dj13(a,b,y);
initial begin
  a = 0; b =0;
#5 a = 0; b = 1;
#5 a = 1; b = 0;
#5 a = 1; b = 1;
end
endmodule

//------------------------------------------------ AND Gate by Data flow modelling
module AND_dataflow(a,b,y);
input a,b;
output y;

assign y = a & b;
endmodule
module AND_dataflow_tb; // testbench
reg a,b;
wire y;

AND_dataflow adb324 (a,b,y);
initial begin
  a = 0; b = 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule
//--------------------------------------------------- NOT GATE
module NOT_dataflow(in, out);
input in;
output out;

assign out = ~in;
endmodule
module NOT_dataflow_tb;
reg in;
wire out;

NOT_dataflow aijd8(in, out);
initial begin
  in = 0;
  #10 in = 1;

end
endmodule
//----------------------------------------------------NAND GATE (Universal Gate)
module nand_dataflow(a,b,out);
input a,b;
output out;

assign out = ~(a & b);
endmodule
module nand_dataflow_tb;
reg a,b;
wire out;

nand_dataflow adkh(a,b,out);
initial begin
  a = 0; b = 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule
//---------------------------------------------------NOR GATE (Universal Gate)
module nor_dataflow(a,b,out);
input a,b;
output out;

assign out = ~(a|b);
endmodule
module nor_dataflow_tb; // testbench
reg a,b;
wire out;

nor_dataflow a23(a,b,out);
initial begin 
  a = 0; b= 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule
//----------------------------------------------------XOR GATE (Arithmetic gate)
module xor_dataflow (a,b,out);
input a,b;
output out;

assign out = (a ^ b);
endmodule
module xor_dataflow_tb; // testbench
reg a,b;
wire out;

xor_dataflow as1(a,b,out);
initial begin
  a = 0; b = 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule
//------------------------------------------------------XNOR GATE (Arithmetic gate)
module xnor_dataflow (a,b,out);
input a,b;
output out;

assign out = ~(a ^ b);
endmodule
module xnor_dataflow_tb; // testbench
reg a,b;
wire out;

xnor_dataflow as3(a,b,out);
initial begin
  a = 0; b = 0;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule
//-------------------------------------------------

































module and_gate(a,b,out);
input a,b;
output out;

 assign out = a & b;
endmodule
module and_gate_tb;
reg a,b;
wire out;

and_gate hhh(a,b,out);
initial begin
  $monitor("a = %b, b = %b, out = %b", a,b,out);
  a =0; b =0 ;
  #5 a = 0; b = 1;
  #5 a = 1; b = 0;
  #5 a = 1; b = 1;
end
endmodule

// ---------------------------------------------------OR GATE---------------------------------------------------------------
 




