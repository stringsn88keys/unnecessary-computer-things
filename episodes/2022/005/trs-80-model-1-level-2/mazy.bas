10 dim a(2)
20 for i=1 to 2
30 read a(i)
40 next i
50 for i=15360 to 16383
60 poke i,a(rnd(2))
70 next i
999 goto 999
1000 data 149,170,131,140,176 : rem 3 horizontal, 2 vertical
1010 data 134, 152, 131, 164  : rem 2 diagonal each way
1020 data 149,140 : rem 1 vertical 1 horizontal
