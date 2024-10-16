module Twiddle32 #(
    parameter   TW_FF = 1   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [4:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:31];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:31];   //  Twiddle Table (Imag)
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
assign wn_re[1] = 18'b000000001111101100; assign wn_im[1] = 18'b111111111100111000; 
assign wn_re[2] = 18'b000000001110110010; assign wn_im[2] = 18'b111111111001111000; 
assign wn_re[3] = 18'b000000001101010011; assign wn_im[3] = 18'b111111110111000111; 
assign wn_re[4] = 18'b000000001011010100; assign wn_im[4] = 18'b111111110100101011; 
assign wn_re[5] = 18'b000000001000111000; assign wn_im[5] = 18'b111111110010101100; 
assign wn_re[6] = 18'b000000000110000111; assign wn_im[6] = 18'b111111110001001101; 
assign wn_re[7] = 18'b000000000011000111; assign wn_im[7] = 18'b111111110000010011; 
assign wn_re[8] = 18'b000000000000000000; assign wn_im[8] = 18'b111111110000000000; 
assign wn_re[9] = 18'b111111111100111000; assign wn_im[9] = 18'b111111110000010011; 
assign wn_re[10] = 18'b111111111001111000; assign wn_im[10] = 18'b111111110001001101; 
assign wn_re[11] = 18'b111111110111000111; assign wn_im[11] = 18'b111111110010101100; 
assign wn_re[12] = 18'b111111110100101011; assign wn_im[12] = 18'b111111110100101011; 
assign wn_re[13] = 18'b111111110010101100; assign wn_im[13] = 18'b111111110111000111; 
assign wn_re[14] = 18'b111111110001001101; assign wn_im[14] = 18'b111111111001111000; 
assign wn_re[15] = 18'b111111110000010011; assign wn_im[15] = 18'b111111111100111000; 
assign wn_re[16] = 18'b111111110000000000; assign wn_im[16] = 18'b111111111111111111; 
assign wn_re[17] = 18'b111111110000010011; assign wn_im[17] = 18'b000000000011000111; 
assign wn_re[18] = 18'b111111110001001101; assign wn_im[18] = 18'b000000000110000111; 
assign wn_re[19] = 18'b111111110010101100; assign wn_im[19] = 18'b000000001000111000; 
assign wn_re[20] = 18'b111111110100101011; assign wn_im[20] = 18'b000000001011010100; 
assign wn_re[21] = 18'b111111110111000111; assign wn_im[21] = 18'b000000001101010011; 
assign wn_re[22] = 18'b111111111001111000; assign wn_im[22] = 18'b000000001110110010; 
assign wn_re[23] = 18'b111111111100111000; assign wn_im[23] = 18'b000000001111101100; 
assign wn_re[24] = 18'b111111111111111111; assign wn_im[24] = 18'b000000010000000000; 
assign wn_re[25] = 18'b000000000011000111; assign wn_im[25] = 18'b000000001111101100; 
assign wn_re[26] = 18'b000000000110000111; assign wn_im[26] = 18'b000000001110110010; 
assign wn_re[27] = 18'b000000001000111000; assign wn_im[27] = 18'b000000001101010011; 
assign wn_re[28] = 18'b000000001011010100; assign wn_im[28] = 18'b000000001011010100; 
assign wn_re[29] = 18'b000000001101010011; assign wn_im[29] = 18'b000000001000111000; 
assign wn_re[30] = 18'b000000001110110010; assign wn_im[30] = 18'b000000000110000111; 
assign wn_re[31] = 18'b000000001111101100; assign wn_im[31] = 18'b000000000011000111; 

endmodule
