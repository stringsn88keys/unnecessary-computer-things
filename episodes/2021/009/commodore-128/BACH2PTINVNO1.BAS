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
1100 data v1hbv2qo3go4gv1.wrv2qfe dfeg hfv1qro5dv2ho4ev1qo5co4b v2hfv1qao5cv2ho4dv1qbo5dm
1109 rem measure 10
1110 data v1ho5cv2qo4eav1.wrv2qgf egfa hgv1qro5ev2o4hfv1o5qdc v2o4hgv1qbo5dv2ho4ev1o5q#cem
1119 rem measure 11
1120 data v1ho5dv2qo4f$bv1ho5#cv2qo4agm v1ho5dv2qo4fav1ho5ev2qo4g$bm v1ho5fv2qo4agv1hav2qfem v1h$bv2qdfv1ho5cv2qo4egm
1128 rem line 4
1129 rem measure 12
1130 data v1ho5dv2o4qfev1h#fv2qdcm v1h#gv2qo3bo4dv1hav2qcem v1hbv2qdcv1ho5cv2o3qbam v1o5wdv2o3q#gbao4cm
1139 rem measure 13
1140 data v2o3hbv1qo5do4ev2o3hev1o4q#f#gm v2o4sdc.qdv1qa#f#gev2em v1o5qev2o4cv1o5dv2o3bv1o5cv2o3av1o5ev2o3gm v1o5dv2o3#fv1o5cv2o3av1o4bv2o3#gv1o5dv2o3bm
1149 rem measure 14
1150 data v1o5qcv2o3av1o5av2o4cv1o5#gv2o3bv1o5bv2o4dm v1o5av2o4cv1o5ev2o4ev1o5fv2o4dv1o5dv2o4fm
1151 data v2hev1q#go5fv2o3hav1o5qedm v2o4hev1so5co4bo5co4bqo5cv2o3hev1qo4bam
1159 rem no more trills or mordents, but whole and half notes, so 1/4 speed so 16th=16th
1160 data tempo 6
1168 rem line 5
1169 rem measure 15
1170 data v2o3iav1o4sao5av2o2iav1o5sgfm v2qrv1o5segfam v1o5hgv2sro4edc o3bo4d#cem
1179 rem measure 16
1180 data v2hdv1o5sgefgafge hfv2o4sdo3abo4cdo3bo4co3am
1189 rem measure 17
1190 data v2hbv1o5sfgfedfeg hfv2o3sbo4dco3bao4co3bo4dm
1199 rem measure 18
1200 data v2hcv1o5sfdefgefd hev2o4sco3ga$bo4co3a$bgm
1208 rem line 6
1209 rem measure 19
1210 data v2o3iav1o5secv2o3i$bv1o5sde v2o3iav1o5sfdv2o3igv1o5sec v2o3ifv1o5sdev2o4idov1o5sfg v2o4icv1o5safv2o3ibv1o5sgem
1219 rem measure 20
1220 data v2o3iav1o5sfgv2o4ifv1o5sab v2o4iev1so6co5av2o4idv1o5sbg v1o6icv2o4seo3dv1o5igv2o3sef v1o5iev2o3sgev1o5dv2o3fv1o5cv2o3dm
1229 rem measure 21
1230 data v2iev1o5sco4$bv2o3icv1o4sag v2o3idv1o4sfav2o3iev1o4sg$b v2o3fv1o4av2o3dv1o4bv2o3ev1o5cv2o3fv1o4e v2o3igv1o4sdo5cv2o2igv1o4sfbm
1239 rem measure 22
1240 data tempo 24
1250 data v2o2scv1o4ev2o3scv1o4gm
1251 data v3o4wev2o2cv1o5cm
2000 data end of music

