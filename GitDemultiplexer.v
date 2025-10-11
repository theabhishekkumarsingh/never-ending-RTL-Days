// Designing 1:4 Demultiplexer 
module demux1x4(in,y0,y1,y2,y3,sel0,sel1);
input in,sel0,sel1;
output y0,y1,y2,y3;

assign y0 = (~sel1 & ~sel0 & in);
assign y1 = (~sel1 & sel0 & in);
assign y2 = (sel1 & ~sel0 & in);
assign y3 = (sel1 & sel0 & in);
endmodule
module demux1x4_tb; // TESTBENCH of Demultiplexer
reg in,sel0,sel1;
wire y0,y1,y2,y3;

demux1x4 axh3(in,y0,y1,y2,y3,sel0,sel1);
initial begin
    sel1 = 0; sel0 = 0; in = 1;
    #10 sel1 = 0; sel0 = 1; in = 1;
    #10 sel1 = 1; sel0 = 0; in = 1;
    #10 sel1 = 1; sel0 = 1; in = 1;
    #10 sel1 = 0; sel0 = 0; in = 1;
end
endmodule
//----------------------------------------------------------------------------------------------------------------------------------
// Designing 1:4 Demultiplexer using Case Statement  (Behavioural Modelling)
module demux1x4_bmodelling(in,y0,y1,y2,y3,sel0,sel1);
input in,sel0,sel1;
output reg y0,y1,y2,y3;

always@(*)begin
    y0 = 1'b0;
    y1 = 1'b0;
    y2 = 1'b0;
    y3 = 1'b0;
    
    case({sel1,sel0})
    2'b00: y0 = in;
    2'b01: y1 = in;
    2'b10: y2 = in;
    2'b11: y3 = in;
    default : begin
        y0 = 1'b0;
        y1 = 1'b0;
        y2 = 1'b0;
        y3 = 1'b0;
    end
    endcase
    end
endmodule
module  demux1x4_bmodelling_tb; // TESTBENCH
reg in,sel0,sel1;
wire y0,y1,y2,y3;

demux1x4_bmodelling gh13(in,y0,y1,y2,y3,sel0,sel1);
initial begin
    in = 1;sel1 = 0; sel0 = 0;
    #10 sel1 = 0; sel0 = 1;
    #10 sel1 = 1; sel0 = 0;
    #10 sel1 = 1; sel0 = 1;
    #10 sel1 = 0; sel0 = 0;
end
endmodule
//------------------------------------------------------------------------------------------------------------------------------------
// Designing 1:4 Demultiplexer usign if-else statement (Behavioural Modelling)
module demux_1x4_byifelse (in,sel0,sel1,y0,y1,y2,y3);
input in,sel0,sel1;
output reg y0,y1,y2,y3;

always@(*)begin
    y0 = 1'b0; y1 = 1'b0; y2 = 1'b0; y3 = 1'b0; // Initializing all the output as Zero

 if (sel0 == 0 && sel1 == 0)begin
    y0 = in;end
    else if(sel0 == 0 && sel1 == 1)begin
    y1 = in;end
    else if(sel0 == 1 && sel1 == 0)begin
    y2 = in;end
    else if(sel0 == 1 && sel1 == 1)begin
    y3 = in;end
end
endmodule
module demux_1x4_byifelse_tb; // TESTBENCH
reg in,sel0,sel1;
wire y0,y1,y2,y3;

demux_1x4_byifelse a1324(in,sel0,sel1,y0,y1,y2,y3);
initial begin
    $monitor("Time=%0t | in=%b | sel0=%b sel1=%b | y0=%b y1=%b y2=%b y3=%b",$time, in, sel0, sel1, y0, y1, y2, y3);
    in = 1;sel0 = 0; sel1 = 0;
    #10 sel0 = 0; sel1 = 1;
    #10 sel0 = 1; sel1 = 0;
    #10 sel0 = 1; sel1 = 1;
    #10 sel0 = 0; sel1 = 0;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------------------
//Designing 1:8 Demultiplexer using DataFlow Modelling
module demux_1x8_dflow(in,y,sel0,sel1,sel2);
input in,sel0,sel1,sel2;
output [0:7]y;

