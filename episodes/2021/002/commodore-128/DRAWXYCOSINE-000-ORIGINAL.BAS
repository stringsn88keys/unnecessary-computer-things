rem 48.75s

1 ti$="000000"
11 scnclr
12 graphic 1,1

1000 radfc=atn(1)/45
1010 xpx=320
1020 xscle=xpx/640
1030 ypx=200
1040 xofst=xpx/2
1050 yofst=ypx/2
1060 yscle=100
1070 draw 1,0,yofst to xpx-1,yofst
1080 draw 1,xofst,0 to xofst,ypx-1
1090 for xi=0 to xpx-1 step xscle : rem plot same # pts as competitor
1100 yi=yscle*cos((xi-xofst)*radfc/xsle)*-1+yost
1110 x=int(xi):y=int(yi) : rem gotta truncate so memory locations aren't off
1120 draw 1,x,y
1130 next
9000 tm=ti/60
9010 sleep 5
9020 graphic 0
9030 print tm
9998 end