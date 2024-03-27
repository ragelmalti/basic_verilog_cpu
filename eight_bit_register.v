module eight_bit_register(D, enable, clk, rst, Q);
	input [7:0] D;
	input enable, clk, rst;
	output reg[7:0] Q;

	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1)
			Q <= 8'b00000000;
		else if(enable)
			Q <= D;
	end
endmodule
