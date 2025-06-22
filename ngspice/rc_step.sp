TITLE : RC Step input testbench

.PARAM vdd_var=1

**Netlist
R1	vin	vout	1k
C1	vout	GND	1p

**Source
Vsin	vin	GND	0 PULSE(0 vdd_var 0.5n 1p 1p 1n 2n)

**Simulation
.OP
.TRAN 10p 40n

.GLOBAL GND
.END
