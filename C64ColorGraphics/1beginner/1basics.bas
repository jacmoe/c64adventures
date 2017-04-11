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
80 rem:::::::::::plot a line
81 dx = x2 - x1 : dy = y2 - y1
82 l = abs(dx) : if abs(dy) > l then l = abs(dy)
83 if l > 0 then xi = dx/l : yi = dy/l
84 x = x1 + .5 : y = y1 + .5
85 for i = 0 to l
86 gosub 70 : rem plot point
87 x = x + xi : y = y + yi
88 next i
89 return
90 rem:::::::::::paint a shape
91 pc = pc + abs(pc=0) : for x = x0 to x0 + w : fl$ = "f" : pr = 0
92 for yc = y0 to y0 + h : y = yc : gosub 60
93 on abs((peek(byte) and 2 ^ bit) <> 0) goto 97 : if pr=0 then 96
94 pr = 0 : if fl$ = "f" then y1 = yc : fl$ = "t" : goto 96
95 gosub 99 : fl$ = "f"
96 next yc : goto 98
97 pr = 1 : next yc : if fl$ = "t" then gosub 99
98 next x : return
99 for y = y1 to yc - 1 : on abs(rnd(1) < pc) gosub 70 : next y : return
1000 rem:::::::::::main
1007 c = 14
1100 gosub 20 : rem graphics
1110 c = 1 : gosub 40 : rem colors
1120 gosub 50 : rem background
1130 goto 3000
1200 rem:::::::::::lighthouse
1210 poke 18090,0 : poke 18130,17
1220 poke 18170,17 : poke 18210,17
1300 rem:::::::::::water
1305 goto 2100 : rem skip water, too slow
1310 for y = 176 to 199
1320 for x = 0 to 319
1330 if rnd(1) < .3 then gosub 70
1340 next x : next y
2100 rem:::::::::::line test
2110 x1 = 0 : y1 = 0
2120 x2 = 319 : y2 = 199 : gosub 80
3000 c = 33 
3100 rem:::::::::::shape test
3110 x1 = 72 : y1 = 71
3120 x2 = 88 : y2 = 40 : gosub 80
3130 x1 = 103 : y1 = 71 : gosub 80
3140 x2 = 72 : y2 = 71 : gosub 80
4100 rem:::::::::::paint shape test
4110 x0 = 72 : y0 = 40
4120 w = 31 : h = 31
4130 pc = 1 : gosub 90
5000 get a$
5010 if a$ = " " then 6000
5020 goto 5000
6000 gosub 30 : rem text
6010 end