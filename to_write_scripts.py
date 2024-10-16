file_format = "your_file_format"
numbers = [4,8,9,12,15,16,24,25,27,32,36,45,48,60,64,72,75,81,96,108,120,128,135,144,180,192,216,225,240,243,256,288,300,324,360,384,432,480,540,576,600,648,720,768,864,900,960,972,1080,1152,1200]

for number in numbers:
    filename = f"Twiddle{number}.v"
    command = f"analyze -format $file_format {filename}"
    print(command)
    # Execute the command here
    