assign y[0] = ~sel0 & ~sel1 & ~sel2;
assign y[1] = ~sel0 & ~sel1 & sel2;
assign y[2] = ~sel0 & sel1 & ~sel2;
assign y[3] = ~sel0 & sel1 & sel2;
assign y[4] = sel0 & ~sel1 & ~sel2;
assign y[5] = sel0 & ~sel1 & sel2;
assign y[6] = sel0 & sel1 & ~sel2;
assign y[7] = sel0 & sel1 & sel2;
endmodule
module demux_1x8_dflow_tb; // TESTBENCH
reg in,sel0,sel1,sel2;
wire [0:7]y;

demux_1x8_dflow gdh2(in,y,sel0,sel1,sel2);
initial begin
    $monitor ("Time = %0t | sel0 = %b  sel1 = %b  sel2 = %b | in = %b | y[0]=%b y[1]=%b y[2]=%b y[3]=%b y[4]=%b y[5]=%b y[6]=%b y[7]=%b",
     $time, sel0, sel1, sel2, in, y[0], y[1],y[2], y[3],y[4], y[5],y[6], y[7],);
    in = 1; sel0 = 0; sel1 = 0; sel2 = 0;
    #10 sel0 = 0; sel1 = 0; sel2 = 1;
    #10 sel0 = 0; sel1 = 1; sel2 = 0;
    #10 sel0 = 0; sel1 = 1; sel2 = 1;
    #10 sel0 = 1; sel1 = 0; sel2 = 0;
    #10 sel0 = 1; sel1 = 0; sel2 = 1;
    #10 sel0 = 1; sel1 = 1; sel2 = 0;
    #10 sel0 = 1; sel1 = 1; sel2 = 1;
    #10 sel0 = 0; sel1 = 0; sel2 = 0;
end
endmodule

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Designing 1:8 Demultiplexer using Case Statement (Behavioural Modelling)
module demux1x8_bycase (in,y,sel0,sel1,sel2);
input in,sel0,sel1,sel2;
output reg [0:7]y;

always@(*)begin
    y[0]= 1'b0;
    y[1]= 1'b0;
    y[2]= 1'b0;
    y[3]= 1'b0;
    y[4]= 1'b0;
    y[5]= 1'b0;
    y[6]= 1'b0;
    y[7]= 1'b0;

    case({sel0,sel1,sel2}) 
        3'b000: y[0] = in;
        3'b001: y[1] = in;
        3'b010: y[2] = in;
        3'b011: y[3] = in;
        3'b100: y[4] = in;
        3'b101: y[5] = in;
        3'b110: y[6] = in;
        3'b111: y[7] = in;  
        default: begin
            y[0]= 1'b0;
            y[1]= 1'b0;
            y[2]= 1'b0;
            y[3]= 1'b0;
            y[4]= 1'b0;
            y[5]= 1'b0;
            y[6]= 1'b0;
            y[7]= 1'b0;
        end
    endcase
end
endmodule
module demux1x8_bycase_tb; // TESTBENCH
reg in,sel0,sel1,sel2;
wire [0:7]y;

demux1x8_bycase dcsf(in,y,sel0,sel1,sel2);
initial begin
    $monitor("Time=%t | in=%b | sel0 = %b sel1=%b sel2=%b | y[0]=%b y[1]=%b y[2]=%b y[3]=%b y[4]=%b y[5]=%b y[6]=%b y[7]=%b", 
      $time, in, sel0, sel1, sel2, y[0], y[1], y[2], y[3], y[4], y[5], y[6], y[7]);
    in = 1; sel0 = 0; sel1 = 0; sel2 = 0;
    #10 sel0 = 0; sel1 = 0; sel2 = 1;
    #10 sel0 = 0; sel1 = 1; sel2 = 0;
    #10 sel0 = 0; sel1 = 1; sel2 = 1;
    #10 sel0 = 1; sel1 = 0; sel2 = 0;
    #10 sel0 = 1; sel1 = 0; sel2 = 1;
    #10 sel0 = 1; sel1 = 1; sel2 = 0;
    #10 sel0 = 1; sel1 = 1; sel2 = 1;
end
endmodule
//---------------------------------------------------------------------------------------------------------------------------------------------
        
