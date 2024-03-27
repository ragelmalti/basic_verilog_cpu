module tri_buf (a,b,enable);
	input [15:0] a;
	input enable;
	output reg [15:0] b;
	
	always @ (enable or a) begin
		if (enable) begin
			b = a;
		end
		else begin
			b = 16'bz;
		end
	end
endmodule
	
