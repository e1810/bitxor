module REG (
	input wire clk,
	input wire reset,
	input wire in0,
	input wire in_use,
	input wire out_use,
	output wire out0,
	output wire d,
	output wire q
	);

	assign d = (in0 & in_use) ^ q;

	//wire d;
	//wire q;
	DFF bitreg(.clk(clk), .reset(reset), .d(d), .q(q));
	assign out0 = q & out_use;
endmodule



