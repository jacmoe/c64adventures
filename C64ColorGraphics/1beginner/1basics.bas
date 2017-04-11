1 goto 1000
20 rem:::::::::::Graphics
21 poke 53265,59
22 poke 53272,29
23 poke 56576,198
24 return
30 rem:::::::::::Text
31 poke 53265,27
32 poke 53272,21
33 poke 56576,199
34 return
40 rem:::::::::::Colors
41 for i = 17408 to 18407
42 poke i,c
43 next
44 return
50 rem:::::::::::paint background
51 for i = 24576 to 32575
52 poke i,0
53 next i
54 return
60 rem:::::::::::find a point
61 row = int(y/8)
62 col = int(x/8)
63 line = y and 7
64 bit = 7 - (x and 7)
65 byte = 24576 + row*320 + col*8 + line
66 cbyte = 17408 + row * 40 + col
67 return
70 rem:::::::::::plot a point
71 gosub 60
72 poke byte,peek(byte) or 2 ^ bit
73 poke cbyte,c
74 return
1000 rem:::::::::::main
1007 c = 14
1100 gosub 20 : rem graphics
1110 gosub 40 : rem colors
1120 gosub 50 : rem background
1200 rem:::::::::::lighthouse
1210 poke 18090,0 : poke 18130,17
1220 poke 18170,17 : poke 18210,17
1300 rem:::::::::::water
1310 for y = 176 to 199
1320 for x = 0 to 319
1330 if rnd(1) < .3 then gosub 70
1340 next x : next y
5000 get a$
5010 if a$ = " " then 6000
5020 goto 5000
6000 gosub 30 : rem text
6010 end