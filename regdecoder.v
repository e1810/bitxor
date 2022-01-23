module INDECODER2STEP (
	input wire idx,
	input wire p,
	output wire[1:0] mask
	);

	assign mask[0] = p & !idx;
	assign mask[1] = p | idx;
endmodule


module INDECODER4STEP (
	input wire idx,
	input wire[1:0] p,
	output wire[3:0] mask
	);

	assign mask[0] = p[0] & !idx;
	assign mask[1] = p[1] & !idx;
	assign mask[2] = p[0] & idx;
	assign mask[3] = p[1] | idx;
endmodule


module INDECODER8STEP (
	input wire idx,
	input wire[3:0] p,
	output wire[7:0] mask
	);
	
	generate
		genvar i;
		for(i=0; i<4; i=i+1) assign mask[i] = p[i] & !idx;
		for(i=4; i<7; i=i+1) assign mask[i] = p[i-4] & idx;
		assign mask[7] = p[3] | idx;
	endgenerate

endmodule


module INDECODER8 (
	input wire[2:0] idx,
	output wire[7:0] mask
	);

	reg src = 1'b1;
	wire[1:0] p2b;
	INDECODER2STEP bit0(idx[0], src, p2b);
	wire[3:0] p4b;
	INDECODER4STEP bit1(idx[1], p2b, p4b);
	INDECODER8STEP bit2(idx[2], p4b, mask);
endmodule


// -------------------------------------------


module OUTDECODER2STEP (
	input wire idx,
	input wire p,
	output wire[1:0] mask
	);

	assign mask[0] = p | idx;
	assign mask[1] = p & idx;
endmodule


module OUTDECODER4STEP (
	input wire idx,
	input wire[1:0] p,
	output wire[3:0] mask
	);

	assign mask[0] = p[0] & !idx;
	assign mask[1] = p[1] | idx;
	assign mask[2] = p[0] & idx;
	assign mask[3] = p[1] & idx;
endmodule


module OUTDECODER8STEP (
	input wire idx,
	input wire[3:0] p,
	output wire[7:0] mask
	);

	generate
		genvar i;
		for(i=0; i<3; i=i+1) assign mask[i] = p[i] & !idx;
		assign mask[3] = p[3] | idx;
		for(i=4; i<8; i=i+1) assign mask[i] = p[i-4] & idx;
	endgenerate

endmodule


module OUTDECODER8 (
	input wire[2:0] idx,
	output wire[7:0] mask
	);

	reg gnd = 1'b0;	
	wire[1:0] p2b;
	OUTDECODER2STEP bit0(idx[0], gnd, p2b);
	wire[3:0] p4b;
	OUTDECODER4STEP bit1(idx[1], p2b, p4b);
	OUTDECODER8STEP bit2(idx[2], p4b, mask);
endmodule
