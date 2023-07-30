`timescale 1ns / 1ps

module tb();
reg clk,rst,ld;
reg [2:0] filter;
wire o_hsync,o_vsync;
wire [3:0] o_red,o_green,o_blue;
wire o_complete;

processor uut(clk,rst,ld,filter,o_hsync,o_vsync,o_red,o_green,o_blue,o_complete);

initial
   clk <= 1'b0;

always 
     #5 clk <= ~clk;

initial begin
     #100   ld = 1'b1;
           rst = 1'b1;
           filter = 1;
     #10 ld = 1'b0;rst = 1'b0;
     #10 $stop;
end
endmodule
