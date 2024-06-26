`include"define.v"
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////////
//// Company: NTU
//// Engineer: Dr. Smitha K G
////////////////////////////////////////////////////////////////////////////////////

module datapath_mux (
	// inputs
	clk,
	rst,
	inst,

	//outputs
	aluout
);

// inputs
input		  clk;
input		  rst;
input  [`ISIZE-1:0] inst;


// outputs
output  [`DSIZE-1:0] aluout;

wire [2:0]	aluop;
wire alusrc;
wire [2:0] aluop_cntrl_out;
wire alusrc_cntrl_out;
wire regDST;
wire wen;
wire [`DSIZE-1:0] aluout2;
wire [`DSIZE-1:0] rdata1;
wire [`DSIZE-1:0] rdata2;
wire [`DSIZE-1:0] rdata1_out;
wire [`DSIZE-1:0] rdata2_out;
wire [`DSIZE-1:0] wdata_out;
wire [`DSIZE-1:0] sign_extend;
wire [`DSIZE-1:0] sign_extend_out;

wire [`ASIZE-1:0] waddr_out2;
wire [`ASIZE-1:0] waddr_out3;

wire [`DSIZE-1:0]rdata2_imm=alusrc_cntrl_out ? sign_extend_out : rdata2_out;//Multiplexer to select the immediate value or rdata2 based on alusrc.
//when alusrc is 1 then connect immediate data to output else connect rdata2 to output

wire [`ASIZE-1:0]waddr_out=regDST ? inst[15:11] : inst[20:16];//Multiplexer to select the inst[15:11] or inst[20:16] as the waddr based on regDST.
//when regDST is 1 then connect inst[15:11] to output else connect inst[20:16] to output

//Here you need to instantiate the control , Alu , regfile and the delay registers. 
//-insert your code here

    control CO(
        .inst_cntrl(inst[31:26]),
        .wen_cntrl(wen),
        .alusrc_cntrl(alusrc),
	    .regdst_cntrl(regDST),
	    .aluop_cntrl(aluop)
    );

    regfile RFO(
	   .clk(clk),
	   .rst(rst),
	   .wen(wen),
	   .raddr1(inst[25:21]),
	   .raddr2(inst[20:16]),
	   .waddr(waddr_out3),
	   .wdata(aluout2),
	   .rdata1(rdata1),
	   .rdata2(rdata2)
    );    
    
    alu ALUO(
	   .a(rdata1_out),
	   .b(rdata2_imm),
	   .op(aluop_cntrl_out),
	   .out(aluout)
    );
    
    sign_extend SO(
        .inst_in(inst[15:0]),
        .extended_inst(sign_extend)
    );
    
    ID_EXEstage IDEXEO(
        .clk(clk), 
        .rst(rst),
        .aluop_cntrl(aluop), 
        .alusrc_cntrl(alusrc),
        .rdata1(rdata1),
        .rdata2(rdata2), 
        .sign_extend(sign_extend),
        .waddr_out(waddr_out), 
        .aluop_cntrl_out(aluop_cntrl_out), 
        .alusrc_cntrl_out(alusrc_cntrl_out), 
        .rdata1_out(rdata1_out), 
        .rdata2_out(rdata2_out), 
        .sign_extend_out(sign_extend_out),
        .waddr_out2(waddr_out2)
    );
    
    EXE_WBstage EXWBO(
        .clk(clk),   
        .rst(rst),
        .aluout_in(aluout),
        .waddr_out_in(waddr_out2),
        .aluout_out(aluout2),
        .waddr_out_out(waddr_out3)
    );

endmodule // end of datapath module

