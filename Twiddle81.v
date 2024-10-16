module Twiddle81 #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [6:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:80];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:80];   //  Twiddle Table (Imag)
wire[17:0]  mx_re;          //  Multiplexer output (Real)
wire[17:0]  mx_im;          //  Multiplexer output (Imag)
reg [17:0]  ff_re;          //  Register output (Real)
reg [17:0]  ff_im;          //  Register output (Imag)

assign  mx_re = wn_re[addr];
assign  mx_im = wn_im[addr];

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;
assign wn_re[0] = 18'b000000010000000000; assign wn_im[0] = 18'b000000000000000000; 
assign wn_re[1] = 18'b000000001111111100; assign wn_im[1] = 18'b111111111110110000; 
assign wn_re[2] = 18'b000000001111110011; assign wn_im[2] = 18'b111111111101100001; 
assign wn_re[3] = 18'b000000001111100100; assign wn_im[3] = 18'b111111111100010011; 
assign wn_re[4] = 18'b000000001111001111; assign wn_im[4] = 18'b111111111011000111; 
assign wn_re[5] = 18'b000000001110110011; assign wn_im[5] = 18'b111111111001111100; 
assign wn_re[6] = 18'b000000001110010011; assign wn_im[6] = 18'b111111111000110100; 
assign wn_re[7] = 18'b000000001101101100; assign wn_im[7] = 18'b111111110111101110; 
assign wn_re[8] = 18'b000000001101000001; assign wn_im[8] = 18'b111111110110101100; 
assign wn_re[9] = 18'b000000001100010000; assign wn_im[9] = 18'b111111110101101101; 
assign wn_re[10] = 18'b000000001011011011; assign wn_im[10] = 18'b111111110100110010; 
assign wn_re[11] = 18'b000000001010100001; assign wn_im[11] = 18'b111111110011111100; 
assign wn_re[12] = 18'b000000001001100011; assign wn_im[12] = 18'b111111110011001010; 
assign wn_re[13] = 18'b000000001000100010; assign wn_im[13] = 18'b111111110010011101; 
assign wn_re[14] = 18'b000000000111011101; assign wn_im[14] = 18'b111111110001110110; 
assign wn_re[15] = 18'b000000000110010101; assign wn_im[15] = 18'b111111110001010011; 
assign wn_re[16] = 18'b000000000101001011; assign wn_im[16] = 18'b111111110000110111; 
assign wn_re[17] = 18'b000000000011111111; assign wn_im[17] = 18'b111111110000100000; 
assign wn_re[18] = 18'b000000000010110001; assign wn_im[18] = 18'b111111110000001111; 
assign wn_re[19] = 18'b000000000001100011; assign wn_im[19] = 18'b111111110000000100; 
assign wn_re[20] = 18'b000000000000010011; assign wn_im[20] = 18'b111111110000000000; 
assign wn_re[21] = 18'b111111111111000100; assign wn_im[21] = 18'b111111110000000001; 
assign wn_re[22] = 18'b111111111101110101; assign wn_im[22] = 18'b111111110000001001; 
assign wn_re[23] = 18'b111111111100100111; assign wn_im[23] = 18'b111111110000010111; 
assign wn_re[24] = 18'b111111111011011010; assign wn_im[24] = 18'b111111110000101011; 
assign wn_re[25] = 18'b111111111010001111; assign wn_im[25] = 18'b111111110001000100; 
assign wn_re[26] = 18'b111111111001000110; assign wn_im[26] = 18'b111111110001100100; 
assign wn_re[27] = 18'b111111111000000000; assign wn_im[27] = 18'b111111110010001001; 
assign wn_re[28] = 18'b111111110110111100; assign wn_im[28] = 18'b111111110010110011; 
assign wn_re[29] = 18'b111111110101111101; assign wn_im[29] = 18'b111111110011100010; 
assign wn_re[30] = 18'b111111110101000001; assign wn_im[30] = 18'b111111110100010111; 
assign wn_re[31] = 18'b111111110100001001; assign wn_im[31] = 18'b111111110101001111; 
assign wn_re[32] = 18'b111111110011010110; assign wn_im[32] = 18'b111111110110001100; 
assign wn_re[33] = 18'b111111110010101000; assign wn_im[33] = 18'b111111110111001101; 
assign wn_re[34] = 18'b111111110001111111; assign wn_im[34] = 18'b111111111000010001; 
assign wn_re[35] = 18'b111111110001011011; assign wn_im[35] = 18'b111111111001011000; 
assign wn_re[36] = 18'b111111110000111101; assign wn_im[36] = 18'b111111111010100001; 
assign wn_re[37] = 18'b111111110000100101; assign wn_im[37] = 18'b111111111011101101; 
assign wn_re[38] = 18'b111111110000010011; assign wn_im[38] = 18'b111111111100111010; 
assign wn_re[39] = 18'b111111110000000110; assign wn_im[39] = 18'b111111111110001001; 
assign wn_re[40] = 18'b111111110000000000; assign wn_im[40] = 18'b111111111111011000; 
assign wn_re[41] = 18'b111111110000000000; assign wn_im[41] = 18'b000000000000100111; 
assign wn_re[42] = 18'b111111110000000110; assign wn_im[42] = 18'b000000000001110110; 
assign wn_re[43] = 18'b111111110000010011; assign wn_im[43] = 18'b000000000011000101; 
assign wn_re[44] = 18'b111111110000100101; assign wn_im[44] = 18'b000000000100010010; 
assign wn_re[45] = 18'b111111110000111101; assign wn_im[45] = 18'b000000000101011110; 
assign wn_re[46] = 18'b111111110001011011; assign wn_im[46] = 18'b000000000110100111; 
assign wn_re[47] = 18'b111111110001111111; assign wn_im[47] = 18'b000000000111101110; 
assign wn_re[48] = 18'b111111110010101000; assign wn_im[48] = 18'b000000001000110010; 
assign wn_re[49] = 18'b111111110011010110; assign wn_im[49] = 18'b000000001001110011; 
assign wn_re[50] = 18'b111111110100001001; assign wn_im[50] = 18'b000000001010110000; 
assign wn_re[51] = 18'b111111110101000001; assign wn_im[51] = 18'b000000001011101000; 
assign wn_re[52] = 18'b111111110101111101; assign wn_im[52] = 18'b000000001100011101; 
assign wn_re[53] = 18'b111111110110111100; assign wn_im[53] = 18'b000000001101001100; 
assign wn_re[54] = 18'b111111110111111111; assign wn_im[54] = 18'b000000001101110110; 
assign wn_re[55] = 18'b111111111001000110; assign wn_im[55] = 18'b000000001110011011; 
assign wn_re[56] = 18'b111111111010001111; assign wn_im[56] = 18'b000000001110111011; 
assign wn_re[57] = 18'b111111111011011010; assign wn_im[57] = 18'b000000001111010100; 
assign wn_re[58] = 18'b111111111100100111; assign wn_im[58] = 18'b000000001111101000; 
assign wn_re[59] = 18'b111111111101110101; assign wn_im[59] = 18'b000000001111110110; 
assign wn_re[60] = 18'b111111111111000100; assign wn_im[60] = 18'b000000001111111110; 
assign wn_re[61] = 18'b000000000000010011; assign wn_im[61] = 18'b000000001111111111; 
assign wn_re[62] = 18'b000000000001100011; assign wn_im[62] = 18'b000000001111111011; 
assign wn_re[63] = 18'b000000000010110001; assign wn_im[63] = 18'b000000001111110000; 
assign wn_re[64] = 18'b000000000011111111; assign wn_im[64] = 18'b000000001111011111; 
assign wn_re[65] = 18'b000000000101001011; assign wn_im[65] = 18'b000000001111001000; 
assign wn_re[66] = 18'b000000000110010101; assign wn_im[66] = 18'b000000001110101100; 
assign wn_re[67] = 18'b000000000111011101; assign wn_im[67] = 18'b000000001110001001; 
assign wn_re[68] = 18'b000000001000100010; assign wn_im[68] = 18'b000000001101100010; 
assign wn_re[69] = 18'b000000001001100011; assign wn_im[69] = 18'b000000001100110101; 
assign wn_re[70] = 18'b000000001010100001; assign wn_im[70] = 18'b000000001100000011; 
assign wn_re[71] = 18'b000000001011011011; assign wn_im[71] = 18'b000000001011001101; 
assign wn_re[72] = 18'b000000001100010000; assign wn_im[72] = 18'b000000001010010010; 
assign wn_re[73] = 18'b000000001101000001; assign wn_im[73] = 18'b000000001001010011; 
assign wn_re[74] = 18'b000000001101101100; assign wn_im[74] = 18'b000000001000010001; 
assign wn_re[75] = 18'b000000001110010011; assign wn_im[75] = 18'b000000000111001011; 
assign wn_re[76] = 18'b000000001110110011; assign wn_im[76] = 18'b000000000110000011; 
assign wn_re[77] = 18'b000000001111001111; assign wn_im[77] = 18'b000000000100111000; 
assign wn_re[78] = 18'b000000001111100100; assign wn_im[78] = 18'b000000000011101100; 
assign wn_re[79] = 18'b000000001111110011; assign wn_im[79] = 18'b000000000010011110; 
assign wn_re[80] = 18'b000000001111111100; assign wn_im[80] = 18'b000000000001001111; 

endmodule
