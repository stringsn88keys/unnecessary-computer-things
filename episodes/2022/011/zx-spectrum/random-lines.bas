10 paper 0
20 border 0
30 cls 
40 randomize
50 let x=int(rnd*256)
60 let y=int(rnd*176)
70 plot x,y
80 let x0=x
90 let y0=y
100 let x=int(rnd*256)
110 let y=int(rnd*176)
120 draw ink int(rnd*8),x-x0,y-y0
130 go to 80