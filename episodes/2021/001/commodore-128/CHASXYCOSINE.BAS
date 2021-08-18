rem Code is all in lowercase so that you can copy from Windows directly into the VICE emulator.
rem Otherwise, you'll get the uppercase/graphics characters on the Commodore VM and those
rem aren't understood by the BASIC interpreter (except for statement shorthand)

5 fast : rem go at 2mhz instead of 1! 80 column display still works, 40 column blanks.
10 gosub 10000 : rem load the ml read/write routines for the 8564
11 scnclr
20 y=12 : rem x-axis
30 for x=0 to 79 
40 c=209 : rem the filled circle character in petscii
50 gosub 11000 : rem plot x,y,c subroutine
60 next
70 x=39 : rem y-axis 
80 for y=0 to 24
90 gosub 11000
100 next

1000 radfc=atn(1)/45 : rem or [pi symbol] / 180
1010 xpx=80 : rem only 80 columns of text 
1020 xscle=xpx/640 : rem scale to the trs-80 graph
1030 ypx=25 : rem only 25 columns down
1040 xofst=39 : rem offset x-axis
1050 yofst=12 : rem offset y-axis
1060 yscle=10 : rem cosine amplitude
1070 for xi=0 to xpx-1 step xscle : rem plot same # pts as competitor
1080 yi=yscle*cos((xi-xofst)*radfc/xscle)*-1+yofst 
1090 x=int(xi):y=int(yi) : rem gotta truncate so memory locations aren't off
1110 gosub 11000 : rem plot x,y,c
1120 next
9997 slow : rem go back to normal
9998 end
9999 rem load routines into ml, see p312 programmer's reference guide for below code
10000 vi=dec("1800"):vo=dec("180c"):bank15
10010 read a$
10020 do until left$(a$,3)="end"
10030 : poke vi+i,dec(a$)
10040 : i = i + 1
10050 : read a$
10060 : loop
10070 : data 8e,00,d6,2c,00,d6,10,fb,ad,01,d6,60 : rem read routine (not used for this version)
10080 : data 8e,00,d6,2c,00,d6,10,fb,8d,01,d6,60,end : rem write routine
10998 return
10999 rem plot x,y,c
11000 addr=y*80+x
11010 sys vo, addr/256,18
11020 sys vo, addrand255,19
11030 sys vo, c, 31
11040 return


rem read routine disassembly
rem 01800 8e 00 d6  stx $d600
rem 01803 2c 00 d6  bit $d600
rem 01806 10 fb     bpl $1803
rem 01808 ad 01 d6  lda $d601
rem 0180b 60        rts

rem write routine disassembly
rem 0180c 8e 00 d6  stx $d600
rem 0180f 2c 00 d6  bit $d600
rem 01812 10 fb     bpl $180f
rem 01814 8d 01 d6  sta $d601
rem 01817 60        rts