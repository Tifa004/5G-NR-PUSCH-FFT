import numpy as np
def ord(x, N):
    out = [0] * len(x)
    max_val = len(x) - 1
    max_base = np.base_repr(max_val, base=N)
    
    for i in range(len(x)):
        if i == 0:
            base = '0'
        else:
            remainder = i
            base = ''
            
            # Perform base-N conversion
            while remainder > 0:
                digit = remainder % N
                base = str(digit) + base
                remainder = remainder // N
        
        base = base.zfill(len(max_base))
        base = base[::-1]
        m = 0
        for k in range(len(base)):
            m += N ** (len(base) - 1 - k) * int(base[k])
        
        out[m] = x[i]
    
    return out

# Example usage:
x=[]
for i in range(25):
    x.append(i)
N = 5
reordered = ord(x, N)
for i in range(len(reordered)):
          print(f'''
           (di_count == 5'd{x[i]}) ? 5'd{reordered[i]} :''')
