module ENDPREG (
	input wire clk,
	input wire reset,
	input wire[1:0] inst,
	input wire ztonxor,
	output wire ltorxor
	);

	wire isSETL, isSETR;
	ISSETL setljudge(inst, isSETL);
	ISSETR setrjudge(inst, isSETR);
	wire delayed_clk;
	assign #1 delayed_clk = clk;

	wire dL, qL;
	assign dL = (isSETL&ztonxor) | (!isSETL&qL);
	DFF regL(delayed_clk, reset, dL, qL);

	wire dR, qR;
	assign dR = (isSETR&ztonxor) | (!isSETR&qR);
	DFF regR(delayed_clk, reset, dR, qR);

	assign ltorxor = qL ^ qR;
endmodule
