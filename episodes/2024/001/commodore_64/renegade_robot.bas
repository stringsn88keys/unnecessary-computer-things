10 for x=54272 to 54296
20 poke x,0
30 r$=r$+chr$(17)
40 next x
50 print chr$(147);chr$(5);"do you want to use the <k>eyboard"
60 print "or the <j>oystick?";
70 get kb$
80 if kb$<>"k" and kb$<>"j" then 70
90 kb=(kb$="j")
100 print chr$(147);
110 read sc,cl,s,hr,hc,f
120 poke 54295,15
130 poke 54278,241
140 poke 53280,13
150 poke 53281,11
160 poke 1484,102
170 poke 55756,7
180 for x=1 to 24
190 read a,b,c
200 for y=a to b
210 if x<=12 then poke sc+c+40*y,160:poke cl+c+40+y,14:goto 230
220 poke sc+y+40*c,160:poke cl+y+40*c,14
230 next y
240 next x
250 h1=int(rnd(1)*22)
260 h2=int(rnd(1)*7)-34*(rnd(1)>.5)
270 print chr$(19);left$(r$,23);tab(18);str$(s);" ";
280 s=s-1
290 if kb=0 then 340
300 j=15-(peek(56321) and 15)
310 r0=h1-(j=2 or j=6 or j=10)+(j=1 or j=5 or j=9)
320 c0=h2-(j>=8 and j<=10)+(j>=4 and j<=6)
330 goto 390
340 get j$
350 if j$="" then j=0:goto 370
360 j=asc(j$)
370 r0=h1-(j=44 or j=46 or j=77)+(j=73 or j=79 or j=85)
380 c0=h2-(j=46 or j=76 or j=79)+(j=74 or j=77 or j=85)
390 r0=r0+(r0>22)-(r0<0)
400 c0=c0+(c0>39)-(c0<0)
410 if peek(sc+c0+40+r0)=160 then r0=h1:c0=h2:goto 490
420 poke sc+h2+40*h1,42
430 poke cl+h2+40*h1,11
440 poke sc+c0+40*r0,42
450 poke cl+c0+40*r0,7
460 h1=r0
470 h2=c0
480 if c0=20 and r0=11 then 680
490 ra=hr-(r0>hr)+(r0<hr)
500 ca=hc-(c0>hc)+(c0<hc)
510 ra=ra+(ra>22)-(ra<0)
520 ca=ca+(ca>39)-(ca<0)
530 ch=peek(sc+ca+40*ra)
540 if ch<>160 and ch<>102 then 600
550 d=2*int(rnd(1)*2)-1
560 if f then ra=hr+d:ca=hc:goto 580
570 ca=hc+d:ra=hr
580 f=not f
590 goto 510
600 poke sc+hc+40*hr,87
610 poke cl+hc+40*hr,11
620 poke sc+ca+40*ra,87
630 poke cl+ca+40*ra,8
640 hr=ra
650 hc=ca
660 if ca=c0 and ra=r0 then 780
670 goto 270
680 print chr$(147);
690 if s>hs then hs=s
700 poke 54276,33
710 for t=100 to 1 step -1
720 print "you dit it! ";
730 poke 54273,t
740 poke 54272,t+50
750 next t
760 print chr$(147);"your score is";s;chr$(157);"."
770 goto 830
780 print chr$(147);
790 poke 54272,135
800 poke 54273,17
810 poke 54276,33
820 print "sorry, you were caught!"
830 print "the high score is";hs;chr$(157);"."
840 print "press <return> to play again.";
850 poke 54276,0
860 get k$
870 if k$<>chr$(13) then 860
880 restore
890 goto 100
1000 data 1024,55296,1000,12,15,0
2000 data 3,10,7,12,20,7,7,8,11,10,13,11,15,16,11
2010 data 10,13,17,10,13,23,7,8,28,10,13,28,15,16,28
2020 data 3,10,32,12,20,32,9,19,3,21,30,3,11,14
2030 data 7,16,24,7,26,28,7,17,23,10,19,21,13,11
2040 data 14,16,16,24,16,26,28,16,9,19,20,21,30,20
