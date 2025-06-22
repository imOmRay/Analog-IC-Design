Ttile:Simple Highpass filter
** High pass element
Cbyp   vin   n1   4.7u
Rhp    n1    vcm  5k

**stimuli
Vsin   vin   0    0 AC 1
Vscm   vcm   0    0.5

.OP

.CONTROL
  save all
  AC DEC 100 1 10e6
  MEAS AC gain MAX vmag(n1) FROM=1 TO=10e6
  LET gain_db=20*log10(gain)
  LET f3db = gain/sqrt(2)
  MEAS AC fzero WHEN vmag(n1)=f3db RISE=1

.ENDiC

.END


   
