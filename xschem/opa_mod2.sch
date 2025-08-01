v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -50 110 -50 {lab=#net1}
N 110 -50 110 -30 {lab=#net1}
N -20 -50 -20 -30 {lab=#net2}
N -20 -50 20 -50 {lab=#net2}
N 110 -50 160 -50 {lab=#net1}
N 160 -50 160 -20 {lab=#net1}
N 160 -20 180 -20 {lab=#net1}
N 160 20 180 20 {lab=GND}
N 160 20 160 40 {lab=GND}
N 110 40 160 40 {lab=GND}
N 110 30 110 40 {lab=GND}
N -20 30 -20 40 {lab=GND}
N -20 40 110 40 {lab=GND}
C {vcvs.sym} 220 0 0 0 {name=E1 value=3}
C {vcvs.sym} -20 0 0 0 {name=E2 value=3}
C {res.sym} 50 -50 3 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 110 0 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 110 40 0 0 {name=l1 lab=GND}
