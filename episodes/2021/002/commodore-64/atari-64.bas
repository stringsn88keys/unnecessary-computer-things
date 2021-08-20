rem source code from 8-Bit Show And Tell video:
rem https://www.youtube.com/watch?v=mxi5_VhxkJQ&t=1079s
rem it's pastable in VICE, but not into Altirra (running atari64, that is)
10 x=49152
20 read a:if a>=0 then poke x,a:x=x+1:goto 20
30 data 162,0,160,0,169,0
40 data 157,0,4,254,0,4
50 data 208,251,169,32,157,0
60 data 4,232,208,238,200,192
70 data 32,208,233,96,-1
99 rem benchmarking
100 ti$="000000":sys49152:printti/60