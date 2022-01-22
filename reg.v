module REG1B8SZ (
	input wire clk,
	input wire[1:0] inst,
	input wire[2:0] out_idx,
	input wire xorval,
	output wire rangexor
	//output wire[7:0] dat, DEBUG WIRE
	//output wire[7:0] bd
	);

	wire[2:0] in_idx;
	generate
		genvar i;
		for(i=0; i<3; i=i+1) begin
			assign in_idx[i] = out_idx[i] | (inst[0] | inst[1]);
		end
	endgenerate
	
	wire[7:0] in_use, out_use;
	INDECODER8 indec(in_idx, in_use);
	OUTDECODER8 outdec(out_idx, out_use);
	
	wire[7:0] bd;
	REGCORE regcore0(clk, 1'b0, xorval, in_use[0], out_use[0], bd[0]);
	REGCORE regcore1(clk, 1'b0, xorval, in_use[1], out_use[1], bd[1]);
	REGCORE regcore2(clk, 1'b0, xorval, in_use[2], out_use[2], bd[2]);
	REGCORE regcore3(clk, 1'b0, xorval, in_use[3], out_use[3], bd[3]);
	REGCORE regcore4(clk, 1'b0, xorval, in_use[4], out_use[4], bd[4]);
	REGCORE regcore5(clk, 1'b0, xorval, in_use[5], out_use[5], bd[5]);
	REGCORE regcore6(clk, 1'b0, xorval, in_use[6], out_use[6], bd[6]);
	REGCORE regcore7(clk, 1'b0, xorval, in_use[7], out_use[7], bd[7]);

	assign rangexor = bd[0] ^ bd[1] ^ bd[2] ^ bd[3] ^ bd[4] ^ bd[5] ^ bd[6] ^ bd[7];

endmodule
