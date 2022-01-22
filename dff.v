module DFF (
	input wire clk,
	input wire reset,
	input wire d,
	output reg q
	);

	always @(posedge clk) begin
		if(reset == 1'b1) q <= 0;
		else q <= d;
	end

	initial q <= 0;
endmodule

