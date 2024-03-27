module ALU(clk,A,B,instr,result);

    input [15:0] A;
    input clk;
    input [15:0] B;
    input [8:0] instr;
    output reg [15:0] result;

    always @(clk)
    begin
        case(instr[8:6])
            3'b010: result = A + B;
            3'b011: result = A ^ B;
            default: result = 16'b0;
        endcase
    end
endmodule
