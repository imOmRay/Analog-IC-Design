Title:transient experiment:rise,fall,delat,period,etc.
**PARAMETERS
.PARAM vdd_var=3.3
** RC Network
R1	vin	vout	1k
C1	vout	GND	1p

**stimuli
Vsin	vin	GND	0 PULSE(0 vdd_var 1n 1p 1p 10n 20n)

** RISE/FALL 10-90%
.MEASURE TRAN risetime TRIG v(vout) VAL='0.1*vdd_var' RISE=1 TARG v(vout) VAL='0.9*vdd_var' RISE=1
.MEASURE TRAN falltime TRIG v(vout) VAL='0.9*vdd_var' FALL=1 TARG v(vout) VAL='0.1*vdd_var' FALL=1
** RISE/FALL 20-80%
.MEASURE TRAN risetime2 TRIG v(vout) VAL='0.2*vdd_var' RISE=1 TARG v(vout) VAL='0.8*vdd_var' RISE=1
.MEASURE TRAN falltime2 TRIG v(vout) VAL='0.8*vdd_var' FALL=1 TARG v(vout) VAL='0.2*vdd_var' FALL=1
**DELAY RISE FALL
.MEASURE TRAN tdrise TRIG v(vin) VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' RISE=1
.MEASURE TRAN tdfall TRIG v(viWn) VAL='0.5*vdd_var' FALL=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1
**PLUSE WIDTH/PERIOD
.MEASURE TRAN pWidth TRIG v(vout) VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1
.MEASURE TRAN period TRIG v(vout) VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL= '0.5*vdd_var'RISE=2


.CONTROL
 OP
 TRAN 10p 40n
 MEAS TRAN tri1090cs TRIG v(vout) VAL='0.1*vddvar' RISE=1 TARG v(vout) VAl='0.9*vdd_var' RISE=1
.ENDC

.GLOBAL GND
.END

