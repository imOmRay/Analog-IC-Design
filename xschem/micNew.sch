v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -710 -620 -710 -600 {lab=vn1}
N -710 -620 -660 -620 {lab=vn1}
N -510 -620 -490 -620 {lab=vn2}
N -710 -540 -710 -530 {lab=GND}
N -420 -740 -420 -620 {lab=vcm}
N -420 -740 -390 -740 {lab=vcm}
N -340 -740 -330 -740 {lab=#net1}
N -420 -620 -420 -550 {lab=vcm}
N -430 -620 -420 -620 {lab=vcm}
N -330 -740 -60 -740 {lab=#net1}
N -660 -620 -570 -620 {lab=vn1}
N -170 -620 -140 -620 {lab=#net2}
N -140 -620 -140 -600 {lab=#net2}
N -270 -620 -270 -600 {lab=#net3}
N -270 -620 -230 -620 {lab=#net3}
N -140 -620 -90 -620 {lab=#net2}
N -90 -620 -90 -590 {lab=#net2}
N -90 -590 -70 -590 {lab=#net2}
N -90 -550 -70 -550 {lab=GND}
N -90 -550 -90 -530 {lab=GND}
N -140 -530 -90 -530 {lab=GND}
N -140 -540 -140 -530 {lab=GND}
N -270 -540 -270 -530 {lab=GND}
N -270 -530 -140 -530 {lab=GND}
N -30 -710 -30 -600 {lab=#net1}
N -340 -420 -340 -390 {lab=GND}
N -340 -590 -310 -590 {lab=#net4}
N -340 -590 -340 -480 {lab=#net4}
N -420 -550 -310 -550 {lab=vcm}
N -140 -530 -140 -510 {lab=GND}
N -60 -740 -30 -740 {lab=#net1}
N -30 -740 -30 -710 {lab=#net1}
N -30 -740 -0 -740 {lab=#net1}
C {vsource.sym} -710 -570 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {capa.sym} -540 -620 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -460 -620 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -710 -540 0 0 {name=l1 lab=GND}
C {res.sym} -370 -740 3 0 {name=R3
value=5k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} -590 -620 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} -500 -620 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} -420 -700 0 0 {name=p4 sig_type=std_logic lab=vcm
}
C {lab_pin.sym} 0 -740 2 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -1250 -1460 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.control
OP
save all
write micTest.raw
set appendwrite
AC DEC 100 1 10e6
write micTest.raw
**
 meas ac gain_db MAX vdb(vout) FROM=0.1 TO=10e6
  LET f3db = gain_db - 3.0
  print f3db
  plot vdb(vout)
  MEAS AC fzero WHEN vdb(vout)=f3db RISE=1
  MEAS AC fpole WHEN vdb(vout)=f3db FALL=1
**  MEAS AC fmid WHEN vdb(vout)=gain_db
**Phase Measurement
  LET phase_deg = cph(vout)*180/PI
  MEAS AC phase_zero FIND phase_deg AT=fzero
  MEAS AC phase_pole FIND phase_deg AT=fpole
**  MEAS AC phase_mid FIND phase_deg AT=fmid
**MEAS fzero fpole using
  LET phase_zero_ph = phase_mid-45
  **MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph
  **tran 1u 5m
.endc
.end
"
}
C {vcvs.sym} -30 -570 0 0 {name=E1 value=1}
C {vcvs.sym} -270 -570 0 0 {name=E2 value=1000}
C {res.sym} -200 -620 3 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} -140 -570 0 0 {name=C2
m=1
value=160n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -30 -540 0 0 {name=l3 lab=GND}
C {gnd.sym} -340 -390 0 0 {name=l2 lab=GND}
C {vsource.sym} -340 -450 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} -140 -510 0 0 {name=l4 lab=GND}
