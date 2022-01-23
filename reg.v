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


module REG1B8SZ (
	input wire clk,
	input wire reset,
	input wire[1:0] inst,
	input wire[2:0] idx,
	input wire xorval,
	output wire rangexor
	//output wire[7:0] dat, DEBUG WIRE
	//output wire[7:0] bd
	);

	wire[2:0] in_idx, out_idx;
	generate
		genvar i;
		for(i=0; i<3; i=i+1) begin
			assign in_idx[i] = idx[i] | (inst[0] | inst[1]);
			assign out_idx[i] = idx[i] & (inst[0] & !inst[1]);
		end
	endgenerate
	
	wire[7:0] in_use, out_use;
	INDECODER8 indec(in_idx, in_use);
	OUTDECODER8 outdec(out_idx, out_use);
	
	wire[7:0] bd;
	REGCORE regcore0(clk, reset, xorval, in_use[0], out_use[0], bd[0]);
	REGCORE regcore1(clk, reset, xorval, in_use[1], out_use[1], bd[1]);
	REGCORE regcore2(clk, reset, xorval, in_use[2], out_use[2], bd[2]);
	REGCORE regcore3(clk, reset, xorval, in_use[3], out_use[3], bd[3]);
	REGCORE regcore4(clk, reset, xorval, in_use[4], out_use[4], bd[4]);
	REGCORE regcore5(clk, reset, xorval, in_use[5], out_use[5], bd[5]);
	REGCORE regcore6(clk, reset, xorval, in_use[6], out_use[6], bd[6]);
	REGCORE regcore7(clk, reset, xorval, in_use[7], out_use[7], bd[7]);

	assign rangexor = bd[0] ^ bd[1] ^ bd[2] ^ bd[3] ^ bd[4] ^ bd[5] ^ bd[6] ^ bd[7];
endmodule
