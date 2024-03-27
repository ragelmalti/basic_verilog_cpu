module sixteen_bit_register(D, enable, clk, rst, Q);
	input [15:0] D;
	input enable, clk, rst;
	output reg[15:0] Q;

	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1)
			Q <= 16'b0000000000000000;
		else if(enable)
			Q <= D;
	end
endmodule
