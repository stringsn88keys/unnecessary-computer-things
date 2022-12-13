screen 13
cls
x=rnd*640
y=rnd*200
do
    x0=x
    y0=y
    x=rnd*640
    y=rnd*200
    line(x0,y0)-(x,y),rnd*256
loop
