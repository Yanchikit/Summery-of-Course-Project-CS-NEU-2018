onerror {exit -code 1}
vlib work
vlog -work work Sixteen_Bit_CPU.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Sixteen_Bit_CPU_vlg_vec_tst -voptargs="+acc"
vcd file -direction Sixteen_Bit_CPU.msim.vcd
vcd add -internal Sixteen_Bit_CPU_vlg_vec_tst/*
vcd add -internal Sixteen_Bit_CPU_vlg_vec_tst/i1/*
run -all
quit -f
