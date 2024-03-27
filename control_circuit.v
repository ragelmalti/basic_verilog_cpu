module control_circuit(start, rst, instruction, in_reg, out_reg, data, Ain, Gin, Gout, done, clk, curr_state);
	input start;
	input rst;
	input clk;
	input [8:0] instruction;
	output [7:0] in_reg;
	output [7:0] out_reg;
	output reg data;
	output reg Ain;
	output reg Gin;
	output reg Gout;
	output reg done;
	output [3:0] curr_state;

	// Define the states
	parameter START = 4'b0000;
	parameter LOAD = 4'b0001;
	parameter MOVE = 4'b0010;
	parameter ALU = 4'b0011;
	parameter ALU2 = 4'b0100;
	parameter ALU3 = 4'b0101;
	parameter TERM = 4'b0110;
	parameter DONE = 4'b1111;

	wire [2:0] instruction_code;
	wire [2:0] rx;
	wire [2:0] ry;
	wire [2:0] sel_reg_out;
	wire [2:0] sel_reg_in;

	reg sig1;
	reg sig2;
	reg Rout;
	reg Rin;

	//wire[3:0] next_state, curr_state;
	wire[3:0] next_state;



	interpret_instruction opcode(.instruction(instruction), .instruction_code(instruction_code), .rx(rx), .ry(ry));
	three_bit_2to1muxV2 out_mux(.sel(sig1), .a(rx), .b(ry), .chosen(sel_reg_out));
	three_bit_2to1muxV2 in_mux(.sel(sig2), .a(rx), .b(ry), .chosen(sel_reg_in));
	one_hot reg_out (.signal(Rout), .reg_code(sel_reg_out), .out(out_reg));
	one_hot reg_in (.signal(Rin), .reg_code(sel_reg_in), .out(in_reg));


	next_state next(.instruction_code(instruction_code), .state(curr_state), .next_state(next_state));
	four_bit_register state_reg (.D(next_state), .clk(clk), .rst(rst), .Q(curr_state));

	always @ (curr_state) begin
		if (start == 1'b1) begin
			case(curr_state)
				START: begin
					Rin <= 0;
					Rout <= 0;
					data <= 0;
					sig1 <= 0;
					sig2 <= 0;
					Ain <= 0;
					Gin <= 0;
					Gout <= 0;
					done <= 0;
				end
				DONE: begin
					Rin <= 0;
					Rout <= 0;
					data <= 0;
					sig1 <= 0;
					sig2 <= 0;
					Ain <= 0;
					Gin <= 0;
					Gout <= 0;
					done <= 1;
				end

				MOVE: begin
					sig1 <= 1; // Select Ry for out
					sig2 <= 0; // Select Rx for in
					Rout <= 1; // Set RXout to 1
					Rin <= 1; // Set RYin to 1
					done <= 0;
				end

				LOAD: begin
					data <= 1;
					sig2 <= 0; // Select Rx for in
					Rin <= 1; // Set RXin to 1
					done <= 0;
				end

				ALU: begin
					sig1 <= 0; // Select Rx for out
					Rout <= 1; // Set RXout to 1
					Ain <= 1;
				end

				ALU2: begin
					sig1 <= 1; // Select Ry for out
					Ain <= 0;
					Rout <= 1; // Set RYout to 1
					Gin <= 1;
				end

				ALU3: begin
					Gin <= 0;
					Rout <= 0; // Set RYout to 0
					Gout <= 1;
					Rin <= 1;
					done <= 0;
				end
			endcase
		end
	end
endmodule
