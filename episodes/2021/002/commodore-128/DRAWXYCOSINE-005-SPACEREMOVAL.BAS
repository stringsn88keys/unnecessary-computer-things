rem 35.1s after space removal

1 ti$="000000"
11 scnclr
12 graphic 1,1

1000 rf=atn(1)/45 
1010 xp=320 
1020 xs=xp/640 
1025 rx=rf/xs 
1030 yp=200 
1040 xo=xp/2 
1050 yo=yp/2 
1060 ys=-100 
1070 draw1,0,yotoxp-1,yo
1080 draw1,xo,0toxo,yp-1
1090 forxi=0toxp-1stepxs
1100 yi=ys*cos((xi-xo)*rx)+yo
1120 draw1,xi,yi
1130 next
9000 tm=ti/60
9010 slow
9020 sleep5
9030 graphic0
9040 print tm
9998 end