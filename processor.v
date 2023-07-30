`timescale 1ns / 1ps

module processor(clk,rst,ld,filter,o_hsync,o_vsync,o_red,o_green,o_blue,o_complete);
input clk,rst,ld;
input [2:0] filter;
output reg o_hsync,o_vsync;
output reg [3:0] o_red,o_green,o_blue;
output o_complete;

reg [15:0] k1,k2,k3,k4,k5,k6,k7,k8,k9;

wire pc_ctrl_sig;
wire [31:0] new_pc,o_pc,o_instr;
wire [36:0] WB_DATA;

wire [2:0] o_ctrl_alu;
wire o_bse,o_rd_ctrl,o_en;
wire [5:0] o_funct;
wire [4:0] o_shift_amt;
wire [31:0] o_a,o_b,o_b_ex,o_se,o_aluout_ex,o_mem_data,o_aluout_mem;
wire [4:0] o_rd,o_rd_ex,o_rd_mem;
wire [2:0] o_ctrl_mux,o_ctrl_mux_ex;
wire complete;

assign o_complete = complete;

wire hsync,vsync;
wire [3:0] red,green,blue;
wire [15:0]addr;

always @(*) begin
       if(ld == 1) begin
             if(filter == 1) begin
                     k1 = 16'b1000000000000010;
                     k2 = 16'b1000000000000001;
                     k3 = 16'b0000000000000000;
                     k4 = 16'b1000000000000001;
                     k5 = 16'b0000000000000001;
                     k6 = 16'b0000000000000001;
                     k7 = 16'b0000000000000000;
                     k8 = 16'b0000000000000001;
                     k9 = 16'b0000000000000010;
             end
       end
end

always @(*) begin
      o_hsync = hsync;
      o_vsync = vsync;
      o_red = red;
      o_green = green;
      o_blue = blue;
end

wire [15:0] vga_addr;
wire [7:0] vga_out;

assign vga_12 = vga_out;

IF    instruction_fetch(clk,rst,ld,k1,k2,k3,k4,k5,k6,k7,k8,k9,new_pc,pc_ctrl_sig,o_pc,o_instr,complete);
ID    instruction_decode(clk,rst,WB_DATA[36:32],WB_DATA[31:0],o_pc,o_instr,o_ctrl_alu,o_bse,o_funct,o_shift_amt,o_a,o_b,o_se,o_rd,o_ctrl_mux,new_pc,pc_ctrl_sig);
//            clk,rst,i_c_sig,i_ctrl_alu,i_bse,i_funct,i_shift_amt,i_a,i_b,i_se,i_rd,i_ctrl_mux,o_ctrl_mux,o_aluout,o_b,  o_rd
EX    execute(clk,rst,o_ctrl_alu,o_bse,o_funct,o_shift_amt,o_a,o_b,o_se,o_rd,o_ctrl_mux,o_ctrl_mux_ex,o_aluout_ex,o_b_ex,o_rd_ex);
ME    memory (clk,rst,o_ctrl_mux_ex,o_aluout_ex,o_b_ex,o_rd_ex,complete,o_rd_ctrl,o_en,o_mem_data,o_aluout_mem,o_rd_mem);
MW    mem_write(clk,rst,o_ctrl_mux_ex,o_aluout_ex,o_b_ex,complete,vga_addr,vga_out);
vga   VGA(clk,~complete,red,green,blue,hsync,vsync,vga_addr,vga_out);
WB    wirte_back(clk,rst,o_rd_ctrl,o_en,o_mem_data,o_aluout_mem,o_rd_mem,WB_DATA);
endmodule






