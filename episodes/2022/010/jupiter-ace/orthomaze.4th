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
        15403 @
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

: maze
    cls
    32 24 * 0
    do
        11 rnd 1+ emit
    loop
;

: remap
    0 0 0 31 31 24 24 24 1 gr
    0 0 0 248 248 24 24 24 2 gr
    24 24 24 31 31 0 0 0 3 gr
    24 24 24 248 248 0 0 0 4 gr
    24 24 24 24 24 24 24 24 5 gr
    0 0 0 255 255 0 0 0 6 gr
    0 0 0 255 255 24 24 24 7 gr
    24 24 24 248 248 24 24 24 8 gr
    24 24 24 31 31 24 24 24 9 gr
    24 24 24 255 255 0 0 0 10 gr
    24 24 24 255 255 24 24 24 11 gr
;

