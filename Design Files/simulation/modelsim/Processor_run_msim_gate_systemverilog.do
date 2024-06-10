transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {Processor.svo}

vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/Processor\ Design/Design/Processor {D:/Academic/Sem 5/Digital System Design/Processor Design/Design/Processor/DataPath_tb.sv}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  DataPath_tb

add wave *
view structure
view signals
run -all
