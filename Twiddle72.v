module Twiddle72 #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [10:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:71];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:71];   //  Twiddle Table (Imag)
wire[17:0]  mx_re;          //  Multiplexer output (Real)
wire[17:0]  mx_im;          //  Multiplexer output (Imag)
reg [17:0]  ff_re;          //  Register output (Real)
reg [17:0]  ff_im;          //  Register output (Imag)

assign  mx_re = addr<72 ? wn_re[addr] : 0;
assign  mx_im = addr<72 ? wn_im[addr] : 0;

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;
assign wn_re[0] = 18'b000000010000000000; assign wn_im[0] = 18'b000000000000000000; 
assign wn_re[1] = 18'b000000001111111100; assign wn_im[1] = 18'b111111111110100110; 
assign wn_re[2] = 18'b000000001111110000; assign wn_im[2] = 18'b111111111101001110; 
assign wn_re[3] = 18'b000000001111011101; assign wn_im[3] = 18'b111111111011110110; 
assign wn_re[4] = 18'b000000001111000010; assign wn_im[4] = 18'b111111111010100001; 
assign wn_re[5] = 18'b000000001110100000; assign wn_im[5] = 18'b111111111001001111; 
assign wn_re[6] = 18'b000000001101110110; assign wn_im[6] = 18'b111111111000000000; 
assign wn_re[7] = 18'b000000001101000110; assign wn_im[7] = 18'b111111110110110100; 
assign wn_re[8] = 18'b000000001100010000; assign wn_im[8] = 18'b111111110101101101; 
assign wn_re[9] = 18'b000000001011010100; assign wn_im[9] = 18'b111111110100101011; 
assign wn_re[10] = 18'b000000001010010010; assign wn_im[10] = 18'b111111110011101111; 
assign wn_re[11] = 18'b000000001001001011; assign wn_im[11] = 18'b111111110010111001; 
assign wn_re[12] = 18'b000000001000000000; assign wn_im[12] = 18'b111111110010001001; 
assign wn_re[13] = 18'b000000000110110000; assign wn_im[13] = 18'b111111110001011111; 
assign wn_re[14] = 18'b000000000101011110; assign wn_im[14] = 18'b111111110000111101; 
assign wn_re[15] = 18'b000000000100001001; assign wn_im[15] = 18'b111111110000100010; 
assign wn_re[16] = 18'b000000000010110001; assign wn_im[16] = 18'b111111110000001111; 
assign wn_re[17] = 18'b000000000001011001; assign wn_im[17] = 18'b111111110000000011; 
assign wn_re[18] = 18'b000000000000000000; assign wn_im[18] = 18'b111111110000000000; 
assign wn_re[19] = 18'b111111111110100110; assign wn_im[19] = 18'b111111110000000011; 
assign wn_re[20] = 18'b111111111101001110; assign wn_im[20] = 18'b111111110000001111; 
assign wn_re[21] = 18'b111111111011110110; assign wn_im[21] = 18'b111111110000100010; 
assign wn_re[22] = 18'b111111111010100001; assign wn_im[22] = 18'b111111110000111101; 
assign wn_re[23] = 18'b111111111001001111; assign wn_im[23] = 18'b111111110001011111; 
assign wn_re[24] = 18'b111111111000000000; assign wn_im[24] = 18'b111111110010001001; 
assign wn_re[25] = 18'b111111110110110100; assign wn_im[25] = 18'b111111110010111001; 
assign wn_re[26] = 18'b111111110101101101; assign wn_im[26] = 18'b111111110011101111; 
assign wn_re[27] = 18'b111111110100101011; assign wn_im[27] = 18'b111111110100101011; 
assign wn_re[28] = 18'b111111110011101111; assign wn_im[28] = 18'b111111110101101101; 
assign wn_re[29] = 18'b111111110010111001; assign wn_im[29] = 18'b111111110110110100; 
assign wn_re[30] = 18'b111111110010001001; assign wn_im[30] = 18'b111111110111111111; 
assign wn_re[31] = 18'b111111110001011111; assign wn_im[31] = 18'b111111111001001111; 
assign wn_re[32] = 18'b111111110000111101; assign wn_im[32] = 18'b111111111010100001; 
assign wn_re[33] = 18'b111111110000100010; assign wn_im[33] = 18'b111111111011110110; 
assign wn_re[34] = 18'b111111110000001111; assign wn_im[34] = 18'b111111111101001110; 
assign wn_re[35] = 18'b111111110000000011; assign wn_im[35] = 18'b111111111110100110; 
assign wn_re[36] = 18'b111111110000000000; assign wn_im[36] = 18'b111111111111111111; 
assign wn_re[37] = 18'b111111110000000011; assign wn_im[37] = 18'b000000000001011001; 
assign wn_re[38] = 18'b111111110000001111; assign wn_im[38] = 18'b000000000010110001; 
assign wn_re[39] = 18'b111111110000100010; assign wn_im[39] = 18'b000000000100001001; 
assign wn_re[40] = 18'b111111110000111101; assign wn_im[40] = 18'b000000000101011110; 
assign wn_re[41] = 18'b111111110001011111; assign wn_im[41] = 18'b000000000110110000; 
assign wn_re[42] = 18'b111111110010001001; assign wn_im[42] = 18'b000000000111111111; 
assign wn_re[43] = 18'b111111110010111001; assign wn_im[43] = 18'b000000001001001011; 
assign wn_re[44] = 18'b111111110011101111; assign wn_im[44] = 18'b000000001010010010; 
assign wn_re[45] = 18'b111111110100101011; assign wn_im[45] = 18'b000000001011010100; 
assign wn_re[46] = 18'b111111110101101101; assign wn_im[46] = 18'b000000001100010000; 
assign wn_re[47] = 18'b111111110110110100; assign wn_im[47] = 18'b000000001101000110; 
assign wn_re[48] = 18'b111111110111111111; assign wn_im[48] = 18'b000000001101110110; 
assign wn_re[49] = 18'b111111111001001111; assign wn_im[49] = 18'b000000001110100000; 
assign wn_re[50] = 18'b111111111010100001; assign wn_im[50] = 18'b000000001111000010; 
assign wn_re[51] = 18'b111111111011110110; assign wn_im[51] = 18'b000000001111011101; 
assign wn_re[52] = 18'b111111111101001110; assign wn_im[52] = 18'b000000001111110000; 
assign wn_re[53] = 18'b111111111110100110; assign wn_im[53] = 18'b000000001111111100; 
assign wn_re[54] = 18'b111111111111111111; assign wn_im[54] = 18'b000000010000000000; 
assign wn_re[55] = 18'b000000000001011001; assign wn_im[55] = 18'b000000001111111100; 
assign wn_re[56] = 18'b000000000010110001; assign wn_im[56] = 18'b000000001111110000; 
assign wn_re[57] = 18'b000000000100001001; assign wn_im[57] = 18'b000000001111011101; 
assign wn_re[58] = 18'b000000000101011110; assign wn_im[58] = 18'b000000001111000010; 
assign wn_re[59] = 18'b000000000110110000; assign wn_im[59] = 18'b000000001110100000; 
assign wn_re[60] = 18'b000000000111111111; assign wn_im[60] = 18'b000000001101110110; 
assign wn_re[61] = 18'b000000001001001011; assign wn_im[61] = 18'b000000001101000110; 
assign wn_re[62] = 18'b000000001010010010; assign wn_im[62] = 18'b000000001100010000; 
assign wn_re[63] = 18'b000000001011010100; assign wn_im[63] = 18'b000000001011010100; 
assign wn_re[64] = 18'b000000001100010000; assign wn_im[64] = 18'b000000001010010010; 
assign wn_re[65] = 18'b000000001101000110; assign wn_im[65] = 18'b000000001001001011; 
assign wn_re[66] = 18'b000000001101110110; assign wn_im[66] = 18'b000000001000000000; 
assign wn_re[67] = 18'b000000001110100000; assign wn_im[67] = 18'b000000000110110000; 
assign wn_re[68] = 18'b000000001111000010; assign wn_im[68] = 18'b000000000101011110; 
assign wn_re[69] = 18'b000000001111011101; assign wn_im[69] = 18'b000000000100001001; 
assign wn_re[70] = 18'b000000001111110000; assign wn_im[70] = 18'b000000000010110001; 
assign wn_re[71] = 18'b000000001111111100; assign wn_im[71] = 18'b000000000001011001; 

endmodule
