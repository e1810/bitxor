module REGCORE (
	input wire clk,
	input wire reset,
	input wire in0,
	input wire in_use,
	input wire out_use,
	output wire out0
	);

	wire delayed_clk;
	assign #1 delayed_clk = clk;

	wire d, q;
	assign d = (in0 & in_use) ^ q;
	DFF bitreg(.clk(delayed_clk), .reset(reset), .d(d), .q(q));

	assign out0 = q & out_use;
endmodule



