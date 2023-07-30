`timescale 1ns / 1ps

module EX(clk,rst,i_c_sig,i_bse,i_funct,i_shift_amt,i_a,i_b,i_se,i_rd,i_ctrl_mux,o_ctrl_mux,o_aluout,o_b,o_rd);
input clk,rst;
input [2:0] i_c_sig;
input i_bse;
input [5:0] i_funct;
input [4:0] i_shift_amt;
input [31:0] i_a,i_b,i_se;
input [4:0] i_rd;
input [2:0] i_ctrl_mux;

output reg [2:0]  o_ctrl_mux;
output reg [31:0] o_aluout,o_b;
output reg [4:0]  o_rd;

//  a2_a1_a0, bse, funct,shiftamt,a,b,se,rd,mem->reg, reg->mem, en;
//  {pc,rd,b,j,bse,a2,a1,a0,rd,wr,en}
wire [5:0] func;
wire [4:0] shift_amt;
wire [31:0] b_se,aluout;
ctrl_alu control_alu(i_c_sig,i_funct,i_shift_amt,func,shift_amt);
alu      ALU(rst,func,shift_amt,i_a,b_se,aluout);

assign b_se = i_bse ? i_se : i_b;

always @(posedge clk) begin
      if(rst == 0) begin
            o_ctrl_mux = i_ctrl_mux;
            o_aluout   = aluout;
            o_b        = i_b;
            o_rd       = i_rd;
      end
end

endmodule
