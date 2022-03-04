`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2021 06:32:22
// Design Name: 
// Module Name: aescipher
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aesencrypt(datain,key,dataout);
    input [127:0] datain;
    input [127:0] key;
    output[127:0] dataout;
    
    wire [127:0] r0_out;
    wire [127:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    
    wire [127:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9;
	 
	 assign r0_out = datain^key;
	 
	 wire [1279 : 0] complete_aes_key; 
    aeskey aeskey1(key,complete_aes_key);
	 
    rounds r1(.data(r0_out),.keyin(complete_aes_key[1279-(0)*128-:128]),.rndout(r1_out));
    rounds r2(.data(r1_out),.keyin(complete_aes_key[1279-(1)*128-:128]),.rndout(r2_out));
    rounds r3(.data(r2_out),.keyin(complete_aes_key[1279-(2)*128-:128]),.rndout(r3_out));
    rounds r4(.data(r3_out),.keyin(complete_aes_key[1279-(3)*128-:128]),.rndout(r4_out));
    rounds r5(.data(r4_out),.keyin(complete_aes_key[1279-(4)*128-:128]),.rndout(r5_out));
    rounds r6(.data(r5_out),.keyin(complete_aes_key[1279-(5)*128-:128]),.rndout(r6_out));
    rounds r7(.data(r6_out),.keyin(complete_aes_key[1279-(6)*128-:128]),.rndout(r7_out));
    rounds r8(.data(r7_out),.keyin(complete_aes_key[1279-(7)*128-:128]),.rndout(r8_out));
    rounds r9(.data(r8_out),.keyin(complete_aes_key[1279-(8)*128-:128]),.rndout(r9_out));
    rounndlast r10(.rin(r9_out),.keylastin(complete_aes_key[127:0]),.fout(dataout));
    
endmodule