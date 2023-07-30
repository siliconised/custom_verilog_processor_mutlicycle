`timescale 1ns / 1ps

module register_28(rst,rs,rt,rd,i_data,out_data_a,out_data_b);
input rst;
input [4:0]rs,rt,rd;
input [31:0] i_data;
output reg [31:0] out_data_a;
output reg [31:0] out_data_b;

reg [4:0]  reg_num;
reg [31:0] reg_data;

always @(*) begin
      if(rst) begin
            reg_num = 28;
      end
      else begin
          if(reg_num == rs)
               out_data_a <= reg_data;
          if(reg_num == rt)
               out_data_b <= reg_data;
          if(reg_num == rd)    
               reg_data <= i_data;
      end
      
end
endmodule
