`timescale 1ns / 1ps

module control_unit(opcode,c_sig);
input [5:0] opcode;
output reg [10:0]c_sig;

// {pc,rd,b,j,bse,a2,a1,a0,rd,wr,en}
always @(opcode) begin
       case(opcode)
           1 : c_sig = 11'b0_0_0_0_0_000_0_0_1; // r-type
           2 : c_sig = 11'b0_1_0_0_1_001_0_0_1; // addi
           3 : c_sig = 11'b0_1_0_0_1_010_0_0_1; // muli
           4 : c_sig = 11'b0_1_0_0_1_011_0_0_1; // subi
           5 : c_sig = 11'b1_0_1_0_0_111_0_0_0; // beq
           6 : c_sig = 11'b1_0_0_1_0_111_0_0_0; // jump
           7 : c_sig = 11'b0_1_0_0_1_001_0_1_0; // store (reg -> mem)
           8 : c_sig = 11'b0_1_0_0_1_001_1_0_1; // load  (mem -> reg)
           9 : c_sig = 11'b0_0_0_0_0_111_0_0_0; // NOOP
       endcase
end
endmodule
