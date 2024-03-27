module three_bit_2to1muxV2 (sel,a,b,chosen);
 
	input sel;
	input[2:0] a, b;
	output reg[2:0] chosen;
	
	always @(a,b,sel) begin
		if (sel == 1'b1)
			chosen = b;
		else
			chosen = a;
	end
 
endmodule
