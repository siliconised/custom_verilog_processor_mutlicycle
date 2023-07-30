`timescale 1ns / 1ps

module branch_npc_add(in_1,in_2,out);
input [31:0] in_1,in_2;
output reg [31:0] out;

always @(*) begin
     if(in_1[31] == in_2[31]) begin
           out =   in_1[30:0] + in_2[30:0];
           out[31] = in_1[31];   
     end
     else begin
          if(in_1[30:0] > in_2[30:0]) begin
                out[30:0] =   in_1[30:0] - in_2[30:0];
                out[31] = in_1[31];  
          end 
          else begin
                out[30:0] =   in_2[30:0] - in_1[30:0];
                out[31] = in_2[31];
          end   
     end
end
endmodule
