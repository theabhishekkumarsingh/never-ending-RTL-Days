// ---------------------------Designing D Flipflop using synchronus reset-------------------------------------------
module d_flipflop_1(d,q,clk,rst);
input d,clk,rst;
output reg q;

always@(posedge clk or posedge rst)begin
    if (rst) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end
endmodule
module d_flipflop_1_tb; // testbench
reg d,clk = 1'b0,rst;
wire q;

d_flipflop_1 ffff1(d,q,clk,rst);
always #5 clk = ~clk;
initial begin
    rst = 1;
    #7 rst = 0; d = 1'b1;
    #3 d = 1'b0; #3 d = 1'b0; #3 d = 1'b1; #3 d = 1'b1;
    #3 d = 1'b1; #3 d = 1'b0; #3 d = 1'b0; #3 d = 1'b1;
    #3 d = 1'b1; #3 d = 1'b1; #3 d = 1'b0; #3 d = 1'b0;
end
endmodule
 
// ------------------------Designing D Flipflop using Asynchronous reset-----------------------------------------------
module d_flipflop_2(d,q,clk,rst);
input d,clk,rst;
output reg q;

always@(posedge clk or negedge rst)begin
    if (!rst)begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end
endmodule
module d_flipflop_2_tb; // testbench
reg d,clk = 1,rst;
wire q;

d_flipflop_2 ffff2(d,q,clk,rst);
always #5 clk = ~clk;
initial begin
    rst = 1'b0; 
    #7 rst = 1'b1; #3 d = 1'b1;
    #3 d = 1'b0; #3 d = 1'b0; #3 d = 1'b1; #3 d = 1'b1;
    #3 d = 1'b1; #3 d = 1'b0; #3 d = 1'b0; #3 d = 1'b1;
    #3 d = 1'b1; #3 d = 1'b1; #3 d = 1'b0; #3 d = 1'b0;
end
endmodule
//----------------------------anpother method to implement d flipflop
module d_flipflop_3(d,q,clk,rst);
input d,clk,rst;
output reg q;

always@(posedge clk)begin // here we have used synchronous reset method, else we can write this way also without mentioning posedge rst 
    if (rst) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end
endmodule
module d_flipflop_3_tb; // testbench
reg d,clk = 1'b1,rst;
wire q;

d_flipflop_3 ffff3(d,q,clk,rst);
always #5 clk = ~clk;
initial begin
    rst = 1;
    #7 rst = 0; d = 1'b1;
    #3 d = 1'b0; #3 d = 1'b0; #3 d = 1'b1; #3 d = 1'b1;
    #3 d = 1'b1; #3 d = 1'b0; #3 d = 1'b0; #3 d = 1'b1;
    #3 d = 1'b1; #3 d = 1'b1; #3 d = 1'b0; #3 d = 1'b0;
end
endmodule
//-----------------------------------------------------------------------------------------------------------------------


