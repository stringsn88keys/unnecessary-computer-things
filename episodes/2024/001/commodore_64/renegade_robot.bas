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
1000 data 1024,55296,1000,12,15,0
2000 data 3,10,7,12,20,7,7,8,11,10,13,11,15,16,11
2010 data 10,13,17,10,13,23,7,8,28,10,13,28,15,16,28
2020 data 3,10,32,12,20,32,9,19,3,21,30,3,11,14
2030 data 7,16,24,7,26,28,7,17,23,10,19,21,13,11
2040 data 14,16,16,24,16,26,28,16,9,19,20,21,30,20
