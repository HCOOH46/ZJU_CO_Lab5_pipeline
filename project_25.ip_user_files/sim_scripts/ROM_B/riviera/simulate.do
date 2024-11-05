transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+ROM_B  -L dist_mem_gen_v8_0_14 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ROM_B xil_defaultlib.glbl

do {ROM_B.udo}

run 1000ns

endsim

quit -force
