`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2021 06:33:00
// Design Name: 
// Module Name: rounds
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


module rounds(data,keyin,rndout);
input [127:0]data;
input [127:0]keyin;
output [127:0]rndout;

wire [127:0] sb,sr,mcl;

subbytes t1(data,sb);
shiftrow t2(sb,sr);
mixcolumn t3(sr,mcl);
assign rndout= keyin^mcl;

endmodule
