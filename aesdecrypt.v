module aesdecrypt(input wire [127:0] cipher,
					input wire [127:0] Key,
					output wire [127:0] Result
					);
					
wire [1279 : 0] complete_aes_key; 
aeskey aeskey1(Key,complete_aes_key);

wire [127:0] r0_out;
    wire [127:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    wire [127:0] srl,adrl;
	
assign adrl=cipher^complete_aes_key[127:0];
invshiftrows shift(.ip(adrl),.op(srl));
invsubbytes subB(.in_key (srl),. out_key (r0_out));

invrounds r1(.RoundKey(complete_aes_key[1279-(8)*128-:128]),
              .previous_cipher(r0_out),.present_cipher(r1_out));
invrounds r2(.RoundKey(complete_aes_key[1279-(7)*128-:128]),
              .previous_cipher(r1_out),.present_cipher(r2_out));
invrounds r3(.RoundKey(complete_aes_key[1279-(6)*128-:128]),
              .previous_cipher(r2_out),.present_cipher(r3_out));
invrounds r4(.RoundKey(complete_aes_key[1279-(5)*128-:128]),
              .previous_cipher(r3_out),.present_cipher(r4_out)); 
invrounds r5(.RoundKey(complete_aes_key[1279-(4)*128-:128]),
              .previous_cipher(r4_out),.present_cipher(r5_out)); 
invrounds r6(.RoundKey(complete_aes_key[1279-(3)*128-:128]),
              .previous_cipher(r5_out),.present_cipher(r6_out)); 
invrounds r7(.RoundKey(complete_aes_key[1279-(2)*128-:128]),
              .previous_cipher(r6_out),.present_cipher(r7_out)); 
invrounds r8(.RoundKey(complete_aes_key[1279-(1)*128-:128]),
              .previous_cipher(r7_out),.present_cipher(r8_out)); 
invrounds r9(.RoundKey(complete_aes_key[1279-(0)*128-:128]),
              .previous_cipher(r8_out),.present_cipher(r9_out)); 

	
assign Result = r9_out^Key;							
 

endmodule