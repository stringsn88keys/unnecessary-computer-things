: 2DUP OVER OVER ;
: 2DROP DROP DROP ;
: 2ROT 6 ROLL 6 ROLL ;
: 2SWAP 4 ROLL 4 ROLL ;
: SIN
    2DUP 2DUP 2DUP F* FNEGATE
    2ROT 2ROT
    27 2

    DO
        6 PICK 6 PICK
        F* I I 1+ *
        UFLOAT F/
        2DUP 2ROT F+ 2SWAP
        2
    +LOOP
    2DROP 2SWAP 2DROP
;
: COS
    1.57080
    2SWAP F-
    SIN
;

: XYPLOT
    2SWAP 64. 640. F/ F* INT ROT ROT INT 23 + 1 PLOT
;

: COSPLOT
    UFLOAT 2DUP 320. F-
    3.14159 180. F/ F* COS
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