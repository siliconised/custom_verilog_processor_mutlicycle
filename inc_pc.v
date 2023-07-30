`timescale 1ns / 1ps

//3. increment programme counter by 4

module inc_pc(ppc,npc);
input  [31:0] ppc;
output [31:0] npc;

assign npc = ppc + 4;
endmodule
