module DFFTEST;

reg clk;
reg d;
wire q;
reg reset = 1'b0;

parameter STEP = 10;
always begin
	clk = 1; #(STEP/2);
	clk = 0; #(STEP/2);
end


DFF dff(.clk(clk), .reset(reset), .d(d), .q(q));

initial begin
	$dumpfile("dff_test.vcd");
	$dumpvars(1, DFFTEST);
		d = 1'b0;
	#STEP	d = 1'b1;
	#STEP
	#STEP	reset = 1'b1;
	#STEP	reset = 1'b0;
	#STEP	d = 1'b0;
	#STEP	d = 1'b1;
	#STEP	d = 1'b1;
	$finish;
end

endmodule
	
