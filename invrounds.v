`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2021 10:47:51
// Design Name: 
// Module Name: invrounds
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


module invrounds(RoundKey,previous_cipher,present_cipher);
    
    input wire [127:0] previous_cipher,RoundKey;  
    wire [127:0] sb,sr,mc1,mc2,mc3,adrl;
    output [127:0] present_cipher;
    
    assign adrl = previous_cipher ^ RoundKey;
    invmixcolumns op41(adrl,mc1);
    invshiftrows op3(.ip(mc1),.op(sr));
    invsubbytes op2(.in_key(sr),.out_key(sb));
    
    assign present_cipher=sb;
    
    
endmodule
