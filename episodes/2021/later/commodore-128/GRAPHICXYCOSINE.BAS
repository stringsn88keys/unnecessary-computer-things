rem Code is all in lowercase so that you can copy from Windows directly into the VICE emulator.
rem Otherwise, you'll get the uppercase/graphics characters on the Commodore VM and those
rem aren't understood by the BASIC interpreter (except for statement shorthand)

rem 5 fast : rem go at 2mhz instead of 1! 80 column display still works, 40 column blanks.

10 graphic 1,1
20 radfc=atn(1)/45 : rem or [pi symbol] / 180
30 xpx=320 : rem only 80 columns of text 
40 xscle=xpx/640 : rem scale to the trs-80 graph
50 ypx=200 : rem only 25 columns down
60 xofst=int(xpx/2) : rem offset x-axis
70 yofst=int(ypx/2) : rem offset y-axis
80 yscle=10/12*ypx/2 : rem cosine amplitude
90 draw 1,0,yofst to xpx-1,yofst
100 draw 1,xofst,0 to xoft,ypx-1

1070 for xi=0 to xpx-1 step xscle : rem plot same # pts as competitor
1080 yi=yscle*cos((xi-xofst)*radfc/xscle)*-1+yofst 
1090 x=int(xi):y=int(yi) : rem gotta truncate so memory locations aren't off
1110 draw 1,x,y
1120 next
9999 end
