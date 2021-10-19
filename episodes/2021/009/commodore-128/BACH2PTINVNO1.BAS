10 rem two part invention number 1 by j.s.bach
20 a$="v1o4t7u8x0 v2o4t7u8x0":rem v1=organ, v2=piano
30 do
40 play a$
50 read a$
80 if instr(a$, "tempo")=1 then tempo val(mid$(a$,6)): read a$
90 loop until a$="end of music"
100 end
1000 rem tempo 24 = quarter -> sixteenth
1010 data tempo 24
1020 data v2wrv1qrcdev2wrv1qfdec v1hgv2o3qrcv1o5hcv2o3qdefv1o4sba.qbv2o3qdv1o5hcv2o3qecm
1030 data v2o3hgv1o5qdo4gv2o2hgv1o4qabv2wrv1o5qco4abg o5hdv2qro3gv1o5hgv2o3qabo4cv1o5sfe.qfv2o3av1ho5gv2o3qbgm
2000 data end of music
