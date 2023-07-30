`timescale 1ns / 1ps

// 2. contains the instructions , updates the value when pc value changes
module IRAM(clk,rst,ld,k1,k2,k3,k4,k5,k6,k7,k8,k9,pc,instr,complete);
input clk,rst,ld;
input [15:0] k1,k2,k3,k4,k5,k6,k7,k8,k9;
input [31:0] pc;
output reg [31:0] instr;
output reg complete;

reg [15:0] mul_1,mul_2,mul_3,mul_4,mul_5,mul_6,mul_7,mul_8,mul_9;
reg [6:0]counter;
reg flag;
localparam AAD   = 6'b000001,
           AADI  = 6'b000010,
           MULI  = 6'b000011,
           SUBI  = 6'b000100,
           BEQ   = 6'b000101,
           JUMP  = 6'b000110,
           STORE = 6'b000111,
           LOAD  = 6'b001000,
           NOOP  = 6'b001001;

localparam REG_0  = 5'b00000,
           REG_1  = 5'b00001,
           REG_2  = 5'b00010,
           REG_3  = 5'b00011,
           REG_4  = 5'b00100,
           REG_5  = 5'b00101,
           REG_6  = 5'b00110,
           REG_7  = 5'b00111,
           REG_8  = 5'b01000,
           REG_9  = 5'b01001,
           REG_10 = 5'b01010,
           REG_11 = 5'b01011,
           REG_12 = 5'b01100,
           REG_13 = 5'b01101,
           REG_14 = 5'b01110,
           REG_15 = 5'b01111,
           REG_16 = 5'b10000,
           REG_17 = 5'b10001,
           REG_18 = 5'b10010,
           REG_19 = 5'b10011,
           REG_20 = 5'b10100,
           REG_21 = 5'b10101,
           REG_22 = 5'b10110,
           REG_23 = 5'b10111,
           REG_24 = 5'b11000,
           REG_25 = 5'b11001,
           REG_26 = 5'b11010,
           REG_27 = 5'b11011,
           REG_28 = 5'b11100,
           REG_29 = 5'b11101,
           REG_30 = 5'b11110,
           REG_31 = 5'b11111;

always @(posedge clk) begin
     if(rst) begin
             counter = 0;
     end
     else begin
             counter = counter + 1;
     end
end
always @(*) begin
        if(ld == 1) begin
               mul_1 = k1;
               mul_2 = k2;
               mul_3 = k3;
               mul_4 = k4;
               mul_5 = k5;
               mul_6 = k6;
               mul_7 = k7;
               mul_8 = k8;
               mul_9 = k9;
               complete = 0;
               flag = 0;
        end
        else begin
              if(counter == 4 && flag == 0) begin
                     instr = {JUMP , 26'b00_0000_0000_0000_0000_0000_0000}; // make pc 0
                     #10 flag = 1;
              end
              else begin
            case (pc/4)
               //0 : inst=32'b000000_00001_00010_00011_00000_000000;
                0 : instr = {AADI,REG_0,REG_1,16'b0000_0000_0000_0000};     //reg_1 <-  reg_0 + 0;
                1 : instr = {AADI,REG_0,REG_2,16'b0000_0000_0000_0000};     //reg_2 <-  reg_0 + 0;
                2 : instr = {AADI,REG_0,REG_3,16'b0000_0000_0000_0000};     //reg_3 <-  reg_0 + 0;
                3 : instr = {AADI,REG_0,REG_4,16'b0000_0000_0000_0000};     //reg_4 <-  reg_0 + 0;
                4 : instr = {AADI,REG_0,REG_5,16'b0000_0000_0000_0000};     //reg_5 <-  reg_0 + 0;
                5 : instr = {AADI,REG_0,REG_6,16'b0000_0000_0000_0000};     //reg_6 <-  reg_0 + 0;
                6 : instr = {AADI,REG_0,REG_7,16'b0000_0000_0000_0000};     //reg_7 <-  reg_0 + 0;
                7 : instr = {AADI,REG_0,REG_8,16'b0000_0000_0000_0000};     //reg_8 <-  reg_0 + 0;
                8 : instr = {AADI,REG_0,REG_9,16'b0000_0000_0000_0000};     //reg_9 <-  reg_0 + 0;
                9 : instr = {AADI,REG_0,REG_10,16'b0000_0000_0000_0000};     //reg_10 <-  reg_0 + 0;
               10 : instr = {AADI,REG_0,REG_25,16'b0000_0000_0000_0000};     //reg_25 <-  reg_0 + 0;
               11 : instr = {AADI,REG_0,REG_26,16'b0000_0001_0000_0000};     //reg_26 <-  reg_0 + 256;
               12 : instr = {AADI,REG_0,REG_27,16'b0000_0000_0000_0000};     //reg_27 <-  reg_0 + 0;
               13 : instr = {AADI,REG_0,REG_28,16'b0000_0000_0000_0000};     //reg_28 <-  reg_0 + 0;
               14 : instr = {AADI,REG_0,REG_29,16'b0000_0000_0000_0000};     //reg_29 <-  reg_0 + 0;
               15 : instr = {AADI,REG_0,REG_30,16'b0000_0000_0000_0000};     //reg_30 <-  reg_0 + 0;
               16 : instr = {AADI,REG_0,REG_31,16'b0000_0000_0000_0000};     //reg_31 <-  reg_0 + 0;
               17 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // main:noop
               18 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // main:noop
               19 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // main:noop
               20 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // main:noop
               21 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // main:noop
               22 : instr = {MULI,REG_30,REG_29,16'b0000_0001_0000_0010};     // reg_29 <-  reg_30*258;
               23 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               24 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               25 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               26 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               27 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               28 : instr = {AAD ,REG_29,REG_31,REG_29,5'b00000,6'b000000};   //reg_29 <-  reg_29 + reg_31;
               29 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               30 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               31 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               32 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               33 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               34 : instr = {AADI,REG_29,REG_28,16'b0000_0001_0000_0010};     //reg_28 <-  reg_29 + 258;
               35 : instr = {AADI,REG_29,REG_27,16'b0000_0010_0000_0100};     //reg_27 <-  reg_29 + 516;
               36 : instr = {LOAD,REG_29,REG_1,16'b0000_0000_0000_0000};      //reg_1  <-  mem[reg_29 + 0];
               37 : instr = {LOAD,REG_29,REG_2,16'b0000_0000_0000_0001};      //reg_2  <-  mem[reg_29 + 1];
               38 : instr = {LOAD,REG_29,REG_3,16'b0000_0000_0000_0010};      //reg_3  <-  mem[reg_29 + 2]; 
               39 : instr = {LOAD,REG_28,REG_4,16'b0000_0000_0000_0000};      //reg_4  <-  mem[reg_28 + 0];
               40 : instr = {LOAD,REG_28,REG_5,16'b0000_0000_0000_0001};      //reg_5  <-  mem[reg_28 + 1];
               41 : instr = {LOAD,REG_28,REG_6,16'b0000_0000_0000_0010};      //reg_6  <-  mem[reg_28 + 2];
               42 : instr = {LOAD,REG_27,REG_7,16'b0000_0000_0000_0000};      //reg_7  <-  mem[reg_27 + 0];
               43 : instr = {LOAD,REG_27,REG_8,16'b0000_0000_0000_0001};      //reg_8  <-  mem[reg_27 + 1];
               44 : instr = {LOAD,REG_27,REG_9,16'b0000_0000_0000_0010};      //reg_9  <-  mem[reg_27 + 2];
               45 : instr = {MULI,REG_1 ,REG_1,mul_1};                        //reg_1  <-  reg_1 * k1;
               46 : instr = {MULI,REG_2 ,REG_2,mul_2};                        //reg_2  <-  reg_2 * k2;
               47 : instr = {MULI,REG_3 ,REG_3,mul_3};                        //reg_3  <-  reg_3 * k3;
               48 : instr = {MULI,REG_4 ,REG_4,mul_4};                        //reg_4  <-  reg_4 * k4;
               49 : instr = {MULI,REG_5 ,REG_5,mul_5};                        //reg_5  <-  reg_5 * k5;
               50 : instr = {MULI,REG_6 ,REG_6,mul_6};                        //reg_6  <-  reg_6 * k6;
               51 : instr = {MULI,REG_7 ,REG_7,mul_7};                        //reg_7  <-  reg_7 * k7;
               52 : instr = {MULI,REG_8 ,REG_8,mul_8};                        //reg_8  <-  reg_8 * k8;
               53 : instr = {MULI,REG_9 ,REG_9,mul_9};                        //reg_9  <-  reg_9 * k9;
               54 : instr = {AAD ,REG_1 ,REG_2 ,REG_2 ,5'b00000,6'b000000};   //reg_2 <- reg_1 + reg_2;
               55 : instr = {AAD ,REG_3 ,REG_4 ,REG_4 ,5'b00000,6'b000000};   //reg_4 <- reg_3 + reg_4;
               56 : instr = {AAD ,REG_5 ,REG_6 ,REG_6 ,5'b00000,6'b000000};   //reg_6 <- reg_5 + reg_6;
               57 : instr = {AAD ,REG_7 ,REG_8 ,REG_8 ,5'b00000,6'b000000};   //reg_8 <- reg_7 + reg_8;
               58 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               59 : instr = {AAD ,REG_2 ,REG_9 ,REG_2 ,5'b00000,6'b000000};   //reg_2 <- reg_2 + reg_9;
               60 : instr = {AAD ,REG_4 ,REG_6 ,REG_4 ,5'b00000,6'b000000};   //reg_4 <- reg_4 + reg_6;
               61 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               62 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               63 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               64 : instr = {AAD ,REG_2 ,REG_8 ,REG_2 ,5'b00000,6'b000000};   //reg_2 <- reg_2 + reg_8;
               65 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               66 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               67 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               68 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               69 : instr = {AAD ,REG_4 ,REG_2 ,REG_10 ,5'b00000,6'b000000};   //reg_2 <- reg_2 + reg_4;
               70 : instr = {AADI ,REG_31 ,REG_31,16'b0000_0000_0000_0001};   //reg_31 <- reg_31 + 1;
               71 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               72 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               73 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               74 : instr = {STORE,REG_25,REG_10 ,16'b0000_0000_0000_0000};   // mem[reg_25] <- reg_2;
               75 : instr = {AADI ,REG_25 ,REG_25,16'b0000_0000_0000_0001};   //reg_25 <- reg_25 + 1;
               76 : instr = {BEQ  ,REG_31 ,REG_26,16'b0000_0000_0000_0011};   //reg_31 == reg_26;
               77 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               78 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               79 : instr = {JUMP , 26'b00_0000_0000_0000_0000_0001_0101}; // jump to main
               80 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               81 : instr = {AADI ,REG_0 ,REG_31 ,16'b0000_0000_0000_0000};   //reg_31 <- reg_0  + 0;
               82 : instr = {AADI ,REG_30 ,REG_30,16'b0000_0000_0000_0001};   //reg_30 <- reg_30 + 1;
               83 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               84 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               85 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               86 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               87 : instr = {BEQ  ,REG_30 ,REG_26,16'b0000_0000_0000_0011};   // reg_30 == reg_26;
               88 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               89 : instr = {JUMP , 26'b00_0000_0000_0000_0000_0001_0101}; // jump to main
               90 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               91 : instr = {NOOP,REG_0 ,REG_0 ,16'b0000_0000_0000_0000};     // noop
               92 : complete = 1;
           endcase
       end
       end
end
endmodule
