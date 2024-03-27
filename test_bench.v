`timescale 1ns / 1ps
module test_bench;

	//Add inputs/outputs
	reg [3:0] count;
	wire [3:0] curr_state;
	reg start, Reset, Clkin;
	wire [7:0] program_count;
       	wire [8:0] instruction, A;
	wire [15:0] data_var, B;
	wire [15:0] reg0, reg1, reg2, reg3;
	wire done;
	
	//ROM_p1 program1(.step(done), .instruction(A), .data_var(B));
	//ROM_p2 program2(.step(done), .instruction(A), .data_var(B));
	ROM_p3 program3(.step(done), .instruction(A), .data_var(B));
	cpu cpu_lol(.start(start), .rst(Reset), .instruction(A), .data_var(B), .clk(Clkin), .done(done), .reg0_tri(reg0), .reg1_tri(reg1), .reg2_tri(reg2), .reg3_tri(reg3), .state(curr_state));
	//program_counter p_count(.step(done), .rst(Reset), .address_out(program_count));
 	
	initial begin 
		start = 1'b1;
		Reset = 1'b1;
		count = 4'b0000;
	end
	
	always @(posedge done) begin 
		count=count+4'b0001;
	end

	always begin
		#50
		Reset = 1'b0;
		#100
		Clkin = 1'b0;
		#100
		Clkin = 1'b1;
	end	
	/*
	always @(count) begin
		case (count)
		4'b0000 : begin start = 1'b1; instruction = 9'b000000000; data_var = 16'b0000000000000101; end // Load, r0, 5
		4'b0001 : begin start = 1'b1; instruction = 9'b000001000; data_var = 16'b0000000000000100; end // Load, r1, 4
		4'b0010 : begin start = 1'b1; instruction = 9'b010001000; data_var = 16'b0000000000000011; end // add r1, r0
		4'b0011 : begin start = 1'b1; instruction = 9'b001110000; data_var = 16'b0000000000001001; end // move, r6, r0 
		4'b0100 : begin start = 1'b1; instruction = 9'b011110001; data_var = 16'b0000000000001001; end // xor, r6, r1 
		4'b0101 : begin start = 1'b1; instruction = 9'b100000000; data_var = 16'b0000000000001001; end // Terminate
		//default : begin start = 1'b1; instruction = 9'b100000000; data_var = 8'b0; end
	endcase
	end
	*/

	initial begin
		$dumpfile("test_bench.vcd");
		$dumpvars(0, test_bench);
		#10000
		$finish;
	end

endmodule
