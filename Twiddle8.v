module Twiddle8 #(
    parameter   TW_FF = 1   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [2:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:7];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:7];   //  Twiddle Table (Imag)
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
assign wn_re[1] = 18'b000000001011010100; assign wn_im[1] = 18'b111111110100101011; 
assign wn_re[2] = 18'b000000000000000000; assign wn_im[2] = 18'b111111110000000000; 
assign wn_re[3] = 18'b111111110100101011; assign wn_im[3] = 18'b111111110100101011; 
assign wn_re[4] = 18'b111111110000000000; assign wn_im[4] = 18'b111111111111111111; 
assign wn_re[5] = 18'b111111110100101011; assign wn_im[5] = 18'b000000001011010100; 
assign wn_re[6] = 18'b111111111111111111; assign wn_im[6] = 18'b000000010000000000; 
assign wn_re[7] = 18'b000000001011010100; assign wn_im[7] = 18'b000000001011010100; 

endmodule
