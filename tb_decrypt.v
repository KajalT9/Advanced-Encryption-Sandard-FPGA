`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2021 15:35:46
// Design Name: 
// Module Name: tb_decrypt
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


module tb_decrypt(

    );
    
    reg [127:0] Block,Key;
    wire [127:0] Result;
  
	
	initial
	begin
	   Block=128'hd2062eeec0e7f718a5c91f4db25d0658; 
	   Key=128'hf1fc7f1fc7f1fc7f1fc7f1fc7f1fc7f1;
	end
    aesdecrypt aes2(Block, Key,Result
					);
endmodule
