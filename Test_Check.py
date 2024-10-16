import os

for subdir, dirs, files in os.walk('Test'):
    if 'Fail.txt' in files:
        print(os.path.join(subdir, 'Fail.txt'))
    

