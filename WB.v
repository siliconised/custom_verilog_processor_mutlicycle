`timescale 1ns / 1ps

module WB(clk,rst,i_rd_ctrl,i_en,i_mem_data,i_aluout_mem,i_rd_mem,WB_DATA);
input clk,rst;
input i_rd_ctrl,i_en;
input [31:0] i_mem_data,i_aluout_mem;
input [4:0] i_rd_mem;
output reg [36:0] WB_DATA;

reg [31:0] data;
always @(*) begin
       data = i_rd_ctrl ? i_mem_data : i_aluout_mem;
end

always @(*) begin
        if(rst == 0 & i_en == 1) begin
               WB_DATA = {i_rd_mem,data};
        end
end
endmodule
