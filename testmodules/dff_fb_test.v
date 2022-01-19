module DFFFBTEST;

reg clk;
reg reset = 1;
reg in0 = 0;
reg in_use = 0;
wire q;

parameter STEP = 10;
always begin
	clk = 1; #(STEP/2);
	clk = 0; #(STEP/2);
end

wire d;
assign d = (in0) ^ q; // こっちは問題なし
// assign d = (in0 & in_use) ^ q; これだとqの値が1クロック遅れてでる。
DFF fbreg(clk, reset, d, q);

initial begin
	$dumpfile("dff_fb_test.vcd");
	$dumpvars(1, DFFFBTEST);

	#STEP   reset = 1'b0;
        #STEP   in_use = 1'b0; in0 = 1'b0;
        #STEP   in_use = 1'b0; in0 = 1'b1;
        #STEP   in_use = 1'b1; in0 = 1'b1;
        #STEP   in_use = 1'b0; in0 = 1'b0;
        #STEP   in_use = 1'b1; in0 = 1'b0;
        #STEP   $finish;
end

endmodule

