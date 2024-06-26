`timescale 1ns / 1ps
`include "define.v"

module pipelined_4stage(
        clk,
        rst,
        aluout
);

input clk;												
input rst;
output [`DSIZE-1:0] aluout;	
wire [`ISIZE-1:0] addr; 
wire [`ISIZE-1:0] inst_in;
wire [`ISIZE-1:0] inst_out;

    PC1 PCO(
        .clk(clk),
        .rst(rst),
        .nextPC(addr),
        .currPC(addr)
    );
    
    datapath_mux DTM(
        .clk(clk),
        .rst(rst),
        .inst(inst_out),
        .aluout(aluout)
    );
    
    IF_ID_stage IFO(
        .clk(clk),
        .rst(rst),
        .inst(inst_in),
        .out(inst_out)
    );
    
    memory MO(
        .clk(clk),
        .rst(rst),
        .addr(addr), 
        .fileid(0),
        .data_out(inst_in)
    );
    
endmodule


