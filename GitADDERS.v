// ----------------------------------------HALF ADDER using GATE LEVEL MODELLING-----------------------------------------------------
module halfadder_gatelevel (a,b,sum,carry);
input a,b;
output sum,carry;

xor (sum,a,b);
and (carry,a,b);
endmodule
module halfadder_gatelevel_tb; // testbench
reg a,b;
wire sum,carry;

halfadder_gatelevel s49(a,b,sum,carry);
initial begin
 a = 0; b = 0;
 #5 a = 0; b = 1;
 #5 a = 1; b = 0;
 #5 a = 1; b = 1;
end
endmodule

// ----------------------------------------HALF ADDER using DATA FLOW MODELLING-----------------------------------------------------
module halfadder_dataflow (a,b,sum,carry);
input a,b;
output sum,carry;

assign sum = a ^ b;
assign carry = a & b;
endmodule
module halfaddder_dataflow_tb; // testbench
reg a,b;
wire sum,carry;

halfadder_dataflow aj4 (a,b,sum,carry);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule

// ----------------------------------------HALF ADDER using BEHAVIOURAL MODELLING-----------------------------------------------------
module halfadder_behavioural (a,b,sum,carry);
input a,b;
output reg sum,carry;

always@(*)begin
    sum = a ^ b;
    carry = a & b;
end
endmodule
module halfadder_behavioural_tb; // testbench
reg a,b;
wire sum,carry;

halfaddder_behavioural ad4(a,b,sum,carry);
initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------FULL ADDER using GATE LEVEL MODELLING---------------------------------------------------------
module fulladder_gatelevel (a,b,cin,sum,carry);
input a,b,cin;
output sum, carry;
wire sum1,carry1, carry2; 

xor (sum1,a,b);
xor (sum,sum1,cin);
and (carry1,a,b);
and (carry2,sum1,cin);
or (carry,carry1,carry2);
endmodule
module fulladder_gatelevel_tb; // testbench
reg a,b,cin;
wire sum,carry;

fulladder_gatelevel aas21(a,b,cin,sum,carry);
initial begin
a = 0; b = 0; cin = 0;
#10 a = 0; b = 1; cin = 0;
#10 a = 0; b = 1; cin = 1;
#10 a = 1; b = 0; cin = 0;
#10 a = 1; b = 0; cin = 1;
#10 a = 1; b = 1; cin = 0;
#10 a = 1; b = 1; cin = 1;
end
endmodule
//----------------------------------FULL ADDER using DATA FLOW MODELLING-----------------------------------------------------------
module fulladder_dataflow(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;

assign sum = (a ^ b ^ cin);
assign carry = ((a&b)|(b&c)|(a&c));
endmodule
module fulladder_dataflow_tb; // testbench
reg a,b,cin;
wire sum,carry;

fulladder_dataflow dwr4(a,b,cin,sum,carry);
initial begin
a = 0; b = 0; cin = 0;
#10 a = 0; b = 1; cin = 0;
#10 a = 0; b = 1; cin = 1;
#10 a = 1; b = 0; cin = 0;
#10 a = 1; b = 0; cin = 1;
#10 a = 1; b = 1; cin = 0;
#10 a = 1; b = 1; cin = 1;
end
endmodule
//----------------------------------FULL ADDER using BEHAVIOURAL MODELLING---------------------------------------------------------
module fulladder_behavioural(a,b,cin,sum,carry);
input a,b,cin;
output reg sum carry;

always@(*)begin
    sum = (a^b^cin);
    carry = ((a&b)|(b&c)|(c&a));
end
endmodule
module fulladder_behavioural_tb; // testbench
reg a,b,cin;
wire sum,carry;

fulladder_behavioural sas4(a,b,cin,sum,carry);
initial begin
a = 0; b = 0; cin = 0;
#10 a = 0; b = 1; cin = 0;
#10 a = 0; b = 1; cin = 1;
#10 a = 1; b = 0; cin = 0;
#10 a = 1; b = 0; cin = 1;
#10 a = 1; b = 1; cin = 0;
#10 a = 1; b = 1; cin = 1;
end
endmodule
//--------------------------------------------------------------------------------------------------------------------------------------
