module XORTEST;

reg a, b;
wire c;
XOR xor_instance(a, b, c);

initial begin
	$dumpfile("and_test.vcd");
	$dumpvars(1, XORTEST);

	a = 0; b = 0;
	#10 a = 1;
	#10 a = 0; b = 1;
	#10 a = 1;
	#10 a = 0; b = 0;
	#10 $finish;
end

endmodule
