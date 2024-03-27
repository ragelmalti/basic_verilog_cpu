module instantiate_cpu(SW, LEDR);
	input[9:0] SW;
	input [3:0] KEY;
	output[9:0] LEDR;
	output[6:0] HEX0, HEX1, HEX2, HEX3;
	wire done;
	wire [15:0] reg0, reg1, reg2, reg3;
       	wire [8:0] instruction, A;
	wire [15:0] data_var, B;

	cpu cpu_lol(.start(SW[1]), .rst(SW[0]), .instruction(A), .data_var(B), .clk(KEY[0]), .done(done), .reg0_tri(reg0), .reg1_tri(reg1), .reg2_tri(reg2), .reg3_tri(reg3), .state(LEDR[3:0]));
	hex_to_7seg display1(.binary(reg0[3:0]), .sevenSeg(HEX0));
	hex_to_7seg display2(.binary(reg1[3:0]), .sevenSeg(HEX1));
	hex_to_7seg display3(.binary(reg2[3:0]), .sevenSeg(HEX2));
	hex_to_7seg display4(.binary(reg3[3:0]), .sevenSeg(HEX3));
	ROM_p3 program3(.step(done), .instruction(A), .data_var(B));
endmodule
