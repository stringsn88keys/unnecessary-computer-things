REM on a TRS-80 in TRSDOS this would actually be named "COS/BAS" and in the video is accessed
REM from Drive 1 so "COS/BAS:1". If you save a file as "COS.BAS" the part after the dot is
REM invisible in directory listings because it's actually a "password"

10 CLS 0 : REM clear text 
20 CLS 1 : REM clear graphics
30 PI = ATN(1) * 4 : REM inverse tangent of 1 is 45 degrees * 4 is 180, or pi radians
40 RADFC=PI/180 : REM radians conversion factor
50 XPX=640 : REM x pixels across the screen
60 YPX=240 : REM y pixels down the screen
70 LINE(0,YPX/2-1)-(XPX-1,YPX/2-1) : REM X-axis
80 LINE(XPX/2-1,0)-(XPX/2-1,YPX-1) : REM Y-axis
90 FOR I = 0 TO XPX - 1 : REM I don't know why I went with "I" instead of X
100 Y = 100 * COS((I-320)*RADFC) * -1 + 120 : REM 100 * COS(-160 .. 160 degrees)
110 PSET(I,Y) : REM plot the point
120 NEXT

