module cpu(start, rst, instruction, data_var, clk, done, reg0_tri, reg1_tri, reg2_tri, reg3_tri, state);
	//TODO
	//ADD A FREAKING ALU!!!!!11!1!11!!11!!!!111
	input start;
	input rst;
	input [8:0] instruction;
	input [15:0] data_var;
	input clk;
	output done;
	output [15:0] reg0_tri, reg1_tri, reg2_tri, reg3_tri;
	output [3:0] state;

	wire [15:0] bus;

	wire [15:0] reg4_tri, reg5_tri, reg6_tri, reg7_tri, regG_tri;
	wire [7:0] in_reg, out_reg;
	wire [15:0] regA_output;
	wire [15:0] result;
	wire data, Ain, Gin, Gout;



	// THE BRAINS OF THE OPERATION
	control_circuit control(.start(start), .rst(rst), .instruction(instruction), .in_reg(in_reg), .out_reg(out_reg), .data(data), .Ain(Ain), .Gin(Gin), .Gout(Gout), .done(done), .clk(clk), .curr_state(state)); 

	// 8 BIT CPU REGISTERS
	sixteen_bit_register reg0 (.D(bus), .enable(in_reg[0]), .clk(clk), .rst(rst), .Q(reg0_tri));
	tri_buf buf0(.a(reg0_tri), .b(bus), .enable(out_reg[0]));

	sixteen_bit_register reg1 (.D(bus), .enable(in_reg[1]), .clk(clk), .rst(rst), .Q(reg1_tri));
	tri_buf buf1(.a(reg1_tri), .b(bus), .enable(out_reg[1]));

	sixteen_bit_register reg2 (.D(bus), .enable(in_reg[2]), .clk(clk), .rst(rst), .Q(reg2_tri));
	tri_buf buf2(.a(reg2_tri), .b(bus), .enable(out_reg[2]));

	sixteen_bit_register reg3 (.D(bus), .enable(in_reg[3]), .clk(clk), .rst(rst), .Q(reg3_tri));
	tri_buf buf3(.a(reg3_tri), .b(bus), .enable(out_reg[3]));

	sixteen_bit_register reg4 (.D(bus), .enable(in_reg[4]), .clk(clk), .rst(rst), .Q(reg4_tri));
	tri_buf buf4(.a(reg4_tri), .b(bus), .enable(out_reg[4]));

	sixteen_bit_register reg5 (.D(bus), .enable(in_reg[5]), .clk(clk), .rst(rst), .Q(reg5_tri));
	tri_buf buf5(.a(reg5_tri), .b(bus), .enable(out_reg[5]));

	sixteen_bit_register reg6 (.D(bus), .enable(in_reg[6]), .clk(clk), .rst(rst), .Q(reg6_tri));
	tri_buf buf6(.a(reg6_tri), .b(bus), .enable(out_reg[6]));

	sixteen_bit_register reg7 (.D(bus), .enable(in_reg[7]), .clk(clk), .rst(rst), .Q(reg7_tri));
	tri_buf buf7(.a(reg7_tri), .b(bus), .enable(out_reg[7]));

	// ADDITIONAL REGISTERS
	sixteen_bit_register regA (.D(bus), .clk(clk), .enable(Ain), .rst(rst), .Q(regA_output));

	ALU calculator(.clk(clk), .A(regA_output), .B(bus), .instr(instruction), .result(result));

	sixteen_bit_register regG (.D(result), .clk(clk), .enable(Gin), .rst(rst), .Q(regG_tri));
	tri_buf bufG(.a(regG_tri), .b(bus), .enable(Gout));
	tri_buf bufData(.a(data_var), .b(bus), .enable(data));


endmodule
