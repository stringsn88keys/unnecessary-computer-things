5 if rgr(0)=5 then print chr$(27)"x"
10 print chr$(147)
20 for i=1 to 20
30 print tab(20-i);
40 print chr$(110);
45 if i=1 then 80
50 for x=1 to 2*i-2
60 print chr$(205.5+rnd(1));
70 next x
80 print chr$(109)
90 next i