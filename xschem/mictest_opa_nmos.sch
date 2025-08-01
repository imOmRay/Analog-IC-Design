v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 -330 -620 470 -220 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10e-6
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=""
color=""
dataset=-1
unitx=1
logx=0
logy=0
}
N -440 15 -440 35 {lab=vnmic}
N -440 15 -390 15 {lab=vnmic}
N -330 15 -300 15 {lab=vn1}
N -240 15 -220 15 {lab=vn2}
N -440 95 -440 105 {lab=GND}
N -155 -85 -125 -85 {lab=virt}
N -65 -95 -65 -85 {lab=vout}
N -155 -165 -125 -165 {lab=virt}
N -155 -165 -155 -85 {lab=virt}
N -65 -165 -65 -95 {lab=vout}
N -75 -165 -65 -165 {lab=vout}
N -75 -85 -65 -85 {lab=vout}
N 200 135 200 145 {lab=GND}
N -75 185 -75 215 {lab=GND}
N 200 45 200 75 {lab=vout}
N 175 45 200 45 {lab=vout}
N -65 -85 195 -85 {lab=vout}
N 195 -85 195 45 {lab=vout}
N 15 -65 15 -15 {lab=AVDD}
N 15 -65 265 -65 {lab=AVDD}
N 265 -65 265 -60 {lab=AVDD}
N 265 -0 265 10 {lab=GND}
N 45 115 45 155 {lab=GND}
N 55 -45 85 -45 {lab=ib}
N 55 -45 55 -5 {lab=ib}
N 145 -45 155 -45 {lab=AVDD}
N 155 -65 155 -45 {lab=AVDD}
N -75 105 -75 125 {lab=#net1}
N -75 105 -35 105 {lab=#net1}
N -160 15 -35 15 {lab=virt}
N -155 -85 -155 15 {lab=virt}
C {vsource.sym} -440 65 0 0 {name=V1 value="0 AC 1 sin(0 100m 1e3 0 0 0)" savecurrent=false}
C {capa.sym} -270 15 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -360 15 3 0 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {res.sym} -190 15 3 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -440 95 0 0 {name=l1 lab=GND}
C {res.sym} -105 -85 3 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} -105 -165 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -75 215 0 0 {name=l2 lab=GND}
C {capa.sym} 200 105 0 0 {name=C3
m=1
value=0.1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 200 135 0 0 {name=l3 lab=GND}
C {vsource.sym} -75 155 0 0 {name=V2 value=1.5 savecurrent=false}
C {lab_pin.sym} -440 15 0 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_pin.sym} -320 15 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} -230 15 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} 200 45 2 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -950 -480 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="

.CONTROL
 SAVE ALL
 OP
 WRITE mictest_opa_nmos.raw
 SET APPENDWRITE
 AC DEC 100 1 10e6
 WRITE mictest_opa_nmos.raw
 **
 MEAS AC gain_db MAX vdb(vout) FROM=0.1 TO=10e6
 LET vm3db = gain_db - 3.0 
 print vm3db
 MEAS AC fzero WHEN vdb(vout)=vm3db RISE=1
 MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
 **MEAS AC fmid WHEN vdb(vout)=gain_db
 **Phase Measurement
 LET phase_deg = cph(vout)*180/PI
 MEAS AC phase_zero FIND phase_deg AT=fzero
 MEAS AC phase_pole FIND phase_deg AT=fpole
 **MEAS AC phase_mid FIND phase_deg AT=fmid
 **MEAS fzero fpole using phase
 **LET phase_zero_ph = phase_mid-45
 **MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph
 
**

 TRAN 1u 6m
 MEAS TRAN voutpp PP v(vout) FROM=1m TO=4m
 MEAS TRAN vinpp PP v(vout) FROM=1m TO=4m
 LET gaintran=voutpp/vinpp
 print gaintran
 FOURIER 1k v(vout)
 plot v(vout)
 plot (vnmic)


.ENDC
.end
"
}
C {opamp_nmos.sym} 5 -155 0 0 {name=x1}
C {vsource.sym} 265 -30 0 0 {name=Vcc value=1.8 savecurrent=false}
C {gnd.sym} 265 10 0 0 {name=l4 lab=GND}
C {gnd.sym} 45 155 0 0 {name=l5 lab=GND}
C {isource.sym} 115 -45 1 0 {name=I0 value=5u}
C {lab_wire.sym} -155 -45 0 0 {name=p4 sig_type=std_logic lab=virt}
C {lab_wire.sym} 240 -65 0 0 {name=p6 sig_type=std_logic lab=AVDD}
C {lab_wire.sym} 55 -20 0 0 {name=p7 sig_type=std_logic lab=ib}
C {devices/code.sym} -490 -470 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
