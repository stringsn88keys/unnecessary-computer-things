0 variable seed

(-- next value of seed)
: seedon
    seed @ 75 u* 75 0 d+
    over over u< - -
    1- dup seed !
;

(n -- pseudo random no. between 0 and n-1)
: rnd
    seedon u* swap drop
;

(value for seed --)
: rand
    ?dup 0=
    if
        15403 @ swap
    then
        seed !
;

(8 row numbers, ASCII code --)
: gr
    8 * 11263 + dup
    8 +
    do
        i c! -1
    +loop
;

2 base c!
10000000
01000000
00100000
00010000
00001000
00000100
00000010
00000001
decimal

1 gr

2 base c!
00000001
00000010
00000100
00001000
00010000
00100000
01000000
10000000
decimal

2 gr

: maze
    cls
    32 24 * 0
    do 
        rnd 1+ emit
    loop
;