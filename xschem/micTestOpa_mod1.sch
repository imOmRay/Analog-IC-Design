v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -330 -660 -330 -640 {lab=vnmic}
N -330 -660 -280 -660 {lab=vnmic}
N -220 -660 -190 -660 {lab=vn1}
N -130 -660 -110 -660 {lab=vn2}
N -330 -580 -330 -570 {lab=GND}
N -40 -780 -40 -660 {lab=vcm}
N -40 -780 -10 -780 {lab=vcm}
N 50 -790 50 -780 {lab=#net1}
N -40 -860 -10 -860 {lab=vcm}
N -40 -860 -40 -780 {lab=vcm}
N 50 -860 50 -790 {lab=#net1}
N 40 -860 50 -860 {lab=#net1}
N 40 -780 50 -780 {lab=#net1}
N 410 -560 410 -550 {lab=GND}
N 40 -490 40 -460 {lab=GND}
N -40 -590 80 -590 {lab=vcm}
N -40 -660 -40 -590 {lab=vcm}
N -50 -660 -40 -660 {lab=vcm}
N 40 -660 80 -660 {lab=#net2}
N 40 -660 40 -550 {lab=#net2}
N 290 -620 410 -620 {lab=#net1}
N 50 -780 320 -780 {lab=#net1}
N 320 -780 320 -620 {lab=#net1}
C {vsource.sym} -330 -610 0 0 {name=V1 value="0 AC 1 sin(0 1m 1e3 0 0 0)" savecurrent=false}
C {capa.sym} -160 -660 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -250 -660 3 0 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {res.sym} -80 -660 3 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -330 -580 0 0 {name=l1 lab=GND}
C {res.sym} 10 -780 3 0 {name=R3
value=300
footprint=1206
device=resistor
m=1}
C {capa.sym} 10 -860 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 40 -460 0 0 {name=l2 lab=GND}
C {capa.sym} 410 -590 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 410 -560 0 0 {name=l3 lab=GND}
C {gnd.sym} 180 -570 0 0 {name=l4 lab=GND}
C {vsource.sym} 40 -520 0 0 {name=V2 value=1.5 savecurrent=false}
C {lab_pin.sym} -330 -660 0 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_pin.sym} -210 -660 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} -120 -660 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} -40 -740 0 0 {name=p4 sig_type=std_logic lab=vcm
}
C {lab_pin.sym} 310 -780 2 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -870 -1500 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.control
	op
        WRITE ckt.raw
	SAVE ALL
	TRAN 1n 2u
	ac dec 100 0.1 10e6
	plot db(v(vout))
	plot phase(v(vout))
	SET APPENDWRITE
        write ckt.raw
        **
        MEAS AC gain_db MAX vdb(vout) FROM0.1 to 10e6
        LET vm3db= gain_db - 3.0
        print vm3db
	MEAS AC fzero WHEN vdb(vout)=vm3db RISE=1
        MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
	MEAS AC fmid WHEN vdb(vout)=gain_db
	*Phase Measurement
	LET phase_deg=cph(vout)*180/PI
	MEAS AC phase_zero FIND phase_deg AT=fzero
	MEAS AC phase_pole FIND phase_deg AT=fpole
	MEAS AC phase_mid FIND phase_deg AT=fmid
	**MEAS fzero fpole using phase
	LET phase zero_ph = phase_mid-45
	MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph 
.endc
"
}
C {opa_mod1.sym} 220 -440 0 0 {name=x1}
