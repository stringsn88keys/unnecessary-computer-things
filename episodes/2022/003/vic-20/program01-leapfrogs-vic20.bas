100 dim p(9)
200 let p(5)=32
210 for i=1 to 4
220 let p(i)=asc("S")
230 let p(i+5)=asc("A")
240 next i
250 let c=0
300 print "{clr/home}"
310 for i=1 to 9
320 print chr$(p(i));" ";
330 next i
340 print
350 for i=1 to 9
360 print chr$(48+i);" ";
370 next i
490 print 
500 print "enter move"
510 input a
520 if a=0 then go to 900
530 let f=int(a/10)
540 if f=0 then go to 510
550 if p(f)=32 then go to 510
560 let t=a-10*f
570 if t=0 then go to 510
580 if p(t)>32 then go to 510
590 if abs(t-f)>2 then go to 510
600 let c=c+1
610 let p(t)=p(f)
620 let p(f)=32
710 for i=1 to 9
720 if i=5 then go to 740
730 if (i>5 and p(i)=asc("A")) or (i<5 and p(i)=asc("S")) then go to 300
740 next i
760 if p(5) <> 32 then go to 300
800 print "you did it in ";c;" moves"
810 print "another go?"
820 input a$
830 if left$(a$,1)="y" then go to 200
900 print "byebye"
