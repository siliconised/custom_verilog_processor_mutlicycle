module ME(clk,rst,i_ctrl_mux_ex,i_aluout_ex,i_b_ex,i_rd_ex,complete,o_rd_ctrl,o_en,o_mem_data,o_aluout_mem,o_rd_mem);
input clk,rst;
input [2:0]  i_ctrl_mux_ex;
input [31:0] i_aluout_ex,i_b_ex;
input [4:0]  i_rd_ex;
input complete;
output reg o_rd_ctrl,o_en;
output reg [31:0] o_mem_data,o_aluout_mem;
output reg [4:0] o_rd_mem;

reg [31:0]mem_data;

(* RAM_STYLE="BLOCK" *)
reg [7:0] memory [66563:0]; 

initial
      $readmemb("peppers.mem", memory);

always @(*) begin
       if(i_ctrl_mux_ex[2:1] == 2) begin
             mem_data = {24'b0,memory[i_aluout_ex]};
       end
      
end

always @(posedge clk) begin
       if(rst == 0) begin
             //             mem->reg,           en,       data_mem , aluout,  rd;
             o_rd_ctrl = i_ctrl_mux_ex[2];
             o_en      = i_ctrl_mux_ex[0];
             o_mem_data = mem_data;
             o_aluout_mem = i_aluout_ex;
             o_rd_mem = i_rd_ex;
       end
end


endmodule