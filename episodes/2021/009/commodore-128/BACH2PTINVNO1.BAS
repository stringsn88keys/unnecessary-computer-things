10 rem two part invention number 1 by j.s.bach
20 a$="v1o4t7u8x0 v2o4t7u8x0":rem v1=organ, v2=piano
30 do
40 play a$
50 read a$
80 if instr(a$, "tempo")=1 then tempo val(mid$(a$,6)): read a$
90 loop until a$="end of music"
100 end
1000 rem tempo 24 = quarter -> sixteenth
1009 rem tempo 24 is roughly 60 beats per minute?
1010 data tempo 24
1019 rem measure 1
1020 data v2wrv1qrcdem v2wrv1qfdecm v1hgv2o3qrcv1o5hcv2o3qdem fv1o4sba.qbv2o3qdv1o5hcv2o3qecm
1029 rem measure 2
1030 data v2o3hgv1o5qdo4gv2o2hgv1o4qabm v2wrv1o5qco4abgm o5hdv2qro3gv1o5hgv2o3qabm o4cv1o5sfe.qfv2o3qav1ho5gv2o3qbgm
1039 rem measure 3
1040 data v2o4hcv1o5qeav2o3hbv1o5qgfm v2o4hcv1o5qegv2o4hdv1o5qfam v2o4hev1o5qgfv2o3hgv1o5qedm v2o3hav1o5qcev2o3hbv1o5qdfm
1048 rem line 2
1049 rem measure 4
1050 data v2o4hcv1o5qedv2o3hev1o5qco4bm v2o3h#fv1o4qao5cv2o3hgv1o4qbo5dm v2o3hav1o5qco4bv2o3hbv1o4qagm v2o4wcv1o4q#fav1o4qgbm
1059 rem measure 5
1060 data v1o4hav2qco3dv1o4hdv2o3qe#fm v2gv1o5sco4bo5.qcv2o3e#fdv1o5dm v2o3hgv1o4qbav2o2hbv1o4qg#fm v2o3hcv1o4qegv2o3hdv1o4q#fam
1069 rem measure 6
1070 data v2o3hev1o4qgbv2o3h#fv1o4qao5cm v2o3hgv1o4qbo5dv2o3hev1o5qce v2o2.hbv1o5qdo4ibo5cqdgv2o3cm v2hdv1o4sbababaibv2o2hdv1o4qagm
1079 rem measure 7
1080 data v1o4hgv2qro2gv1hrv2qab v1wrv2o3qco2abg v2o3hdv1qro4gv2o3hgv1o4qab v2o3h#fv1o5qco4av2o3hgv1o4qbgm
1088 rem line 3
1089 rem measure 8
1090 data v1ho4#fv2o3qadv1hrv2qe#f v1wrv2o3qge#fd v2ho3av1qro4av2hdv1qbo5c v2o4hcv1o5qdo4bv2hdv1qo5co4am
1099 rem measure 9
1100 data v1hbv2qo3go4gv1.wrv2qfe dfeg hfv1qro5dv2ho4ev1qo5co4b v2hfv1qao5cv2ho4dv1qbo5d
1109 rem measure 10
1110 data v1ho5cv2qo4eav1.wrv2qgf egfa hgv1qro5ev2o4hfv1o5qdc v2o4hgv1qbo5dv2ho4ev1o5q#ce
2000 data end of music

