module nine_bit_register(D, enable, clk, rst, Q);
	input [8:0] D;
	input enable, clk, rst;
	output reg[8:0] Q;

	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1)
			Q <= 9'b000000000;
		else if(enable)
			Q <= D;
	end
endmodule
