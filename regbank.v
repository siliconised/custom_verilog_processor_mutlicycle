`timescale 1ns / 1ps

// 6. this module contains register bank.

module regbank(rst,rs,rt,rd,i_data,a,b,comp_sig);
input rst;
input [4:0] rs,rt,rd;
input [31:0] i_data;
output reg [31:0] a,b;
output reg comp_sig;

wire [31:0] a_00,b_00;
wire [31:0] a_01,b_01;
wire [31:0] a_02,b_02;
wire [31:0] a_03,b_03;
wire [31:0] a_04,b_04;
wire [31:0] a_05,b_05;
wire [31:0] a_06,b_06;
wire [31:0] a_07,b_07;
wire [31:0] a_08,b_08;
wire [31:0] a_09,b_09;
wire [31:0] a_10,b_10;
wire [31:0] a_25,b_25;
wire [31:0] a_26,b_26;
wire [31:0] a_27,b_27;
wire [31:0] a_28,b_28;
wire [31:0] a_29,b_29;
wire [31:0] a_30,b_30;
wire [31:0] a_31,b_31;

reg [31:0] i_data_00;
reg [31:0] i_data_01;
reg [31:0] i_data_02;
reg [31:0] i_data_03;
reg [31:0] i_data_04;
reg [31:0] i_data_05;
reg [31:0] i_data_06;
reg [31:0] i_data_07;
reg [31:0] i_data_08;
reg [31:0] i_data_09;
reg [31:0] i_data_10;
reg [31:0] i_data_25;
reg [31:0] i_data_26;
reg [31:0] i_data_27;
reg [31:0] i_data_28;
reg [31:0] i_data_29;
reg [31:0] i_data_30;
reg [31:0] i_data_31;


register_00 R00(rst,rs,rt,rd,i_data_00,a_00,b_00);
register_01 R01(rst,rs,rt,rd,i_data_01,a_01,b_01);
register_02 R02(rst,rs,rt,rd,i_data_02,a_02,b_02);
register_03 R03(rst,rs,rt,rd,i_data_03,a_03,b_03);
register_04 R04(rst,rs,rt,rd,i_data_04,a_04,b_04);
register_05 R05(rst,rs,rt,rd,i_data_05,a_05,b_05);
register_06 R06(rst,rs,rt,rd,i_data_06,a_06,b_06);
register_07 R07(rst,rs,rt,rd,i_data_07,a_07,b_07);
register_08 R08(rst,rs,rt,rd,i_data_08,a_08,b_08);
register_09 R09(rst,rs,rt,rd,i_data_09,a_09,b_09);
register_10 R10(rst,rs,rt,rd,i_data_10,a_10,b_10);
register_25 R25(rst,rs,rt,rd,i_data_25,a_25,b_25);
register_26 R26(rst,rs,rt,rd,i_data_26,a_26,b_26);
register_27 R27(rst,rs,rt,rd,i_data_27,a_27,b_27);
register_28 R28(rst,rs,rt,rd,i_data_28,a_28,b_28);
register_29 R29(rst,rs,rt,rd,i_data_29,a_29,b_29);
register_30 R30(rst,rs,rt,rd,i_data_30,a_30,b_30);
register_31 R31(rst,rs,rt,rd,i_data_31,a_31,b_31);

always @(*) begin
        if(a == b)
            comp_sig = 1;
        else
            comp_sig = 0;
end

always @(*) begin
        case(rs)
             0 : a = a_00;  
             1 : a = a_01;  
             2 : a = a_02;  
             3 : a = a_03;  
             4 : a = a_04;  
             5 : a = a_05;  
             6 : a = a_06;  
             7 : a = a_07;  
             8 : a = a_08;  
             9 : a = a_09;  
            10 : a = a_10;  
            25 : a = a_25;  
            26 : a = a_26;  
            27 : a = a_27;  
            28 : a = a_28;  
            29 : a = a_29;  
            30 : a = a_30;  
            31 : a = a_31;   
        endcase
        
        case(rt)
             0 : b = b_00;  
             1 : b = b_01;  
             2 : b = b_02;  
             3 : b = b_03;  
             4 : b = b_04;  
             5 : b = b_05;  
             6 : b = b_06;  
             7 : b = b_07;  
             8 : b = b_08;  
             9 : b = b_09;  
            10 : b = b_10;  
            25 : b = b_25;  
            26 : b = b_26;  
            27 : b = b_27;  
            28 : b = b_28;  
            29 : b = b_29;  
            30 : b = b_30;  
            31 : b = b_31;   
        endcase
end

always @(rd or i_data) begin
      case(rd)
             0 : i_data_00 = i_data;  
             1 : i_data_01 = i_data;  
             2 : i_data_02 = i_data;  
             3 : i_data_03 = i_data;  
             4 : i_data_04 = i_data;  
             5 : i_data_05 = i_data;  
             6 : i_data_06 = i_data;  
             7 : i_data_07 = i_data;  
             8 : i_data_08 = i_data;  
             9 : i_data_09 = i_data;  
            10 : i_data_10 = i_data;  
            25 : i_data_25 = i_data;  
            26 : i_data_26 = i_data;  
            27 : i_data_27 = i_data;  
            28 : i_data_28 = i_data;  
            29 : i_data_29 = i_data;  
            30 : i_data_30 = i_data;  
            31 : i_data_31 = i_data;   
        endcase
end


endmodule
