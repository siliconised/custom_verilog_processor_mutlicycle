`timescale 1ns / 1ps

module if_mux(c_sig,inc_pc,jump_addr,pc);
input c_sig;
input [31:0] inc_pc;
input [31:0] jump_addr;
output reg [31:0] pc;

always @(*) begin
       case(c_sig)
             0 : pc = inc_pc;
             1 : pc = jump_addr;
             default : pc = inc_pc;
       endcase
end
endmodule
