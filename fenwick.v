module FENWICK(
	input wire clk,
	input wire reset,
	input wire[1:0] inst,
	input wire[2:0] idx,
	input wire val,
	output wire outval
	);

	wire delayed_clk, rangexor, isOUT;
	ISOUT outjudge(inst, isOUT);

	REG1B8SZ bitreg(clk, reset, inst, idx, val, ztonxor, delayed_clk);
	ENDPREG subt(delayed_clk, reset, inst, ztonxor, rangexor);
	assign outval = rangexor & isOUT;
	
endmodule
