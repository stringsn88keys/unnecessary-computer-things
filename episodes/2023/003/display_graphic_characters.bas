1 rem p43 "display graphic characters"
2 rem from "advanced trs-80 level ii basic"
3 rem by don inman, bob albrecht, ramon zamora
10 rem *initialize*
20 cls
30 m=15360: a=129
100 rem *print a row of graphics*
110 for c=a to a+3
119   rem don't go beyond code 191
120   if c > 191 goto 300
128   rem print code; and char at loc m
129   rem (original listing omitted the colon)
130   print c,;: poke m,c
140   m = m+16
149   rem don't go beyond screen memory
150   if m>16383 goto 300
160 next c

200 rem *ready next row*
209 rem test for end of screen listing
210 if a=149 or a=173 gosub 1001
220 a = a+4
230 m = m+64
239 rem double check boundaries
240 if m>16383 goto 300
250 print : rem new line
260 goto 100 : rem start another row

300 rem *all done*
310 goto 310 : rem infinite loop to hold

1000 rem *end of screen block*
1010 print: print
1020 input "press enter to continue"; a$
1030 m=15360
1040 cls
1050 return
