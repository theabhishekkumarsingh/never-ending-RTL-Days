//----------------------------------------RANDOM BOOLEAN EXPRESSION
//------------------- (ABC+A'C'+D) using GATE LEVEL MODELLING
module booleanexp1_gatelevel (a,b,c,d,out);
input a,b,c,d;
output out;
wire out1,out2,not1,not2;

// (abc+a'c'+d) 
and (out1,a,b,c);

not (not1,a);
not (not2,c);
and (out2,not1,not2);

or (out,out1,out2,d);
endmodule

//------------------------------------OR-------------------------------------------------------------------
// ---------------(ABC+A'C'+D) using DATA FLOW MODELLING
module booleanexp1_dataflow (a,b,c,d,out);
input a,b,c,d;
output out;

// (abc+a'c'+d)
assign out = ((a&b&c)|(~(a)&~(c))|(d));
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
//---------------------(ABC'D+AB'CD+ABC'+AC) using DATA FLOW MODELLING
module booleanexp2_dataflow (a,b,c,d,out);
input a,b,c,d;
output out;

// (abc'd+ab'cd+abc'+ac)
assign out = ((a&b&~(c)&d)|(a&~(b)&c&d)|(a&b&~(c))|(a&c));
endmodule
//------------------------------------------------------------------------------------------------------------------------------------




