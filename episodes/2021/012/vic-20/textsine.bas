REM vic-20 programmers reference guide, Appendix E
REM 7680 + y * 22 + x is the screen character code where x,y is (0..21, 0..22)
REM 38400 + y * 22 + x is the screen color color memory map where [black,white,red,cyan,purple,green,blue,yellow]

10 def fn ypspk(y) = 7680 + y*22
20 def fn ycopk(y) = 38400 + y*22
30 poke 36879,8:print chr$(147):rem black border + black back, 147 is Clr char
40 radfc=atn(1)/45
50 xpx=22
51 xscle=xpx/640
60 ypx=23
61 xofst=10
62 yofst=12
63 yscle=10
64 c=5
70 y=yofst
80 for x=0 to xpx-1
90 gosub 1000
100 next
110 x=xofst
120 for y=0 to ypx-1
130 gosub 1000
140 next
150 c=1
160 for xi=0 to xpx-1 step xscle
170 yi=yscle*cos((xi-xofst)*radfc/xscle)*-1+yofst
175 x=int(xi):y=int(yi)
180 gosub 1000
190 next
999 end
1000 poke (fn ycopk(y))+x,c
1010 poke (fn ypspk(y))+x,81
1020 return
