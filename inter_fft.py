table = [
    (2, 1, 0), (2, 2, 0), (2, 1, 1), (2, 3, 0), (2, 2, 1), (2, 1, 2), (2, 4, 0), (2, 3, 1), (2, 2, 2), (2, 5, 0),
    (3, 1, 0), (3, 2, 0), (3, 1, 1), (3, 3, 0), (3, 2, 1), (3, 1, 2), (3, 4, 0), (3, 3, 1),
    (4, 1, 0), (4, 2, 0), (4, 1, 1), (4, 3, 0), (4, 2, 1), (4, 1, 2),
    (5, 1, 0), (5, 2, 0), (5, 1, 1), (5, 3, 0),
    (6, 1, 0), (6, 2, 0), (6, 1, 1),
    (7, 1, 0), (7, 2, 0),
    (8, 1, 0)
]
with open('write','w') as f:
    for row in table:
            pow2,pow3,pow5 = row
            pow3x5=3**pow3*5**pow5
            pow2=2**pow2
            print(pow2)
            f.write(f'pow2 == {pow2} && FFT3_enable && pow3x5 == {pow3x5} ? ')
            for i in range(pow2+1):
                    if i==0 or i==1:
                        continue
                    elif i-2!=0:
                        f.write(f'di_count3 > {((i-1)*pow3x5)-1} && di_count3 < {(pow3x5*i)} ? (di_count3-{((i-1)*pow3x5)})*{i-1} : ')
                    else:
                        f.write(f'di_count3 > {((i-1)*pow3x5)-1} && di_count3 < {(pow3x5*i)} ? (di_count3-{((i-1)*pow3x5)}) : ')
            f.write('0 :\n')

            