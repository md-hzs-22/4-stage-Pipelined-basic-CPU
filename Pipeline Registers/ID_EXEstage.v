`include "define.v"

module ID_EXEstage (
    clk,   
    rst,
    aluop_cntrl, 
    alusrc_cntrl,
    rdata1,
    rdata2, 
    sign_extend,
    waddr_out, 
    aluop_cntrl_out, 
    alusrc_cntrl_out, 
    rdata1_out, 
    rdata2_out, 
    sign_extend_out,
    waddr_out2
);
	
	input  clk,  rst;
	input [2:0] aluop_cntrl;
    input alusrc_cntrl;
    input [`DSIZE-1:0] rdata1;
	input [`DSIZE-1:0] rdata2;
	input [`DSIZE-1:0] sign_extend;
    input [`ASIZE-1:0] waddr_out;
    
    output reg [2:0] aluop_cntrl_out; 
    output reg alusrc_cntrl_out; 
    output reg[`DSIZE-1:0] rdata1_out; 
    output reg[`DSIZE-1:0] rdata2_out; 
    output reg[`DSIZE-1:0] sign_extend_out;
    output reg[`ASIZE-1:0] waddr_out2;

//Here we need not take write enable (wen) as it is always 1 for R and I type instructions.
//ID_EXE register to save the values.
always@(posedge clk)

begin
	if(rst)
		begin
			aluop_cntrl_out <= 0; 
            alusrc_cntrl_out <= 0; 
            rdata1_out <= 0; 
            rdata2_out <= 0; 
            sign_extend_out <= 0;
            waddr_out2 <= 0;
		end
	else
		begin
			aluop_cntrl_out <= aluop_cntrl; 
            alusrc_cntrl_out <= alusrc_cntrl; 
            rdata1_out <= rdata1; 
            rdata2_out <= rdata2; 
            sign_extend_out <= sign_extend;
            waddr_out2 <= waddr_out;
	   end

end
endmodule

