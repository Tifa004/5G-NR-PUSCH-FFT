import numpy as np

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

def quantizer_s7s(x, z, w):
    # Rounded_re = np.round(x.real * 2**w) / (2**(z+w))
    # Rounded_re[Rounded_re >= 1] = 1 - 2**(-z-w)
    # Rounded_re[Rounded_re < -1] = -1
    # out = Rounded_re * 2**z 
    # return out
    n = np.floor(x * 2**w)
    
    truncated_number = n/2**w 
    
    return truncated_number

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
    file_path_real = r'in_r.txt'
    file_path_img =  r'in_i.txt'

    with open (file_path_real, 'w') as f:
        for item in x_real_bits:
            f.write("%s\n" % item)  
            
    with open (file_path_img, 'w') as f:
        for item in x_img_bits:
            f.write("%s\n" % item)

# Open the text file for reading
with open(r"C:\\Users\\Mostafa\Desktop\\GP\\MatlabGOLD\\FFT\\complex_numbers.txt", 'r') as file:
    # Read lines from the file
    lines = file.readlines()

# Initialize an empty list to store complex numbers
complex_numbers = []

# Iterate over each line in the file
for line in lines:
    # Split the line into real and imaginary parts
    real_part, imaginary_part = map(float, line.split())
    # Create complex number and append to the list
    complex_numbers.append(complex(real_part, imaginary_part))

# Convert the list to a numpy array
complex_array = np.array(complex_numbers)
verilog_import(complex_array,7,10,1+7+10)


