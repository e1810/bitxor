module ENDPREG (
	input wire clk,
	input wire reset,
	input wire[1:0] inst,
	input wire ztonxor,
	output wire qL,
	output wire qR,
	output wire ltorxor
	);

	wire isSETL, isSETR;
	ISSETL setljudge(inst, isSETL);
	ISSETR setrjudge(inst, isSETR);

	wire dL;
	assign dL = (isSETL&ztonxor) | (!isSETL&qL);
	DFF regL(clk, reset, dL, qL);

	wire dR;
	assign dR = (isSETR&ztonxor) | (!isSETR&qR);
	DFF regR(clk, reset, dR, qR);

	assign ltorxor = qL ^ qR;
endmodule
