module bram
	#(
		parameter RAM_WIDTH 		= 32,
		parameter RAM_ADDR_BITS 	= 9,
		parameter INIT_START_ADDR 	= 0,
		parameter INIT_END_ADDR		= 10
	)
	(
	input							clock,
	input							ram_enable,
	input							write_enable,
    input 		[15:0]	            address,
    input 		[RAM_WIDTH-1:0] 	input_data,
	output reg 	[RAM_WIDTH-1:0] 	output_data
	);
	
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] ram_name [(2**RAM_ADDR_BITS)-1:0];


   always @(posedge clock)
      if (ram_enable) begin
         if (write_enable)
            ram_name[address] <= input_data;
         output_data <= ram_name[address];
      end
 
 reg [15:0] index;
integer f;

always@(posedge clock)
        begin
          if ( ram_name[65535]  == 0 )
          begin
              index <= index+1;
              $fwrite(f,"%b\n",ram_name[index] ); //NOT DRAM < DMEM
              
          end
          if(index == 65535)
              begin
                $fclose(f);
                $finish;
              end
        end

initial begin
      f = $fopen("output.txt","wb");
      index = 0; 
end
   
endmodule
						