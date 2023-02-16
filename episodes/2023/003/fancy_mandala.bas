1 rem p53 "fancy mandala"
2 rem from "advanced trs-80 level ii basic"
3 rem by don inman, bob albrecht, ramon zamora
10 rem *set up character codes*
20 cls
25 s=10
30 for n=0 to 330 step 66
35   for r=0 to s
40     a=rnd(2)-1:b=rnd(2)-1:c=rnd(2)-1:d=rnd(2)-1:e=rnd(2)-1:f=rnd(2)-1
50     if n=0 then m=0 else m=62*(n/66)
90     rem turn on bits in the 2x3 character-based graphics based
91     rem on the 0/1 values in a through f and add to 128.
100    ul=128+a+2*b+(2*c)^2+(2*d)^3+(2*e)^4+(2*f)^5
110    ur=128+b+2*a+(2*d)^2+(2*c)^3+(2*f)^4+(2*e)^5
120    ll=128+e+2*f+(2*c)^2+(2*d)^3+(2*a)^4+(2*b)^5
130    lr=128+f+2*e+(2*d)^2+(2*c)^3+(2*b)^4+(2*a)^5
200    rem *print the mandala*
210    print @544,chr$(191);:print@144+n+r,chr$(ul);
220    print @176+m-r,chr$(ur);:print@912-m+r,chr$(ll);
230    print @944-n-r,chr$(lr);
235 next r
237 s=s-1
240 next n
250 for wait = 1 to 200: next wait
260 goto 10
