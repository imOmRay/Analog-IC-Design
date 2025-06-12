v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -180 0 -180 10 {lab=GND}
N -180 10 -180 20 {lab=GND}
N -180 20 -180 30 {lab=GND}
N -180 30 -180 40 {lab=GND}
N -180 40 -160 40 {lab=GND}
N -160 40 -150 40 {lab=GND}
N -150 40 -140 40 {lab=GND}
N -140 40 -130 40 {lab=GND}
N -130 40 -120 40 {lab=GND}
N -120 40 -110 40 {lab=GND}
N -110 40 -100 40 {lab=GND}
N -100 40 -90 40 {lab=GND}
N -90 40 -80 40 {lab=GND}
N -80 40 -70 40 {lab=GND}
N -70 40 -60 40 {lab=GND}
N -60 40 -50 40 {lab=GND}
N -180 -100 -180 -60 {lab=vgds}
N -180 -110 -180 -100 {lab=vgds}
N -180 -120 -180 -110 {lab=vgds}
N -180 -130 -180 -120 {lab=vgds}
N -180 -140 -180 -130 {lab=vgds}
N -180 -140 -170 -140 {lab=vgds}
N -170 -140 -160 -140 {lab=vgds}
N -160 -140 -150 -140 {lab=vgds}
N -150 -140 -140 -140 {lab=vgds}
N -140 -140 -130 -140 {lab=vgds}
N -130 -140 -120 -140 {lab=vgds}
N -120 -140 -110 -140 {lab=vgds}
N -110 -140 -100 -140 {lab=vgds}
N -100 -140 -90 -140 {lab=vgds}
N -90 -140 -80 -140 {lab=vgds}
N -80 -140 -70 -140 {lab=vgds}
N -70 -140 -60 -140 {lab=vgds}
N -60 -140 -50 -140 {lab=vgds}
N -50 -140 -40 -140 {lab=vgds}
N -40 -140 -40 -130 {lab=vgds}
N -40 -130 -40 -120 {lab=vgds}
N -90 -90 -80 -90 {lab=vgds}
N -100 -90 -90 -90 {lab=vgds}
N -100 -100 -100 -90 {lab=vgds}
N -100 -110 -100 -100 {lab=vgds}
N -100 -120 -100 -110 {lab=vgds}
N -100 -130 -100 -120 {lab=vgds}
N -100 -140 -100 -130 {lab=vgds}
N -40 -60 -40 -40 {lab=#net1}
N -40 20 -40 40 {lab=GND}
N -50 40 -40 40 {lab=GND}
N -40 -90 40 -90 {lab=GND}
N 40 -90 40 40 {lab=GND}
N -40 40 40 40 {lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -60 -90 0 0 {name=M1
L=1
W=4
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -180 -30 0 0 {name=Vds value=1 }
C {vsource.sym} -40 -10 0 0 {name=Vsb value=0}
C {gnd.sym} -70 40 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -140 -140 0 0 {name=p1 sig_type=std_logic lab=vgds}
C {devices/code.sym} -380 -170 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 110 -190 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands

.CONTROL
  OP
  DC Vds 0 1.8 0.05 TEMP -40 120 20 
  **Vsb 0 0.5 0.1 
  PLOT abs(vds#branch)
  PLOT sqrt(2*abs(vds#branch))
  PLOT log(abs(vds#branch))
 
  .ENDC
"}
