478 CONSTANT C3
426 CONSTANT D3
379 CONSTANT E3
358 CONSTANT F3
319 CONSTANT G3
284 CONSTANT A3
239 CONSTANT C4

100 variable sixteenth

: n sixteenth @ * beep ;

: p1 c3 1 n d3 1 n f3 1 n d3 1 n ;
: p2 a3 3 n a3 3 n g3 6 n ;
: p3 g3 3 n g3 3 n f3 3 n e3 1 n d2 2 n ;
: p4 f3 4 n g3 2 n e3 3 n d3 1 n c3 4 n c3 2 n g3 4 n f3 8 n ;
: p5 c4 4 n e3 2 n f3 3 n e3 1 n d3 2 n ;
p1 p2 p1 p3 p1 p4 p1 p2 p1 p5 p1 p4