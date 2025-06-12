v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -1190 -700 -1190 -680 {lab=vn1}
N -1190 -700 -1140 -700 {lab=vn1}
N -990 -700 -970 -700 {lab=vn2}
N -1190 -620 -1190 -610 {lab=GND}
N -900 -820 -900 -700 {lab=vcm}
N -900 -820 -870 -820 {lab=vcm}
N -820 -820 -810 -820 {lab=vout}
N -900 -700 -900 -630 {lab=vcm}
N -910 -700 -900 -700 {lab=vcm}
N -810 -820 -540 -820 {lab=vout}
N -1140 -700 -1050 -700 {lab=vn1}
N -510 -790 -510 -680 {lab=vout}
N -580 -790 -510 -790 {lab=vout}
N -580 -820 -580 -790 {lab=vout}
N -800 -780 -800 -750 {lab=GND}
N -540 -660 -510 -660 {lab=vout}
N -510 -680 -510 -660 {lab=vout}
N -750 -700 -750 -680 {lab=#net1}
N -790 -680 -750 -680 {lab=#net1}
N -800 -680 -790 -680 {lab=#net1}
N -800 -690 -800 -680 {lab=#net1}
N -900 -630 -750 -630 {lab=vcm}
C {vsource.sym} -1190 -650 0 0 {name=V1 value="0 AC 1 sin(0 1m 1e3 0 0 0)" savecurrent=false}
C {capa.sym} -1020 -700 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -940 -700 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -1190 -620 0 0 {name=l1 lab=GND}
C {res.sym} -850 -820 3 0 {name=R3
value=5k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} -1070 -700 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} -980 -700 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} -900 -780 0 0 {name=p4 sig_type=std_logic lab=vcm
}
C {lab_pin.sym} -550 -820 2 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -1730 -1540 0 0 {name=COMMANDS
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
C {gnd.sym} -800 -780 2 0 {name=l2 lab=GND}
C {vsource.sym} -800 -720 2 0 {name=V2 value=1.5 savecurrent=false}
C {opa_mod1.sym} -610 -480 0 0 {name=x1}
C {gnd.sym} -650 -610 0 0 {name=l3 lab=GND}
C {gnd.sym} -800 -780 2 0 {name=l4 lab=GND}
C {gnd.sym} -800 -780 2 0 {name=l5 lab=GND}
