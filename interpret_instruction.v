module interpret_instruction(instruction, instruction_code, rx, ry);
	input [8:0] instruction;
	output reg [2:0] instruction_code;
	output reg [2:0] rx, ry;

	// Define instructions
	parameter LOAD = 3'b000;
	parameter MOVE = 3'b001;
	parameter ADD = 3'b010;
	parameter XOR = 3'b011;
	parameter TERM = 3'b100;
	

	always @ (instruction) begin
		instruction_code = instruction[8:6];
		case (instruction[8:6])
			LOAD: begin rx = instruction[5:3]; ry = 3'b000; end // Load state
			MOVE: begin rx = instruction[5:3]; ry = instruction[2:0]; end // Move state
			ADD: begin rx = instruction[5:3]; ry = instruction[2:0]; end // Add state
			XOR: begin rx = instruction[5:3]; ry = instruction[2:0]; end // XOR state
			TERM: begin rx = 3'b000; ry = 3'b000; end // XOR state
		endcase
	end

endmodule
