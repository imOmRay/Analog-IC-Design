v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1020 -360 1090 -360 {lab=vip}
N 1500 -360 1570 -360 {lab=vim}
N 1130 -330 1130 -280 {lab=#net1}
N 1130 -280 1460 -280 {lab=#net1}
N 1460 -330 1460 -280 {lab=#net1}
N 1130 -520 1130 -390 {lab=vom}
N 1460 -520 1460 -390 {lab=vout}
N 860 -690 1560 -690 {lab=AVDD}
N 1560 -690 1560 -550 {lab=AVDD}
N 1460 -690 1460 -580 {lab=AVDD}
N 1170 -550 1420 -550 {lab=vom}
N 1130 -690 1130 -580 {lab=AVDD}
N 1030 -550 1130 -550 {lab=AVDD}
N 1030 -690 1030 -550 {lab=AVDD}
N 1460 -450 1590 -450 {lab=vout}
N 1280 -550 1280 -540 {lab=vom}
N 1280 -540 1280 -530 {lab=vom}
N 1280 -530 1280 -520 {lab=vom}
N 1280 -520 1280 -510 {lab=vom}
N 1280 -510 1280 -500 {lab=vom}
N 1280 -500 1280 -490 {lab=vom}
N 1280 -490 1280 -480 {lab=vom}
N 1280 -480 1280 -470 {lab=vom}
N 1280 -470 1280 -460 {lab=vom}
N 1270 -460 1280 -460 {lab=vom}
N 1260 -460 1270 -460 {lab=vom}
N 1250 -460 1260 -460 {lab=vom}
N 1240 -460 1250 -460 {lab=vom}
N 1130 -460 1240 -460 {lab=vom}
N 1130 -360 1190 -360 {lab=#net1}
N 1410 -360 1460 -360 {lab=#net1}
N 1190 -360 1200 -360 {lab=#net1}
N 1200 -360 1210 -360 {lab=#net1}
N 1210 -360 1220 -360 {lab=#net1}
N 1220 -360 1230 -360 {lab=#net1}
N 1230 -360 1240 -360 {lab=#net1}
N 1240 -360 1250 -360 {lab=#net1}
N 1250 -360 1260 -360 {lab=#net1}
N 1260 -360 1270 -360 {lab=#net1}
N 1270 -360 1280 -360 {lab=#net1}
N 1280 -360 1290 -360 {lab=#net1}
N 1290 -360 1300 -360 {lab=#net1}
N 1300 -360 1310 -360 {lab=#net1}
N 1310 -360 1320 -360 {lab=#net1}
N 1320 -360 1330 -360 {lab=#net1}
N 1330 -360 1340 -360 {lab=#net1}
N 1340 -360 1350 -360 {lab=#net1}
N 1350 -360 1360 -360 {lab=#net1}
N 1360 -360 1370 -360 {lab=#net1}
N 1370 -360 1410 -360 {lab=#net1}
N 1300 -360 1300 -280 {lab=#net1}
N 890 -160 1260 -160 {lab=ib5u}
N 730 -250 850 -250 {lab=ib5u}
N 850 -250 850 -190 {lab=ib5u}
N 850 -250 990 -250 {lab=ib5u}
N 990 -250 990 -160 {lab=ib5u}
N 740 -100 850 -100 {lab=AVSS}
N 850 -130 850 -100 {lab=AVSS}
N 800 -160 850 -160 {lab=AVSS}
N 770 -160 800 -160 {lab=AVSS}
N 770 -160 770 -100 {lab=AVSS}
N 850 -100 1390 -100 {lab=AVSS}
N 1390 -160 1390 -100 {lab=AVSS}
N 1300 -160 1390 -160 {lab=AVSS}
N 1300 -130 1300 -100 {lab=AVSS}
N 1300 -280 1300 -190 {lab=#net1}
N 1460 -550 1560 -550 {lab=AVDD}
C {iopin.sym} 1020 -360 2 0 {name=p3 lab=vip}
C {iopin.sym} 1570 -360 0 0 {name=p4 lab=vim}
C {iopin.sym} 1590 -450 0 0 {name=p7 lab=vout}
C {iopin.sym} 860 -690 2 0 {name=p1 lab=AVDD
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1110 -360 0 0 {name=Mip
L=2
W=5
nf=1 mult=4
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1480 -360 0 1 {name=Mim
L=2
W=5
nf=1 mult=4
model=nfet_01v8_lvt
spiceprefix=X
}
C {lab_wire.sym} 1130 -430 0 0 {name=p5 sig_type=std_logic lab=vom}
C {iopin.sym} 730 -250 2 0 {name=p8 lab=ib5u}
C {iopin.sym} 740 -100 2 0 {name=p2 lab=AVSS
}
C {sky130_fd_pr/nfet_01v8.sym} 870 -160 0 1 {name=M1
L=1
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1280 -160 0 0 {name=Mtail
L=1
W=5  
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1150 -550 0 1 {name=Mpcmp
L=2
W=5
nf=1 mult=2
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1440 -550 0 0 {name=Mpcmm
L=2
W=5
nf=1 mult=2
model=pfet_01v8_lvt
spiceprefix=X
}
