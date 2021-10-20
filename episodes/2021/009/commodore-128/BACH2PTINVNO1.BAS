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
1019 rem measure 1
1020 data v2wrv1qrcdem v2wrv1qfdecm v1hgv2o3qrcv1o5hcv2o3qdem fv1o4sba.qbv2o3qdv1o5hcv2o3qecm
1029 rem measure 2
1030 data v2o3hgv1o5qdo4gv2o2hgv1o4qabm v2wrv1o5qco4abgm o5hdv2qro3gv1o5hgv2o3qabm o4cv1o5sfe.qfv2o3av1ho5gv2o3qbgm
1039 rem measure 3
1040 data v2o4hcv1o5qeav2o3hbv1o5qgfm v2o4hcv1o5qegv2o4hdv1o5qfam v2o4hev1o5qgfv2o3hgv1o5qedm v2o3hav1o5qcev2o3hbv1o5qdfm
1048 rem line 2
1049 rem measure 4
1050 data v2o4hcv1o5qedv2o3hev1o5qco4bm v2o3h#fv1o4qao5cv2o3hgv1o4qbo5dm v2o3hav1o5qco4bv2o3hbv1o4qagm v2o4wcv1o4q#fav1o4qgbm
2000 data end of music

