REM on a TRS-80 in TRSDOS this would actually be named "COS/BAS" and in the video is accessed
REM from Drive 1 so "COS/BAS:1". If you save a file as "COS.BAS" the part after the dot is
REM invisible in directory listings because it's actually a "password"

10 GOSUB 1010
20 STTIM=TIME
30 CLS 

100 radfc=atn(1)/45 : rem or [pi symbol] / 180
110 xpx=128 : rem only 80 columns of text 
120 xscle=xpx/640 : rem scale to the trs-80 graph
130 ypx=48 : rem only 25 columns down
140 xofst=63 : rem offset x-axis
150 yofst=24 : rem offset y-axis
160 yscle=20 : rem cosine amplitude

200 for x=0 to xpx-1
210 set(x,yofst)
220 next
250 for y=0 to ypx-1
260 set(xofst, y)
270 next

300 for x=0 to xpx-1 step xscle : rem plot same # pts as competitor
310 y=yscle*cos((x-xofst)*radfc/xscle)*-1+yofst 
320 rem x=int(xi):y=int(yi) : rem gotta truncate so memory locations aren't off
330 set(x,y)
340 next

350 GOSUB 1010
360 ? TIME - STTIM; " SECONDS"

999 END
1010 TSNAP$=TIME$
1020 TIME=VAL(MID$(TSNAP$,10,2))*3600
1030 TIME=TIME+VAL(MID$(TSNAP$,13,2))*60
1040 TIME=TIME+VAL(RIGHT$(TSNAP$,2))
1050 RETURN