//----------------------------------------------Designing T Flipflop without reset--------------------------------------------------------
module t_flipflop_0 (t,clk,q);
input  clk,t;
output reg q=0;

always@(posedge clk)begin
    if(t == 0)
      q <= q;
    else 
      q <= ~q;
end
endmodule
module t_flipflop_0_tb; // testbench
reg clk = 0,t;
wire q;

t_flipflop_0 g2h32(t,clk,q);

always #3 clk = ~clk;
initial begin
t = 0;
#5 t = 1;
#9 t = 0;
#6 t = 1;
#5 t = 0;
#4 t = 1;
#5 t = 1;
end
endmodule
//-----------------------------------------------Designing T Flipflop using asynchronous reset--------------------------------------------------
module t_flipflop_1 (t,clk,rst,q);
input t,clk,rst;
output reg q;

always@(posedge clk or negedge rst)begin
    if (!rst)begin
        q <= 0;
    end
    else begin
        if (t == 0)begin
        q <= q;end // Hold State when t gets 0
        else 
        q <= ~q; // toggle when  t gets 1
    end
end
endmodule
module t_flipflop_1_tb; // testbench for t flipflop using asynchronous reset
reg t,clk=0,rst;
wire q;

t_flipflop_1 aswe232(t,clk,rst,q);

always #6 clk = ~ clk;
initial begin
    $monitor("Time: %t, clk: %b, t: %b, q: %b", $time, clk, t, q);
    rst = 0;
    #3 rst = 1; t = 0;
    #8 t = 1;
    #5 t = 0;
    #7 t = 1;
    #30 $finish;
end
endmodule
//-----------------------------Designing T Flipflop using synchronous reset-----------------------------------------------------
module tflipflop_2 (clk,rst,t,q);
input clk,rst,t;
output reg q;

always@(posedge clk or posedge rst)begin
    if (rst)begin
        q <= 0;
    end
    else begin
        if (t == 0)begin
            q <= q;
        end
        else begin
            q <= ~q;
        end
    end
end
endmodule
module tflipflop_2_tb; // testbench for t flipflop using synchronous reset
reg clk = 0,rst,t;
wire q;

tflipflop_2 asb2j(clk,rst,t,q);

always #5 clk = ~clk;
initial begin
$monitor("Time: %t clk: %b t: %b q: %b",$time, clk, t, q);
rst = 1;
#3 rst = 0; t = 0;
#4 t = 1;
#4 t = 0;
#4 t = 1;
end
endmodule





