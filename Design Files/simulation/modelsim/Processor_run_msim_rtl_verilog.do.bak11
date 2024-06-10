transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/Controller.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/RegisterFile.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/DataMemory.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/ALU.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/ProgramCounter.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/PCadder4.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/InstructionMemory.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/ImmediateGenerator.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/DataExtract.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/Mux2.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/Mux3.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/AddressDecorder.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/DataPath.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/Adder32.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/hexdigit.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/try.sv}
vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/tb.sv}

vlog -sv -work work +incdir+D:/Academic/Sem\ 5/Digital\ System\ Design/200537F_DesignFiles {D:/Academic/Sem 5/Digital System Design/200537F_DesignFiles/tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
