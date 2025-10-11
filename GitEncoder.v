//Designing 4 to 2 Encoder using DataFlow Modelling
module encoder4x2_dflow (in,y0,y1);
input [0:3]in;
output y0,y1;

assign y0 = in[2] | in[3];
assign y1 = in[1] | in[3];
endmodule
module encoder4x2_dflow_tb; // TESTBENCH
reg [0:3]in;
wire y0,y1;

encoder4x2_dflow gga5(in,y0,y1);
initial begin
    in[0]=1; in[1]=0; in[2]=0; in[3]=0;
    #10 in[0]=0; in[1]=1; in[2]=0; in[3]=0;
    #10 in[0]=0; in[1]=0; in[2]=1; in[3]=0;
    #10 in[0]=0; in[1]=0; in[2]=0; in[3]=1;
    #10 in[0]=0; in[1]=0; in[2]=0; in[3]=0;
end
endmodule
//------------------------------------------------------------------------------------------------------------------------
//Designing 4 to 2 Encoder using Data Flow Modelling using Ternary Operator
module encoder4x2_dflow1 (in0,in1,in2,in3,y0,y1);
input in0,in1,in2,in3;
output y0,y1;

assign {y0,y1} = (in3) ? 2'b11:
                 (in2) ? 2'b10:
                 (in1) ? 2'b01:
                 (in0) ? 2'b00: 2'b00; // ternary nesting
endmodule
module encoder4x2_dflow1_tb; // TESTBENCH
reg in0,in1,in2,in3;
wire y0,y1;

encoder4x2_dflow1 asw34(in0,in1,in2,in3,y0,y1);
initial begin
    $monitor("Time = %t | in0 = %b, in1 = %b, in2 = %b, in3 = %b | y0 = %b, y1 = %b", $time,in0, in1, in2, in3, y0, y1);
    in0 = 1; in1 = 0; in2 = 0; in3 = 0;
    #10 in0 = 0; in1 = 1; in2 = 0; in3 = 0;
    #10 in0 = 0; in1 = 0; in2 = 1; in3 = 0;
    #10 in0 = 0; in1 = 0; in2 = 0; in3 = 1;
    #10 in0 = 0; in1 = 0; in2 = 0; in3 = 0;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------------------
// Designing 4 to 2 Encoder using Case Statement (Behavioural Modelling)
module encoder4x2_bycase (in0,in1,in2,in3,y0,y1);
input in0,in1,in2,in3;
output reg y0,y1;

always@(*)begin
    {y0, y1} = 2'b00;
       case ({in0, in1, in2, in3})
        4'b1000: {y0, y1} = 2'b00;
        4'b0100: {y0, y1} = 2'b01;
        4'b0010: {y0, y1} = 2'b10;
        4'b0001: {y0, y1} = 2'b11;
       endcase 
end
endmodule
module encoder4x2_bycase_tb; // TESTBENCH
reg in0,in1,in2,in3;
wire y0,y1;

encoder4x2_bycase a3sc(in0,in1,in2,in3,y0,y1);
initial begin
    $monitor("Time=%t | in0=%b in1=%b in2=%b in3=%b | y0=%b y1=%b", $time,in0,in1,in2,in3,y0,y1);
    in0 = 1; in1 = 0; in2 = 0; in3 = 0;
    #10 in0 = 0; in1 = 1; in2 = 0; in3 = 0;
    #10 in0 = 0; in1 = 0; in2 = 1; in3 = 0;
    #10 in0 = 0; in1 = 0; in2 = 0; in3 = 1;
    #10 in0 = 1; in1 = 0; in2 = 0; in3 = 0;
end
endmodule
//-------------------------------------------------------------------------------------------------------------------------------
//

    