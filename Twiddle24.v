module Twiddle24 #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [10:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:23];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:23];   //  Twiddle Table (Imag)
wire[17:0]  mx_re;          //  Multiplexer output (Real)
wire[17:0]  mx_im;          //  Multiplexer output (Imag)
reg [17:0]  ff_re;          //  Register output (Real)
reg [17:0]  ff_im;          //  Register output (Imag)

assign  mx_re = addr<24 ? wn_re[addr] : 0;
assign  mx_im = addr<24 ? wn_im[addr] : 0;

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;
assign wn_re[0] = 18'b000000010000000000; assign wn_im[0] = 18'b000000000000000000; 
assign wn_re[1] = 18'b000000001111011101; assign wn_im[1] = 18'b111111111011110110; 
assign wn_re[2] = 18'b000000001101110110; assign wn_im[2] = 18'b111111111000000000; 
assign wn_re[3] = 18'b000000001011010100; assign wn_im[3] = 18'b111111110100101011; 
assign wn_re[4] = 18'b000000001000000000; assign wn_im[4] = 18'b111111110010001001; 
assign wn_re[5] = 18'b000000000100001001; assign wn_im[5] = 18'b111111110000100010; 
assign wn_re[6] = 18'b000000000000000000; assign wn_im[6] = 18'b111111110000000000; 
assign wn_re[7] = 18'b111111111011110110; assign wn_im[7] = 18'b111111110000100010; 
assign wn_re[8] = 18'b111111111000000000; assign wn_im[8] = 18'b111111110010001001; 
assign wn_re[9] = 18'b111111110100101011; assign wn_im[9] = 18'b111111110100101011; 
assign wn_re[10] = 18'b111111110010001001; assign wn_im[10] = 18'b111111110111111111; 
assign wn_re[11] = 18'b111111110000100010; assign wn_im[11] = 18'b111111111011110110; 
assign wn_re[12] = 18'b111111110000000000; assign wn_im[12] = 18'b111111111111111111; 
assign wn_re[13] = 18'b111111110000100010; assign wn_im[13] = 18'b000000000100001001; 
assign wn_re[14] = 18'b111111110010001001; assign wn_im[14] = 18'b000000000111111111; 
assign wn_re[15] = 18'b111111110100101011; assign wn_im[15] = 18'b000000001011010100; 
assign wn_re[16] = 18'b111111110111111111; assign wn_im[16] = 18'b000000001101110110; 
assign wn_re[17] = 18'b111111111011110110; assign wn_im[17] = 18'b000000001111011101; 
assign wn_re[18] = 18'b111111111111111111; assign wn_im[18] = 18'b000000010000000000; 
assign wn_re[19] = 18'b000000000100001001; assign wn_im[19] = 18'b000000001111011101; 
assign wn_re[20] = 18'b000000000111111111; assign wn_im[20] = 18'b000000001101110110; 
assign wn_re[21] = 18'b000000001011010100; assign wn_im[21] = 18'b000000001011010100; 
assign wn_re[22] = 18'b000000001101110110; assign wn_im[22] = 18'b000000001000000000; 
assign wn_re[23] = 18'b000000001111011101; assign wn_im[23] = 18'b000000000100001001; 

endmodule
