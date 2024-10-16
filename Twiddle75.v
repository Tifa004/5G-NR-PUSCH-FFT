module Twiddle75 #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [10:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:74];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:74];   //  Twiddle Table (Imag)
wire[17:0]  mx_re;          //  Multiplexer output (Real)
wire[17:0]  mx_im;          //  Multiplexer output (Imag)
reg [17:0]  ff_re;          //  Register output (Real)
reg [17:0]  ff_im;          //  Register output (Imag)

assign  mx_re = addr<75 ? wn_re[addr] : 0;
assign  mx_im = addr<75 ? wn_im[addr] : 0;

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;
assign wn_re[0] = 18'b000000010000000000; assign wn_im[0] = 18'b000000000000000000; 
assign wn_re[1] = 18'b000000001111111100; assign wn_im[1] = 18'b111111111110101010; 
assign wn_re[2] = 18'b000000001111110001; assign wn_im[2] = 18'b111111111101010101; 
assign wn_re[3] = 18'b000000001111011111; assign wn_im[3] = 18'b111111111100000001; 
assign wn_re[4] = 18'b000000001111000111; assign wn_im[4] = 18'b111111111010101111; 
assign wn_re[5] = 18'b000000001110100111; assign wn_im[5] = 18'b111111111001011111; 
assign wn_re[6] = 18'b000000001110000001; assign wn_im[6] = 18'b111111111000010010; 
assign wn_re[7] = 18'b000000001101010100; assign wn_im[7] = 18'b111111110111001001; 
assign wn_re[8] = 18'b000000001100100010; assign wn_im[8] = 18'b111111110110000011; 
assign wn_re[9] = 18'b000000001011101010; assign wn_im[9] = 18'b111111110101000011; 
assign wn_re[10] = 18'b000000001010101101; assign wn_im[10] = 18'b111111110100000111; 
assign wn_re[11] = 18'b000000001001101011; assign wn_im[11] = 18'b111111110011010000; 
assign wn_re[12] = 18'b000000001000100100; assign wn_im[12] = 18'b111111110010011111; 
assign wn_re[13] = 18'b000000000111011010; assign wn_im[13] = 18'b111111110001110100; 
assign wn_re[14] = 18'b000000000110001100; assign wn_im[14] = 18'b111111110001010000; 
assign wn_re[15] = 18'b000000000100111100; assign wn_im[15] = 18'b111111110000110010; 
assign wn_re[16] = 18'b000000000011101001; assign wn_im[16] = 18'b111111110000011011; 
assign wn_re[17] = 18'b000000000010010101; assign wn_im[17] = 18'b111111110000001010; 
assign wn_re[18] = 18'b000000000001000000; assign wn_im[18] = 18'b111111110000000010; 
assign wn_re[19] = 18'b111111111111101010; assign wn_im[19] = 18'b111111110000000000; 
assign wn_re[20] = 18'b111111111110010100; assign wn_im[20] = 18'b111111110000000101; 
assign wn_re[21] = 18'b111111111101000000; assign wn_im[21] = 18'b111111110000010010; 
assign wn_re[22] = 18'b111111111011101100; assign wn_im[22] = 18'b111111110000100101; 
assign wn_re[23] = 18'b111111111010011011; assign wn_im[23] = 18'b111111110001000000; 
assign wn_re[24] = 18'b111111111001001100; assign wn_im[24] = 18'b111111110001100001; 
assign wn_re[25] = 18'b111111110111111111; assign wn_im[25] = 18'b111111110010001001; 
assign wn_re[26] = 18'b111111110110110111; assign wn_im[26] = 18'b111111110010110111; 
assign wn_re[27] = 18'b111111110101110011; assign wn_im[27] = 18'b111111110011101010; 
assign wn_re[28] = 18'b111111110100110011; assign wn_im[28] = 18'b111111110100100100; 
assign wn_re[29] = 18'b111111110011111000; assign wn_im[29] = 18'b111111110101100010; 
assign wn_re[30] = 18'b111111110011000011; assign wn_im[30] = 18'b111111110110100110; 
assign wn_re[31] = 18'b111111110010010100; assign wn_im[31] = 18'b111111110111101101; 
assign wn_re[32] = 18'b111111110001101010; assign wn_im[32] = 18'b111111111000111000; 
assign wn_re[33] = 18'b111111110001000111; assign wn_im[33] = 18'b111111111010000111; 
assign wn_re[34] = 18'b111111110000101011; assign wn_im[34] = 18'b111111111011011000; 
assign wn_re[35] = 18'b111111110000010110; assign wn_im[35] = 18'b111111111100101011; 
assign wn_re[36] = 18'b111111110000001000; assign wn_im[36] = 18'b111111111101111111; 
assign wn_re[37] = 18'b111111110000000000; assign wn_im[37] = 18'b111111111111010101; 
assign wn_re[38] = 18'b111111110000000000; assign wn_im[38] = 18'b000000000000101010; 
assign wn_re[39] = 18'b111111110000001000; assign wn_im[39] = 18'b000000000010000000; 
assign wn_re[40] = 18'b111111110000010110; assign wn_im[40] = 18'b000000000011010100; 
assign wn_re[41] = 18'b111111110000101011; assign wn_im[41] = 18'b000000000100100111; 
assign wn_re[42] = 18'b111111110001000111; assign wn_im[42] = 18'b000000000101111000; 
assign wn_re[43] = 18'b111111110001101010; assign wn_im[43] = 18'b000000000111000111; 
assign wn_re[44] = 18'b111111110010010100; assign wn_im[44] = 18'b000000001000010010; 
assign wn_re[45] = 18'b111111110011000011; assign wn_im[45] = 18'b000000001001011001; 
assign wn_re[46] = 18'b111111110011111000; assign wn_im[46] = 18'b000000001010011101; 
assign wn_re[47] = 18'b111111110100110011; assign wn_im[47] = 18'b000000001011011011; 
assign wn_re[48] = 18'b111111110101110011; assign wn_im[48] = 18'b000000001100010101; 
assign wn_re[49] = 18'b111111110110110111; assign wn_im[49] = 18'b000000001101001000; 
assign wn_re[50] = 18'b111111111000000000; assign wn_im[50] = 18'b000000001101110110; 
assign wn_re[51] = 18'b111111111001001100; assign wn_im[51] = 18'b000000001110011110; 
assign wn_re[52] = 18'b111111111010011011; assign wn_im[52] = 18'b000000001110111111; 
assign wn_re[53] = 18'b111111111011101100; assign wn_im[53] = 18'b000000001111011010; 
assign wn_re[54] = 18'b111111111101000000; assign wn_im[54] = 18'b000000001111101101; 
assign wn_re[55] = 18'b111111111110010100; assign wn_im[55] = 18'b000000001111111010; 
assign wn_re[56] = 18'b111111111111101010; assign wn_im[56] = 18'b000000001111111111; 
assign wn_re[57] = 18'b000000000001000000; assign wn_im[57] = 18'b000000001111111101; 
assign wn_re[58] = 18'b000000000010010101; assign wn_im[58] = 18'b000000001111110101; 
assign wn_re[59] = 18'b000000000011101001; assign wn_im[59] = 18'b000000001111100100; 
assign wn_re[60] = 18'b000000000100111100; assign wn_im[60] = 18'b000000001111001101; 
assign wn_re[61] = 18'b000000000110001100; assign wn_im[61] = 18'b000000001110101111; 
assign wn_re[62] = 18'b000000000111011010; assign wn_im[62] = 18'b000000001110001011; 
assign wn_re[63] = 18'b000000001000100100; assign wn_im[63] = 18'b000000001101100000; 
assign wn_re[64] = 18'b000000001001101011; assign wn_im[64] = 18'b000000001100101111; 
assign wn_re[65] = 18'b000000001010101101; assign wn_im[65] = 18'b000000001011111000; 
assign wn_re[66] = 18'b000000001011101010; assign wn_im[66] = 18'b000000001010111100; 
assign wn_re[67] = 18'b000000001100100010; assign wn_im[67] = 18'b000000001001111100; 
assign wn_re[68] = 18'b000000001101010100; assign wn_im[68] = 18'b000000001000110110; 
assign wn_re[69] = 18'b000000001110000001; assign wn_im[69] = 18'b000000000111101101; 
assign wn_re[70] = 18'b000000001110100111; assign wn_im[70] = 18'b000000000110100000; 
assign wn_re[71] = 18'b000000001111000111; assign wn_im[71] = 18'b000000000101010000; 
assign wn_re[72] = 18'b000000001111011111; assign wn_im[72] = 18'b000000000011111110; 
assign wn_re[73] = 18'b000000001111110001; assign wn_im[73] = 18'b000000000010101010; 
assign wn_re[74] = 18'b000000001111111100; assign wn_im[74] = 18'b000000000001010101; 

endmodule
