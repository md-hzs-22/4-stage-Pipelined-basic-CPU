`include "define.v"

module IF_ID_stage(clk,rst,inst,out);

input clk,rst;
input [`ISIZE-1:0] inst;
output reg [`ISIZE -1:0] out;

always@(posedge clk)

begin
	if(rst)
		begin
			out <= 0;
		end
	else
		begin
			 out<=inst;
		end
end

endmodule
