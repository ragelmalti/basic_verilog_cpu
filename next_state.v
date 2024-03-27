module next_state(instruction_code, state, next_state);
	input [2:0] instruction_code;
	input [3:0] state;
	output reg [3:0] next_state;
	
	// Define the states
	parameter START = 4'b0000;
	parameter LOAD = 4'b0001;
	parameter MOVE = 4'b0010;
	parameter ALU = 4'b0011;
	parameter ALU2 = 4'b0100;
	parameter ALU3 = 4'b0101;
	parameter TERM = 4'b0110;
	parameter DONE = 4'b1111;

	// Define instructions
	parameter ins_LOAD = 3'b000;
	parameter ins_MOVE = 3'b001;
	parameter ins_ADD = 3'b010;
	parameter ins_XOR = 3'b011;
	parameter ins_TERM = 3'b100;

	always @ (state) begin
		case(state)
			START: begin
				if (instruction_code == ins_LOAD) begin
					next_state <= LOAD;
				end
				else if (instruction_code == ins_MOVE) begin
					next_state <= MOVE;
				end
				else if (instruction_code == ins_ADD) begin
					next_state <= ALU;
				end
				else if (instruction_code == ins_XOR) begin
					next_state <= ALU;
				end
				else if (instruction_code == ins_XOR) begin
					next_state <= START; // ADD PROPER STATE LATER!!!
				end
				else if (instruction_code == ins_TERM) begin
					next_state <= TERM;
				end
			end
			DONE: begin
				next_state <= START;
			end

			LOAD: begin
				next_state <= DONE;
			end

			MOVE: begin
				next_state <= DONE;
			end

			ALU: begin
				next_state <= ALU2;
			end

			ALU2: begin
				next_state <= ALU3;
			end

			ALU3: begin
				next_state <= DONE;
			end
			TERM: begin
				next_state <= TERM;
			end
		endcase 
	end
endmodule
