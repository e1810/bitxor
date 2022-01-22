module DECODER2STEP (
	input wire idx,
	input wire p,
	output wire[1:0] mask
	);

	assign mask[0] = p & !idx;
	assign mask[1] = p;
endmodule


module DECODER4STEP (
	input wire idx,
	input wire[1:0] p,
	output wire[3:0] mask
	);

	assign mask[0] = p[0] & !idx;
	assign mask[1] = p[1] & !idx;
	assign mask[2] = p[0] & idx;
	assign mask[3] = p[1];
endmodule

module DECODER8STEP (
	input wire idx,
	input wire[3:0] p,
	output wire[7:0] mask
	);

//	assign mask[0] = p[0] & !idx;
//	assign mask[1] = p[1] & !idx;
//	assign mask[2] = p[2] & !idx;
//	assign mask[3] = p[3] & !idx;
//	assign mask[4] = p[0] & idx;
//	assign mask[5] = p[1] & idx;
//	assign mask[6] = p[2] & idx;
//	assign mask[7] = p[3];

	generate
	genvar i;
	for(i=0; i<4; i=i+1) assign mask[i] = p[i] & !idx;
	for(i=4; i<7; i=i+1) assign mask[i] = p[i-4] & idx;
	assign mask[7] = p[3];
	endgenerate

endmodule


module DECODER8 (
	input wire[2:0] idx,
	output wire[7:0] mask
	);

	reg src = 1'b1;
	wire[1:0] p2b;
	DECODER2STEP bit0(idx[0], src, p2b);
	wire[3:0] p4b;
	DECODER4STEP bit1(idx[1], p2b, p4b);
	DECODER8STEP bit2(idx[2], p4b, mask);
endmodule
