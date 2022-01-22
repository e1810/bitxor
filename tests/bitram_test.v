module BITRAMTEST;

reg[2:0] idx;
wire[7:0] mask;

DECODER8 dec(idx, mask);

initial begin
	$dumpfile("bitram_test.vcd");
	$dumpvars(1, BITRAMTEST);
		idx = 3'b000;
	#10	idx = 3'b001;
	#10	idx = 3'b010;
	#10	idx = 3'b011;
	#10	idx = 3'b100;
	#10	idx = 3'b101;
	#10	idx = 3'b110;
	#10	idx = 3'b111;
	#10	$finish;
end

endmodule
