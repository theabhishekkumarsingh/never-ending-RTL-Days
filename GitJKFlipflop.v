//----------------------------------------JK FLIPFLOP ------------------------------------------------------
module jkflipflop_1 (j,k,clk,rst,q,qbar);
input j,k;
input clk,rst;
output reg q,qbar;

always@(posedge clk or negedge rst)begin
    if (!rst)begin
        q <= 1'b0;
        qbar <= ~q;
    end else begin
        if (j == 0 && k == 0)begin
        q = q;end // memory stage
        
        else if (j == 0 && k == 1)begin
        q <= 1'b0; // Reset stage
        qbar <= 1'b1;end

        else if (j == 1 && k == 0)begin
        q <= 1'b1; // Set stage
        qbar <= 1'b0;end

        else begin
        q <= ~q; // Toggle stage
        qbar <= ~q;
        end
   end
end
endmodule
module jkflipflop_1_tb; // testbench
reg j,k;
reg clk=1,rst;
wire q,qbar;

jkflipflop_1 jkfff1(j,k,clk,rst,q,qbar);
always #3 clk = ~clk;
initial begin
    rst = 1'b0;
    #2 rst = 1'b1; j = 1'b0; k = 1'b0;
    #4 j = 1'b0; k = 1'b1;
    #4 j = 1'b1; k = 1'b0;
    #4 j = 1'b1; k = 1'b1;
    #4 j = 1'b0; k = 1'b0;
    #4 j = 1'b1; k = 1'b0;
    #4 j = 1'b1; k = 1'b1;
end
endmodule


