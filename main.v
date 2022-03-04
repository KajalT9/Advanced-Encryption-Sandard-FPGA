`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2021 18:14:34
// Design Name: 
// Module Name: main
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


module main(
input [127:0] data,
    input [127:0] key,
    output[127:0] cipher,
    output [127:0] decrypt
    );
     wire [127:0] temp;
    
    aesencrypt en(.datain(data),.key(key),.dataout(cipher));
    assign temp=cipher;
    aesdecrypt dc(.cipher(temp),.Key(key),.Result(decrypt));
    endmodule
