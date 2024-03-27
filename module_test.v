`timescale 1ns / 1ps
module module_test;

	//Add inputs/outputs
	reg [3:0] count;
	reg Rout, Reset, Clkin, step;
	reg [2:0] sel_reg_out;
	wire [7:0] out_reg;
       	wire [8:0] instruction;
	wire [15:0] data_var;
	wire done;
	wire [7:0] result;
	wire [7:0] program_count;
	reg [7:0] A, B;
	
	//one_hot reg_out (.signal(Rout), .reg_code(sel_reg_out), .out(out_reg));

	//ALU calculator(.A(A), .B(B), .instr(instruction), .result(result));

	program_counter p_count(.step(step), .rst(Reset), .address_out(program_count));
	ROM_p1 program1(.read_address(program_count), .clk(Clkin), .instruction(instruction), .data_var(data_var));
 	
	initial begin 
		Rout = 1'b1;
		Reset = 1'b1;
		count = 4'b0000;
		sel_reg_out = 3'b000;
	end
	
	always @(posedge Clkin) begin 
		count=count+4'b0001;
		sel_reg_out=sel_reg_out+3'b001;
	end

	always begin
		#50
		Reset = 1'b0;
		#100
		Clkin = 1'b0;
		step = 1'b0;
		#100
		Clkin = 1'b1;
		step = 1'b1;
	end	

	/* 
	always @(count) begin
		case (count)
		4'b0000 : begin instruction=9'b010000000; A = 8'b00000101; B = 8'b00001000; end // Load, r0, 5
		4'b0001 : begin instruction=9'b111000000; A = 8'b00000101; B = 8'b00001001; end // Load, r0, 5
		4'b0010 : begin instruction=9'b010000000; A = 8'b00000101; B = 8'b00001000; end // Load, r0, 5
		4'b0011 : begin instruction=9'b010000000; A = 8'b00000000; B = 8'b00000000; end // Load, r0, 5
	endcase
	end
	*/

	initial begin
		$dumpfile("module_test.vcd");
		$dumpvars(0, module_test);
		#10000
		$finish;
	end

endmodule
