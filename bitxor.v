module BITXOR;

reg clk, reset;
reg[1:0] inst;
reg[2:0] idx;
reg val;
wire rangexor;

parameter STEP = 10;
always begin
	clk = 1; #(STEP/2);
	clk = 0; #(STEP/2);
end

FENWICK fenwick(clk, reset, inst, idx, val, rangexor);

initial begin
	$dumpfile("bitxor.vcd");
	$dumpvars(1, BITXOR);
		reset = 1'b1; inst = 2'b00; idx = 3'b000; val = 1'b0;
	#STEP	reset = 1'b0;
	#STEP	inst = 2'b00; val = 1'b1; idx = 3'b000;
	#STEP	inst = 2'b00; val = 1'b0; idx = 3'b000;
	#STEP	inst = 2'b00; val = 1'b1; idx = 3'b100;
	#STEP	inst = 2'b11; val = 1'b0; idx = 3'b111;
	#STEP	inst = 2'b01;
	#STEP	inst = 2'b11; val = 1'b0; idx = 3'b011;
	#STEP	inst = 2'b01;
	#STEP	inst = 2'b11; val = 1'b1; idx = 3'b100;
	#STEP	inst = 2'b01;

	#STEP	inst = 2'b00; val = 1'b1; idx = 3'b101;
	#STEP	inst = 2'b00; val = 1'b1; idx = 3'b110;
	#STEP	inst = 2'b00; val = 1'b1; idx = 3'b000;
	#STEP	inst = 2'b11; val = 1'b0; idx = 3'b011;
	#STEP	inst = 2'b01;
	#STEP	inst = 2'b11; val = 1'b1; idx = 3'b111;
	#STEP	inst = 2'b01;
	#STEP	$finish;
end

endmodule
