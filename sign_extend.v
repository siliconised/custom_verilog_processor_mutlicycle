`timescale 1ns / 1ps

// 7. this module is used for extending the sign.

module sign_extend(in_1,out);
input [15:0] in_1;
output reg [31:0] out;

//  in[31:0] = in[15] 16'b0 in[14:0];
wire s_bit = in_1[15];
always @(*) begin
       out = {s_bit,{16{1'b0}},in_1[14:0]};
end
endmodule
