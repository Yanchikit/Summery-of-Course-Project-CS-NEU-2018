transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/MAREG.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/IREG.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/COUNTER.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/ALU.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/DREG.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/CTRL.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/CLOCK.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/PC.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/RAM.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/Sixteen_Bit_CPU.vhd}
vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/dbus.vhd}

vcom -93 -work work {F:/Code/Quartus/Sixteen_Bit/TB/ms_dbus.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  ms_dbus

add wave *
view structure
view signals
run -all
