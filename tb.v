`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2021 06:38:42
// Design Name: 
// Module Name: tb
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


module tb(

    );
    
    reg [127:0] datain,key;
    wire [127:0] dataout;
    
	initial
	begin
	   datain=128'haaeabaaeabaaeabaaeabaaeabaaeabaa; 
	   key=128'hf1fc7f1fc7f1fc7f1fc7f1fc7f1fc7f1;
	end
    aesencrypt aes(datain,key,dataout);
endmodule
