`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2021 10:45:47
// Design Name: 
// Module Name: invsubbytes
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


module invsubbytes(in_key,out_key);
    input [127:0] in_key;
    output wire [127:0] out_key;

    genvar i;
    generate
        for (i=0; i<16; i=i+1)
        begin: GEN_INSBOX
            inv_sbox invsbox1(.ip(in_key [8*i +: 8]), .sbout(out_key [8*i +: 8]));
        end
    endgenerate

endmodule
