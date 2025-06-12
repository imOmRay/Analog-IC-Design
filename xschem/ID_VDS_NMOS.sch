v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -130 -30 -130 -20 {lab=vg}
N -130 -40 -130 -30 {lab=vg}
N -130 -50 -130 -40 {lab=vg}
N -130 -50 -120 -50 {lab=vg}
N -120 -50 -110 -50 {lab=vg}
N -110 -50 -100 -50 {lab=vg}
N -100 -50 -90 -50 {lab=vg}
N -90 -50 -80 -50 {lab=vg}
N -80 -50 -70 -50 {lab=vg}
N -70 -50 -60 -50 {lab=vg}
N -60 -50 -50 -50 {lab=vg}
N -50 -50 -30 -50 {lab=vg}
N -130 40 -130 50 {lab=GND}
N -130 50 -130 60 {lab=GND}
N -130 60 -130 70 {lab=GND}
N -130 70 -130 80 {lab=GND}
N -130 80 -110 80 {lab=GND}
N -110 80 -100 80 {lab=GND}
N -100 80 -90 80 {lab=GND}
N -90 80 -80 80 {lab=GND}
N -80 80 -70 80 {lab=GND}
N -70 80 -60 80 {lab=GND}
N -60 80 -50 80 {lab=GND}
N -50 80 -40 80 {lab=GND}
N -40 80 -30 80 {lab=GND}
N -30 80 -20 80 {lab=GND}
N -20 80 -10 80 {lab=GND}
N -10 80 -0 80 {lab=GND}
N -0 80 10 80 {lab=GND}
N 10 80 40 80 {lab=GND}
N 40 80 50 80 {lab=GND}
N 50 80 60 80 {lab=GND}
N 60 80 80 80 {lab=GND}
N 80 80 90 80 {lab=GND}
N 90 80 100 80 {lab=GND}
N 100 80 110 80 {lab=GND}
N 110 80 120 80 {lab=GND}
N 120 80 130 80 {lab=GND}
N 130 70 130 80 {lab=GND}
N 130 60 130 70 {lab=GND}
N 130 50 130 60 {lab=GND}
N 130 40 130 50 {lab=GND}
N 130 -40 130 -20 {lab=vd}
N 130 -50 130 -40 {lab=vd}
N 130 -70 130 -50 {lab=vd}
N 130 -80 130 -70 {lab=vd}
N 130 -90 130 -80 {lab=vd}
N 130 -100 130 -90 {lab=vd}
N 110 -100 130 -100 {lab=vd}
N 100 -100 110 -100 {lab=vd}
N 90 -100 100 -100 {lab=vd}
N 80 -100 90 -100 {lab=vd}
N 70 -100 80 -100 {lab=vd}
N 60 -100 70 -100 {lab=vd}
N 50 -100 60 -100 {lab=vd}
N 40 -100 50 -100 {lab=vd}
N 30 -100 40 -100 {lab=vd}
N 20 -100 30 -100 {lab=vd}
N 10 -100 20 -100 {lab=vd}
N 10 -100 10 -90 {lab=vd}
N 10 -90 10 -80 {lab=vd}
N 10 -20 10 -10 {lab=GND}
N 10 -10 10 -0 {lab=GND}
N 10 0 10 10 {lab=GND}
N 10 10 10 20 {lab=GND}
N 10 20 10 30 {lab=GND}
N 10 30 10 40 {lab=GND}
N 10 40 10 50 {lab=GND}
N 10 50 10 60 {lab=GND}
N 10 60 10 70 {lab=GND}
N 10 70 10 80 {lab=GND}
N 10 -50 20 -50 {lab=GND}
N 20 -50 20 -40 {lab=GND}
N 20 -40 20 -30 {lab=GND}
N 20 -30 20 -20 {lab=GND}
N 10 -20 20 -20 {lab=GND}
N 10 80 10 90 {lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -10 -50 0 0 {name=M1
L=0.15
W=1
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -130 10 0 0 {name=VGS value=1 }
C {vsource.sym} 130 10 0 0 {name=VDS value=0}
C {lab_wire.sym} -90 -50 0 0 {name=p1 sig_type=std_logic lab=vg}
C {lab_wire.sym} 80 -100 0 0 {name=p2 sig_type=std_logic lab=vd}
C {gnd.sym} 10 90 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} 290 -130 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands

.CONTROL
  OP
  DC VGS 0.4 1.0 0.1 VDS 0 1.8 0.1
  
  .ENDC
"}
C {devices/code.sym} -340 -170 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
