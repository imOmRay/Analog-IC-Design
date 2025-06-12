v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -120 -50 -120 -30 {lab=vnmic}
N -120 -50 -70 -50 {lab=vnmic}
N -10 -50 20 -50 {lab=vn1}
N 80 -50 100 -50 {lab=vn2}
N -120 30 -120 40 {lab=GND}
N 170 -170 170 -50 {lab=#net1}
N 160 -50 220 -50 {lab=#net1}
N 170 -170 200 -170 {lab=#net1}
N 260 -170 260 -100 {lab=vout}
N 260 -180 260 -170 {lab=vout}
N 170 -250 200 -250 {lab=#net1}
N 170 -250 170 -170 {lab=#net1}
N 200 -90 220 -90 {lab=vcm}
N 200 -90 200 30 {lab=vcm}
N 260 -40 260 -10 {lab=GND}
N 260 -250 260 -180 {lab=vout}
N 250 -250 260 -250 {lab=vout}
N 250 -170 260 -170 {lab=vout}
N 340 -130 340 -10 {lab=vout}
N 260 -130 340 -130 {lab=vout}
N 340 50 340 60 {lab=GND}
N 260 -10 260 -0 {lab=GND}
N 200 90 200 120 {lab=GND}
C {vsource.sym} -120 0 0 0 {name=V1 value="0 AC 1 sin(0 1m 1e3 0 0 0)" savecurrent=false}
C {capa.sym} 50 -50 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -40 -50 3 0 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {res.sym} 130 -50 3 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -120 30 0 0 {name=l1 lab=GND}
C {vcvs.sym} 260 -70 0 0 {name=E1 value=1000}
C {res.sym} 220 -170 3 0 {name=R3
value=300
footprint=1206
device=resistor
m=1}
C {capa.sym} 220 -250 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 200 120 0 0 {name=l2 lab=GND}
C {capa.sym} 340 20 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 340 50 0 0 {name=l3 lab=GND}
C {gnd.sym} 260 0 0 0 {name=l4 lab=GND}
C {vsource.sym} 200 60 0 0 {name=V2 value=1.5 savecurrent=false}
C {lab_pin.sym} -120 -50 0 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_pin.sym} 0 -50 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} 90 -50 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} 200 -10 0 0 {name=p4 sig_type=std_logic lab=vcm
}
C {lab_pin.sym} 310 -130 1 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -660 -890 0 0 {name=COMMANDS
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
