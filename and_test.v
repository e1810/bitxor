module ANDTEST;

reg a, b;
wire c;

AND and_instance(a, b, c);

initial begin
	$dumpfile("and_test.vcd");
	$dumpvars(1, ANDTEST);

	a = 0; b = 0;
	#10 a = 1;
	#10 a = 0; b = 1;
	#10 a = 1;
	#10 a = 0; b = 0;
	#10 $finish;
end

endmodule
