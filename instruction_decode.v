`timescale 1ns / 1ps

module ID(clk,rst,i_rd,wb,i_pc,i_instr,o_ctrl_alu,o_bse,o_funct,o_shift_amt,o_a,o_b,o_se,o_rd,o_ctrl_mux,new_pc,pc_ctrl_sig);
input clk,rst;
input [4:0]  i_rd;
input [31:0] wb;
input [31:0] i_pc,i_instr;
output reg [2:0] o_ctrl_alu;
output reg o_bse;
output reg [5:0] o_funct;
output reg [4:0] o_shift_amt;
output reg [31:0] o_a,o_b,o_se;
output reg [4:0] o_rd;
output reg [2:0] o_ctrl_mux;
output [31:0] new_pc;
output pc_ctrl_sig;

wire [10:0] c_sig;
wire [31:0] a,b,se,npc_se,npc_branch;
wire [4:0] rd;
//                              {pc,rd,b,j,bse,a2_a1_a0,rd,wr,en}
control_unit      cu(i_instr[31:26],c_sig);
regbank           reg_bank(rst,i_instr[25:21],i_instr[20:16],i_rd,wb,a,b,comp_sig);
sign_extend       sig_ext(i_instr[15:0],se);

assign rd = c_sig[9] ?  i_instr[20:16] : i_instr[15:11];
branch_npc_add bna({i_instr[15],{14{1'b0}},i_instr[14:0],2'b00},i_pc[31:0],npc_se);
assign npc_branch = (c_sig[8]&comp_sig) ? npc_se : i_pc[31:0];
assign new_pc = c_sig[7] ? {i_pc[31:28],i_instr[25:0],2'b00} : npc_branch;
assign pc_ctrl_sig = c_sig[10];

 // a2_a1_a0, bse, funct,shiftamt,a,b,se,rd, mem->reg, reg->mem, en;
always @(posedge clk) begin
    if(rst == 0) begin
    o_ctrl_alu = c_sig[5:3];
    o_bse = c_sig[6];
    o_funct = i_instr[5:0];
    o_shift_amt = i_instr[10:6];
    o_a = a;
    o_b = b;
    o_se = se;
    o_rd = rd;
    o_ctrl_mux = {c_sig[2],c_sig[1],c_sig[0]};
    end
end
endmodule
