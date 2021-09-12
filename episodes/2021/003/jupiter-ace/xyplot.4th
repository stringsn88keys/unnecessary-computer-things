(floating point stack arrangement words from p91)
: 2DROP
    (fp - )
    DROP DROP
;

: 2DUP
    (fp - fp, fp)
    OVER OVER
;

: 2SWAP
    (fp1, fp2 - fp2, fp1)
    4 ROLL 4 ROLL
;   

: 2OVER
    (fp1,fp2 - fp1,fp2,fp1)
    4 PICK 4 PICK
;

: 2ROT
    (fp1,fp2,fp3 - fp2,fp3,fp1)
    6 ROLL 6 ROLL
;

: 2@
    (address - fp)
    DUP @ SWAP 2+ @
;

: 2!
    (fp, address -)
    ROT OVER ! 2+ !
;

(p92)
: SQRT
    (fp - square root)
    1. 10 0
    DO
        2OVER 2OVER F/ F+
        .5 F*
    LOOP
    2SWAP 2DROP
;


: SIN
    (x - sine of x)
    2DUP 2DUP 2DUP F* FNEGATE ([x,x,-x*x])
    2ROT 2ROT ([-x*x,x,x])
    27 2 ([-x*x,x,x, 27 2])

    DO (initial value of 2, limit 27)
        ([-x*x,x,x])
        6 PICK 6 PICK ([-x*x,x,x,-x*x])
        F* I I 1+ * ([-x*x,x,-x^3,6])
        UFLOAT F/ ([-x*x,x,-x^3/6.])
        2DUP 2ROT F+ 2SWAP ([-x*x,-x^3/6.+x,-x^3/6.])

        (3 down the stack of floats is the multiplier of the
        numerator terms for the Newton method, 2 down the
        stack is the total sum, top of the stack is the last
        term, and the counter (I) tracks the denominator 
        multipliers (I and I+1))

        2 (add 2 to the stack for the loop increment)
    +LOOP
    2DROP 2SWAP 2DROP ([x-x^3/6. ... etc])
;  

: COS
    (x - cos x)
    1.57080
    2SWAP F- (pi/2 - x)
    SIN 
;

: TAN
    (x - tan x)
    2DUP SIN ([x, sin x])
    2SWAP COS F/ ([cos x/sin x])
;

: XYPLOT
    2SWAP 64. 640. F/ F* INT 32 + ROT ROT INT 23 + 1 PLOT
;

: COSPLOT
    UFLOAT 2DUP 64. 640. F/ F* -16. F+ 
    -320. 2SWAP F- 3.14159 180. F/ F* 64. 640. F/ F/ COS
    23. F*
    XYPLOT
;

: AXES
    64 0
    DO
        I 23 1 PLOT
    LOOP

    46 0  
    DO
        32 I 1 PLOT
    LOOP 
;

: PLOT1 
    CLS
    AXES
    640 0
    DO
        I COSPLOT
    LOOP
;

: PLOT2
    CLS
    AXES
    640 0
    DO
        I COSPLOT
    10
    +LOOP
;
