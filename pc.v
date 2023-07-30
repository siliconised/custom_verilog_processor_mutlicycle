`timescale 1ns / 1ps

// 1. programme counter module to pass new programme counter to the IRAM

module p_c(clk,rst,ppc,npc);
input clk,rst;
input [31:0] ppc;
output reg [31:0] npc;

always @(posedge clk) begin
        if(rst)
            npc = 0;
        else
            npc = ppc;
end
endmodule