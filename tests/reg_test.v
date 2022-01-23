module REGTEST;

reg clk, reset;
reg[1:0] inst;		// 00=xor idx val, 01=setr idx
reg[2:0] idx = 3'b000;
reg in0 = 0;
wire rangexor;

parameter STEP = 10;
always begin
	clk = 1; #(STEP/2);
	clk = 0; #(STEP/2);
end


wire[7:0] dat;
wire[7:0] out_use;
wire[7:0] bd;
REG1B8SZ xreg(clk, reset, inst, idx, in0, out0);

initial begin
	$dumpfile("reg_test.vcd");
	$dumpvars(1, REGTEST);
	#STEP	reset = 1'b1;
	#STEP	reset = 1'b0;
	#STEP	inst = 2'b00; in0 = 1'b1; idx = 3'b000;
	#STEP	inst = 2'b00; in0 = 1'b0; idx = 3'b000;
	#STEP	inst = 2'b00; in0 = 1'b1; idx = 3'b100;
	#STEP	inst = 2'b01; in0 = 1'b0; idx = 3'b111;
	#STEP	inst = 2'b01; in0 = 1'b0; idx = 3'b011;
	#STEP	inst = 2'b01; in0 = 1'b1; idx = 3'b100;

	#STEP	inst = 2'b00; in0 = 1'b1; idx = 3'b101;
	#STEP	inst = 2'b00; in0 = 1'b1; idx = 3'b110;
	#STEP	inst = 2'b00; in0 = 1'b1; idx = 3'b000;
	#STEP	inst = 2'b01; in0 = 1'b0; idx = 3'b011;
	#STEP	inst = 2'b01; in0 = 1'b1; idx = 3'b111;
	#STEP	$finish;	
end

endmodule
