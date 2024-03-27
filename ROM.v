module ROM(step, instruction, data_var);
	input step, clk;
	output reg [15:0] data_var;
	output reg [8:0] instruction;

	reg [7:0] read_address; // In total, the ROM can store 256 instructions.

	initial begin
		read_address = 8'b00000000;
	end

	always @ (posedge step) begin
		read_address = read_address + 1;
	end

	always @ (read_address) begin
		case(read_address)
			// Insert instructions here
			default: begin instruction = 9'b100000000; data_var = 16'b0000000000000000; end
		endcase
	end
endmodule
