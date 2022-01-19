module REGTEST;

reg clk;
wire out0, d, q;

reg in0 = 0;
reg reset = 1'b1;
reg in_use = 1'b0;
reg out_use = 1'b1;

parameter STEP = 10;
always begin
	clk = 1; #(STEP/2);
	clk = 0; #(STEP/2);
end


REG xreg(clk, reset, in0, in_use, out_use, out0, d, q);

initial begin
	$dumpfile("reg_test.vcd");
	$dumpvars(1, REGTEST);
	#STEP	reset = 1'b0;
	#STEP	in_use = 1'b0; in0 = 1'b0;
	#STEP	in_use = 1'b0; in0 = 1'b1;
	#STEP	in_use = 1'b1; in0 = 1'b1;
	#STEP	in_use = 1'b0; in0 = 1'b0;
	#STEP	in_use = 1'b1; in0 = 1'b0;
	#STEP	$finish;
end

endmodule
