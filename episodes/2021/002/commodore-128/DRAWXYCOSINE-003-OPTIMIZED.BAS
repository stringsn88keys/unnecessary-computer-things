rem 36.28s runtime on WinVICE emulator NTSC 128 mod

1 ti$="000000"
11 scnclr
12 graphic 1,1

1000 rf=atn(1)/45 : rem radian factor
1010 xp=320 : rem x pixels
1020 xs=xp/640 : rem x scale (x scaled increments, actually)
1025 rx=rf/xs : rem radian x scale
1030 yp=200 : rem y pixels
1040 xo=xp/2 : rem x offset
1050 yo=yp/2 : rem y offset
1060 ys=-100 : rem y scale
1070 draw 1,0,yo to xp-1,yo
1080 draw 1,xo,0 to xo,yp-1
1090 for xi=0 to xp-1 step xs : rem plot same # pts as competitor
1100 yi=ys*cos((xi-xo)*rx)+yo
1120 draw 1,xi,yi
1130 next
9000 tm=ti/60
9010 slow
9020 sleep 5
9030 graphic 0
9040 print tm
9998 end