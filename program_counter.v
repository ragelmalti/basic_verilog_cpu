module program_counter(step, rst, address_out);
	input step, rst;
	output reg [7:0] address_out;

	always @(posedge step, rst) begin
		if(rst == 1'b1)
			address_out <= 8'b00000000;
		else if(step == 1'b1)
			address_out <= address_out + 1;
	end

endmodule
