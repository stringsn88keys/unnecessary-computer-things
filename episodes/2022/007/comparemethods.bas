100 ti$="000000"
110 x=0 
120 for i=1 to 1000
130 x=x+1
140 next i
150 print ti;"<= x += 1, start 0"
160 ti$="000000"
170 x%=0 
180 for i=1 to 1000
190 x%=x%+1
200 next i
210 print ti;"<= x% += 1, start 0"
220 ti$="000000"
230 x=0 :y=1
240 for i=1 to 1000
250 x=x+y
260 next i
270 print ti;"<= x += y, start 0"
280 ti$="000000"
290 x%=0 :y%=1
300 for i=1 to 1000
310 x%=x%+y%
320 next i
330 print ti;"<= x% += y%, start 0"
340 ti$="000000"
350 x1=0 
360 for i=1 to 1000
370 x1=x1+1
380 next i
390 print ti;"<= x1 += 1, start 0"
400 ti$="000000"
410 x%=0 
420 for i=1 to 1000
430 x%=x%+1
440 next i
450 print ti;"<= x% += 1, start 0"
460 ti$="000000"
470 x1=0 :y1=1
480 for i=1 to 1000
490 x1=x1+y1
500 next i
510 print ti;"<= x1 += y1, start 0"
520 ti$="000000"
530 x=30000 
540 for i=1 to 1000
550 x=x+1
560 next i
570 print ti;"<= x += 1, start 30000"
580 ti$="000000"
590 x%=30000 
600 for i=1 to 1000
610 x%=x%+1
620 next i
630 print ti;"<= x% += 1, start 30000"
640 ti$="000000"
650 x=30000 :y=1
660 for i=1 to 1000
670 x=x+y
680 next i
690 print ti;"<= x += y, start 30000"
700 ti$="000000"
710 x%=30000 :y%=1
720 for i=1 to 1000
730 x%=x%+y%
740 next i
750 print ti;"<= x% += y%, start 30000"
760 ti$="000000"
770 x1=30000 
780 for i=1 to 1000
790 x1=x1+1
800 next i
810 print ti;"<= x1 += 1, start 30000"
820 ti$="000000"
830 x%=30000 
840 for i=1 to 1000
850 x%=x%+1
860 next i
870 print ti;"<= x% += 1, start 30000"
880 ti$="000000"
890 x1=30000 :y1=1
900 for i=1 to 1000
910 x1=x1+y1
920 next i
930 print ti;"<= x1 += y1, start 30000"
