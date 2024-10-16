import numpy as np
import math
def twiddle(k,N):
    
    return np.exp((-1j * 2 * np.pi * k)/ N)

def twiddle_arr(radix, n): ##twiddle(N,1)
    
    indices = np.arange(radix)
    
    return twiddle(indices * n, radix) 


def quantizer_s7s(x, z, w):
    n_real = np.floor(x.real * 2**w)
    n_img = np.floor(x.imag * 2**w)
    
    truncated_number = n_real/2**w + 1j * n_img/2**w
    
    return truncated_number

def to_twos_complement(num, num_bits):
    """
    Convert a number to its two's complement binary representation.

    Args:
    num (int): The number to be converted.
    num_bits (int): The number of bits including the sign bit.

    Returns:
    str: The binary representation of the number in two's complement.
    """
    return format(num if num >= 0 else (1 << num_bits) + num, '0' + str(num_bits) + 'b')

def to_binary_array(arr, num_bits):
    """
    Convert an array of numbers to their two's complement binary representation.

    Args:
    arr (numpy.ndarray): The array of numbers to be converted.
    num_bits (int): The number of bits including the sign bit.

    Returns:
    numpy.ndarray: The array of binary representations.
    """
    twos_complement_func = np.vectorize(lambda x: to_twos_complement(x, num_bits))
    return np.array(list(twos_complement_func(arr)))

def verilog_import(x, w2Q , b2Q , bT ):
   
    N=x.size
    
    x_real = x.real
    x_img = x.imag

    x_real = np.real(quantizer_s7s(x_real,w2Q,b2Q))
    x_img = np.real(quantizer_s7s(x_img,w2Q,b2Q))
 
    x_real_Q = x_real * (2**b2Q)
    x_img_Q = x_img * (2**b2Q)
    
    x_real_bits = to_binary_array(x_real_Q.astype(int), bT)
    x_img_bits = to_binary_array(x_img_Q.astype(int), bT)
    

    # file_path_real = r'out_r.txt'
    # file_path_img =  r'out_i.txt'


    # save_binary_array_to_file(x_real_bits, file_path_real)
    # save_binary_array_to_file(x_img_bits, file_path_img)
    with open(f'Twiddle{N}.v', 'w') as f:
        f.write(f'''module Twiddle{N} #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [10:0]   addr,   //  Twiddle Factor Number
    output  [{bT-1}:0]  tw_re,  //  Twiddle Factor (Real)
    output  [{bT-1}:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[{bT-1}:0]  wn_re[0:{N-1}];   //  Twiddle Table (Real)
wire[{bT-1}:0]  wn_im[0:{N-1}];   //  Twiddle Table (Imag)
wire[{bT-1}:0]  mx_re;          //  Multiplexer output (Real)
wire[{bT-1}:0]  mx_im;          //  Multiplexer output (Imag)
reg [{bT-1}:0]  ff_re;          //  Register output (Real)
reg [{bT-1}:0]  ff_im;          //  Register output (Imag)

assign  mx_re = addr<{N} ? wn_re[addr] : 0;
assign  mx_im = addr<{N} ? wn_im[addr] : 0;

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;\n''')
        for x in range(N):
            f.write(f"assign wn_re[{x}] = {bT}'b{x_real_bits[x]}; assign wn_im[{x}] = {bT}'b{x_img_bits[x]}; \n")
        
        f.write("\nendmodule\n")
x = [12, 24, 36, 48, 60, 72, 96, 108, 120, 144, 180, 192, 216, 240, 288, 300, 324, 360, 384, 432, 480, 540, 576, 600, 648, 720, 768, 864, 900, 960, 972, 1080, 1152, 1200]
# x=[15,45,75,135,225]
for i in x:        
    twid_bound_arr=twiddle_arr(i,1)   
    verilog_import(twid_bound_arr, w2Q = 0, b2Q = 10, bT = 1+7+10)

