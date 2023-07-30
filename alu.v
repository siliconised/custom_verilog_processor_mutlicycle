`timescale 1ns / 1ps

module alu(rst,func,shiftamt,a,b,o_data);
input rst;
input [5:0] func;
input [4:0] shiftamt;
input [31:0] a,b;
output reg [31:0] o_data;

always @(*) begin
        if(rst) begin
              o_data = 0;
        end
        else begin
              case(func)
                   0 : begin
                        if(a[31] == b[31]) begin
                             o_data =   a[30:0] + b[30:0];
                             o_data[31] = a[31];   
                        end  
                       else begin
                            if(a[30:0] > b[30:0]) begin
                                  o_data[30:0] =   a[30:0] - b[30:0];
                                  o_data[31] =     a[31];  
                            end 
                       else begin
                                  o_data[30:0] =   b[30:0] - a[30:0];
                                  o_data[31] = b[31];
                       end   
                  end
                   end
                   1 : o_data = a - b;
                   2 : o_data = a / b;
                   3 : begin
                         o_data[31]  = a[31]^b[31];
                         o_data[30:0]= a[30:0] * b[30:0];  
                   end
                   4 : o_data = b >> shiftamt;
                   5 : o_data = b << shiftamt;
                   6 : o_data = a >> shiftamt;
                   7 : o_data = a << shiftamt;
              endcase
        end
end
endmodule
