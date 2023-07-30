`timescale 1ns / 1ps

module MW(clk,rst,i_ctrl_mux_ex,i_aluout_ex,i_b_ex,complete,vga_addr,vga_out);
input clk,rst;
input [2:0]  i_ctrl_mux_ex;
input [31:0] i_aluout_ex,i_b_ex;
input complete;
input [15:0] vga_addr;
output reg [7:0] vga_out;


reg WE;
reg write;
reg [7:0]in_data;
reg [7:0] inp_dat;
wire [7:0]out_data;
reg [15:0] addr;

always @(*) begin
      if(complete == 1) begin
            write = 0; 
            addr = vga_addr;
            vga_out = out_data;
      end
      else begin
           if(i_ctrl_mux_ex[2:1] == 1) begin;
            write = 1;
            addr = i_aluout_ex[15:0];
            inp_dat = in_data; 
            end
            else begin
                write = 0;
                addr = i_aluout_ex[15:0];
                inp_dat = in_data;
            end
      end
end

bram
#(
	.RAM_WIDTH 		(8 				),
	.RAM_ADDR_BITS 	(16 			),
	.INIT_START_ADDR(0				),
	.INIT_END_ADDR	(65535			)
)
bram_inst
(
	.clock			(clk			),
	.ram_enable		(1       		),
	.write_enable	(write 			),
	.address    	(addr        	),
	.input_data		(inp_dat     	),
	.output_data    (out_data   	)
);

always @(*) begin
      if(i_ctrl_mux_ex[2:1] == 1) begin
          if(i_b_ex[31] == 1)
              in_data = 8'b00000000;
          else if(i_b_ex >= 255)
              in_data = 8'b11111111;
          else 
              in_data = i_b_ex[7:0];
       end
end
endmodule
