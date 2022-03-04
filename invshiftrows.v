`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2021 10:51:58
// Design Name: 
// Module Name: invshiftrows
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


module invshiftrows(ip,op);
    input [127:0] ip;
    output [127:0] op;
     
    
	 wire [31 : 0] w0, w1, w2, w3;
    wire [31 : 0] ws0, ws1, ws2, ws3;
    
      assign w0 = ip[127 : 096];
      assign w1 = ip[095 : 064];
      assign w2 = ip[063 : 032];
      assign w3 = ip[031 : 000];

      assign ws0 = {w0[31 : 24], w3[23 : 16], w2[15 : 08], w1[07 : 00]};
      assign ws1 = {w1[31 : 24], w0[23 : 16], w3[15 : 08], w2[07 : 00]};
      assign ws2 = {w2[31 : 24], w1[23 : 16], w0[15 : 08], w3[07 : 00]};
      assign ws3 = {w3[31 : 24], w2[23 : 16], w1[15 : 08], w0[07 : 00]};
      assign op = {ws0, ws1, ws2, ws3};  
    
    
endmodule
