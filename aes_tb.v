`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2021 18:27:06
// Design Name: 
// Module Name: aes_tb
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


module aes_tb(

    );
    reg [127:0] data,key;
    wire [127:0] cipher,decrypt;
    
    
    initial
    begin
    #10 data=128'haaeabaaeabaaeabaaeabaaeabaaeabaa; 
    key=128'hf1fc7f1fc7f1fc7f1fc7f1fc7f1fc7f1;
    #500;
    end
    main aes1(data,key,cipher,decrypt);
endmodule
