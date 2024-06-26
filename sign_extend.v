`include "define.v"

module sign_extend(inst_in,extended_inst);

    input [15:0] inst_in;
    output reg [31:0] extended_inst;

    always @(inst_in)
    begin
        case(inst_in[15])
    
        1: 
            begin
                extended_inst[31:16] <= 0'b1111111111111111;
                extended_inst[15:0] <= inst_in;      
            end
        0: 
            begin
                extended_inst[31:16] <= 0'b0000000000000000;
                extended_inst[15:0] <= inst_in;    
            end
       
        endcase
    end
endmodule