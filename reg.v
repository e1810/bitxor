module REG1B8SZ (
	input wire clk,
	input wire[2:0] inst,
	input wire[2:0] tent_idx,
	input wire xorval,
	output wire rangexor
	);

	wire[2:0] idx;
	generate
		genvar i;
		for(i=0; i<3; i=i+1) begin
			assign idx[i] = tent_idx[i] | (inst[0] | inst[1] | inst[2]);
		end
	endgenerate
	
	wire[7:0] in_use, out_use;
	INDECODER8 indec(idx, in_use);
	OUTDECODER8 outdec(idx, out_use);
	
	reg gnd = 1'b0;
	wire[7:0] bd;
	REGCORE regcore(clk, gnd, xorval, in_use[0], out_use, bd[0]);
	REGCORE regcore(clk, gnd, xorval, in_use[1], out_use, bd[1]);
	REGCORE regcore(clk, gnd, xorval, in_use[2], out_use, bd[2]);
	REGCORE regcore(clk, gnd, xorval, in_use[3], out_use, bd[3]);
	REGCORE regcore(clk, gnd, xorval, in_use[4], out_use, bd[4]);
	REGCORE regcore(clk, gnd, xorval, in_use[5], out_use, bd[5]);
	REGCORE regcore(clk, gnd, xorval, in_use[6], out_use, bd[6]);
	REGCORE regcore(clk, gnd, xorval, in_use[7], out_use, bd[7]);

	assign rangexor = bd[0] ^ bd[1] ^ bd[2] ^ bd[3] ^ bd[4] ^ bd[5] ^ bd[6] ^ bd[7];

endmodule
