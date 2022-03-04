`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2021 10:43:48
// Design Name: 
// Module Name: invmixcolumns
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


module invmixcolumns(i_shift,i_mix);
    input [127:0] i_shift;
    output [127:0] i_mix;
    
    assign i_mix[127:120] = s14(i_shift[127:120])^s11(i_shift[119:112])^s13(i_shift[111:104])^s9(i_shift[103:96]);
    assign i_mix[119:112] = s9(i_shift[127:120])^s14(i_shift[119:112])^s11(i_shift[111:104])^s13(i_shift[103:96]);
    assign i_mix[111:104] = s13(i_shift[127:120])^s9(i_shift[119:112])^s14(i_shift[111:104])^s11(i_shift[103:96]);
    assign i_mix[103:96] = s11(i_shift[127:120])^s13(i_shift[119:112])^s9(i_shift[111:104])^s14(i_shift[103:96]);
   
    assign i_mix[95:88] = s14(i_shift[95:88])^s11(i_shift[87:80])^s13(i_shift[79:72])^s9(i_shift[71:64]);
    assign i_mix[87:80] = s9(i_shift[95:88])^s14(i_shift[87:80])^s11(i_shift[79:72])^s13(i_shift[71:64]);
    assign i_mix[79:72] = s13(i_shift[95:88])^s9(i_shift[87:80])^s14(i_shift[79:72])^s11(i_shift[71:64]);
    assign i_mix[71:64] = s11(i_shift[95:88])^s13(i_shift[87:80])^s9(i_shift[79:72])^s14(i_shift[71:64]);
    
    assign i_mix[63:56] = s14(i_shift[63:56])^s11(i_shift[55:48])^s13(i_shift[47:40])^s9(i_shift[39:32]);
    assign i_mix[55:48] = s9(i_shift[63:56])^s14(i_shift[55:48])^s11(i_shift[47:40])^s13(i_shift[39:32]);
    assign i_mix[47:40] = s13(i_shift[63:56])^s9(i_shift[55:48])^s14(i_shift[47:40])^s11(i_shift[39:32]);
    assign i_mix[39:32] = s11(i_shift[63:56])^s13(i_shift[55:48])^s9(i_shift[47:40])^s14(i_shift[39:32]);
    
    assign i_mix[31:24] = s14(i_shift[31:24])^s11(i_shift[23:16])^s13(i_shift[15:8])^s9(i_shift[7:0]);
    assign i_mix[23:16] = s9(i_shift[31:24])^s14(i_shift[23:16])^s11(i_shift[15:8])^s13(i_shift[7:0]);
    assign i_mix[15:8] = s13(i_shift[31:24])^s9(i_shift[23:16])^s14(i_shift[15:8])^s11(i_shift[7:0]);
    assign i_mix[7:0] = s11(i_shift[31:24])^s13(i_shift[23:16])^s9(i_shift[15:8])^s14(i_shift[7:0]);
    
    function [7:0]s2;
    input [7:0]i;
    begin
    if(i[7] ==0)
        s2 = i<<1;
    else
        s2 = (i<<1)^(8'h1b);
    end
    endfunction
    
function [7:0] s9;
    input[7:0]i;
    begin
        s9=s2(s2(s2(i)))^i;
    end
    endfunction


function [7:0] s11;
    input[7:0]i;
    begin
        s11= s2(s2(s2(i))) ^ s2(i) ^ i;
    end
    endfunction


function [7:0] s13;
    input[7:0]i;
    begin
        s13= s2(s2(s2(i))) ^ s2(s2(i)) ^ i;
    end
    endfunction

function [7:0] s14;
    input[7:0]i;
    begin
        s14= s2(s2(s2(i))) ^ s2(s2(i)) ^ s2(i);
    end
    endfunction
endmodule

