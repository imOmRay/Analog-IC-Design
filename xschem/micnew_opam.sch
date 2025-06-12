v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -670 -80 -670 -60 {lab=vn1}
N -670 -80 -620 -80 {lab=vn1}
N -470 -80 -450 -80 {lab=vn2}
N -670 0 -670 10 {lab=GND}
N -380 -200 -380 -80 {lab=vcm}
N -380 -200 -350 -200 {lab=vcm}
N -390 -80 -380 -80 {lab=vcm}
N -620 -80 -530 -80 {lab=vn1}
N 10 -60 10 30 {lab=vout}
N -170 80 -170 90 {lab=GND}
N -380 -80 -380 60 {lab=vcm}
N -380 60 -270 60 {lab=vcm}
N -310 200 -310 210 {lab=GND}
N -310 -10 -310 140 {lab=#net1}
N -310 -10 -270 -10 {lab=#net1}
N -60 30 -40 30 {lab=vout}
N -40 30 -30 30 {lab=vout}
N -30 30 -20 30 {lab=vout}
N -20 30 -10 30 {lab=vout}
N -10 30 -0 30 {lab=vout}
N 0 30 10 30 {lab=vout}
N -300 -200 -290 -200 {lab=vout}
N -290 -200 -280 -200 {lab=vout}
N -280 -200 10 -200 {lab=vout}
N 10 -200 10 -60 {lab=vout}
N 10 30 70 30 {lab=vout}
C {vsource.sym} -670 -30 0 0 {name=V1 value="0 AC 1 sin(0 1m 1e3 0 0 0)" savecurrent=false}
C {capa.sym} -500 -80 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -420 -80 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -670 0 0 0 {name=l1 lab=GND}
C {res.sym} -330 -200 3 0 {name=R3
value=5k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} -550 -80 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} -460 -80 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} -380 -160 0 0 {name=p4 sig_type=std_logic lab=vcm
}
C {lab_pin.sym} 60 30 2 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -1210 -920 0 0 {name=COMMANDS
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
C {opa_mod1.sym} -130 210 0 0 {name=x1}
C {gnd.sym} -170 80 0 0 {name=l3 lab=GND}
C {vsource.sym} -310 170 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} -310 200 0 0 {name=l2 lab=GND}
