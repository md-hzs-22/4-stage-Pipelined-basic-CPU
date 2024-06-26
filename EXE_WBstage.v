`include "define.v"

module EXE_WBstage (
    clk,   
    rst,
    aluout_in,
    waddr_out_in,
    aluout_out,
    waddr_out_out
);
	
	input  clk,  rst;
	input [`DSIZE-1:0] aluout_in;
	input [`ASIZE-1:0] waddr_out_in;
	output reg [`DSIZE-1:0] aluout_out;
	output reg [`ASIZE-1:0] waddr_out_out;

//Here we need not take write enable (wen) as it is always 1 for R and I type instructions.
//ID_EXE register to save the values.
always@(posedge clk)

begin
	if(rst)
		begin
			aluout_out <= 0;
			waddr_out_out <= 0;
		end
	else
		begin
			aluout_out <= aluout_in;
			waddr_out_out <= waddr_out_in;
	   end

end
endmodule


