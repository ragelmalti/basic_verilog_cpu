module one_hot(signal, reg_code, out);
	input signal;
	input [2:0] reg_code;
	output reg [7:0] out;

	always @(signal, reg_code) begin
		if (signal == 1'b1) begin
			case(reg_code)
				3'b000: begin out = 8'b00000001; end // Reg 0
				3'b001: begin out = 8'b00000010; end // Reg 1
				3'b010: begin out = 8'b00000100; end // Reg 2
				3'b011: begin out = 8'b00001000; end // Reg 3
				3'b100: begin out = 8'b00010000; end // Reg 4
				3'b101: begin out = 8'b00100000; end // Reg 5
				3'b110: begin out = 8'b01000000; end // Reg 6
				3'b111: begin out = 8'b10000000; end // Reg 7
			endcase
		end
		else if (signal == 1'b0)
			out = 8'b00000000;
	end

endmodule
