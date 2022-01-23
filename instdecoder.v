// XOR 00
// ??? 01
// SETL 10
// SETR 11

module ISXOR (
	input wire[1:0] inst,
	output wire judge
	);
	assign judge = (!inst[0] & !inst[1]);
endmodule

module ISSETL (
	input wire[1:0] inst,
	output wire judge
	);
	assign judge = (!inst[0] & inst[1]);
endmodule

module ISSETR (
	input wire[1:0] inst,
	output wire judge
	);
	assign judge = (inst[0] & inst[1]);
endmodule
