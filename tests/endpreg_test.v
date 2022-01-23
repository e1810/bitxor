module ENDPREGTEST;

reg clk, reset, ztonxor;
reg[1:0] inst = 2'b00;
wire ltorxor;

parameter STEP = 10;
always begin
	clk = 1; #(STEP/2);
	clk = 0; #(STEP/2);
end

wire qL, qR, delayed_clk;
assign #1 delayed_clk = clk;
ENDPREG endpreg(delayed_clk, reset, inst, ztonxor, qL, qR, ltorxor);

initial begin
	$dumpfile("endpreg_test.vcd");
	$dumpvars(1, ENDPREGTEST);
		reset = 1'b1;
	#STEP	reset = 1'b0;
	#STEP	inst = 2'b10; ztonxor = 1'b1;
	#STEP	inst = 2'b00; ztonxor = 1'b1;
	#STEP	inst = 2'b11; ztonxor = 1'b1;
	#STEP	inst = 2'b10; ztonxor = 1'b1;
	#STEP	inst = 2'b10; ztonxor = 1'b0;
	#STEP	$finish;
end

endmodule


