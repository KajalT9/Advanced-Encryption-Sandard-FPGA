`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2021 06:34:35
// Design Name: 
// Module Name: mixcolumns
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


module mixcolumn(data,mcl);
input [127:0] data;
output [127:0] mcl;



assign mcl[127:120] = m2(data[127:120])^m2(data[119:112])^data[119:112]^data[111:104]^data[103:96];
    assign mcl[119:112] = data[127:120]^m2(data[119:112])^m2(data[111:104])^data[111:104]^data[103:96];
    assign mcl[111:104] = data[127:120]^data[119:112]^m2(data[111:104])^m2(data[103:96])^data[103:96];
    assign mcl[103:96] = m2(data[127:120])^data[127:120]^data[119:112]^data[111:104]^m2(data[103:96]);
    
    assign mcl[95:88] = m2(data[95:88])^m2(data[87:80])^data[87:80]^data[79:72]^data[71:64];
    assign mcl[87:80] = data[95:88]^m2(data[87:80])^m2(data[79:72])^data[79:72]^data[71:64];
    assign mcl[79:72] = data[95:88]^data[87:80]^m2(data[79:72])^m2(data[71:64])^data[71:64];
    assign mcl[71:64] = m2(data[95:88])^data[95:88]^data[87:80]^data[79:72]^m2(data[71:64]);
    
    assign mcl[63:56] = m2(data[63:56])^m2(data[55:48])^data[55:48]^data[47:40]^data[39:32];
    assign mcl[55:48] = data[63:56]^m2(data[55:48])^m2(data[47:40])^data[47:40]^data[39:32];
    assign mcl[47:40] = data[63:56]^data[55:48]^m2(data[47:40])^m2(data[39:32])^data[39:32];
    assign mcl[39:32] = m2(data[63:56])^data[63:56]^data[55:48]^data[47:40]^m2(data[39:32]);
    
    assign mcl[31:24] = m2(data[31:24])^m2(data[23:16])^data[23:16]^data[15:8]^data[7:0];
    assign mcl[23:16] = data[31:24]^m2(data[23:16])^m2(data[15:8])^data[15:8]^data[7:0];
    assign mcl[15:8] = data[31:24]^data[23:16]^m2(data[15:8])^m2(data[7:0])^data[7:0];
    assign mcl[7:0] = m2(data[31:24])^data[31:24]^data[23:16]^data[15:8]^m2(data[7:0]);
    
    function [7:0]m2;
    input [7:0]i;
    begin
    if(i[7] ==0)
        m2 = i<<1;
    else
        m2 = (i<<1)^(8'h1b);
    end
    endfunction
endmodule
