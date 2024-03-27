module ROM_p3(step, instruction, data_var);
	//input [7:0] read_address; // In total, the ROM can store 256 instructions.
	input step, clk;
	output reg [15:0] data_var;
	output reg [8:0] instruction;

	reg [7:0] read_address;

	initial begin
		read_address = 8'b00000000;
	end

	always @ (posedge step) begin
		read_address = read_address + 1;
	end

	always @ (read_address) begin
		case(read_address)
			// load r0, 1
			8'b00000000: begin instruction = 9'b000000000; data_var = 16'b0000000000000001; end 

			// load r1, 2
			8'b00000001: begin instruction = 9'b000001000; data_var = 16'b0000000000000010; end

			// load r2, 3
			8'b00000010: begin instruction = 9'b000010000; data_var = 16'b0000000000000011; end

			// load r3, 4
			8'b00000011: begin instruction = 9'b000011000; data_var = 16'b0000000000000100; end

			// load r0, 5 
			8'b00000100: begin instruction = 9'b000000000; data_var = 16'b0000000000000101; end

			// xor r1, r3 
			8'b00000101: begin instruction = 9'b011001011; data_var = 16'b0000000000000000; end

			// mov r2, r1
			8'b00000110: begin instruction = 9'b001010001; data_var = 16'b0000000000000000; end

			// add r2, r1 
			8'b00000111: begin instruction = 9'b010010001; data_var = 16'b0000000000000000; end

			// add r3, r1
			8'b00001000: begin instruction = 9'b010011001; data_var = 16'b0000000000000000; end

			// xor, r0, r3 
			8'b00001001: begin instruction = 9'b011000011; data_var = 16'b0000000000000000; end
			
			// Terminate
			8'b00001001: begin instruction = 9'b100000000; data_var = 16'b0000000000000000; end
			default: begin instruction = 9'b100000000; data_var = 16'b0000000000000000; end
		endcase
	end
endmodule
