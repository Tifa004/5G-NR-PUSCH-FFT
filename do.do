vlib work
vlog -work work -vopt -sv -stats=none {C:/Users/Mostafa/Desktop/Digital/ST FFT/tb.sv}
vsim  work.tb -voptargs=+acc
run -all
mem save -o out_r.txt -f mti -noaddress -data decimal -addr hex -wordsperline 1 /tb/output_r
mem save -o out_i.txt -f mti -noaddress -data decimal -addr hex -wordsperline 1 /tb/output_i
exit -force