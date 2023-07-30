`timescale 1ns / 1ps

module IF(clk,rst,ld,k1,k2,k3,k4,k5,k6,k7,k8,k9,new_pc,pc_ctrl_sig,o_pc,o_instr,comp);
input clk,rst,ld;
input [15:0] k1,k2,k3,k4,k5,k6,k7,k8,k9;
input [31:0] new_pc;
input pc_ctrl_sig;
output reg [31:0] o_pc,o_instr;
output comp;

wire [31:0] ppc,npc,incre_pc;
wire [31:0] instr;
wire complete;

assign comp = complete;

p_c    pc(clk,rst,ppc,npc);
IRAM   iram(clk,rst,ld,k1,k2,k3,k4,k5,k6,k7,k8,k9,npc,instr,complete);
inc_pc increment_pc(npc,incre_pc);
if_mux IF_mucx(pc_ctrl_sig,incre_pc,new_pc,ppc);

always @(posedge clk) begin
      if(rst == 0) begin
          o_pc <= incre_pc;
          o_instr <= instr;
      end
end
endmodule

