1 goto 1000
10 rem:::::::::::zap!
11 a = 256 : b = 2049 : c = 1003
12 if peek(b + 2) + a * peek(b + 3) >= c then 15
13 b = peek(b) + a * peek(b + 1) : on abs(b <> 0) goto 12 : end
14 a = 256 : b = peek(251) + a * peek(252)
15 if peek(b + 1) = 0 then end
16 print chr$(147) peek(B + 2) + a * peek(b + 3) : print "goto 14"
17 poke 251,b - int(b/a) * a : poke 252,b/a
18 poke 631,19 : poke 632,13 : poke 633,13 : poke 198,3 : end
20 rem:::::::::::graphics
21 poke 53265,59
22 poke 53272,29
23 poke 56576,198
24 return
30 rem:::::::::::text
31 poke 53265,27
32 poke 53272,21
33 poke 56576,199
34 return
40 rem:::::::::::colors
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
100 rem:::::::::::save picture
101 input "enter filename"; file$
102 input "enter 8 for disk, or 1 for casette"; de
103 sys 57812 file$ + ".pic", de
104 poke 174,64 : poke 175,127 : poke 193,0 : poke 194,96
105 sys 62954
106 sys 57812 file$ + ".col", de
107 poke 174,232 : poke 175,71 : poke 193,0 : poke 194,68
108 sys 62954 : end
1000 rem:::::::::::main
1100 gosub 20 : rem graphics
1110 c = 14 : gosub 40 : rem colors
1120 gosub 50 : rem background
1200 rem:::::::::::lighthouse
1210 poke 18090,0 : poke 18130,17
1220 poke 18170,17 : poke 18210,17
1300 rem:::::::::::water
1310 for y = 176 to 199
1320 for x = 0 to 319
1330 if rnd(1) < .3 then gosub 70
1340 next x : next y
1400 rem:::::::::::left land
1410 c = 94 : rem color = green on blue
1420 x1 = 0 : y1 = 160
1430 x2 = 16 : y2 = 168 : gosub 80
1440 x1 = 24 : y1 = 168 : gosub 80
1450 x2 = 40 : y2 = 175 : gosub 80
1460 x1 = 0 : y1 = 175 : gosub 80
1470 x2 = 0 : y2 = 160 : gosub 80
1500 rem:::::::::::right land
1510 x1 = 240 : y1 = 175
1520 x2 = 261 : y2 = 164 : gosub 80
1530 x1 = 279 : y1 = 164 : gosub 80
1540 x2 = 319 : y2 = 152 : gosub 80
1550 x1 = 319 : y1 = 159 : gosub 80
1560 x2 = 319 : y2 = 175 : gosub 80
1570 x1 = 240 : y1 = 175 : gosub 80
1600 rem:::::::::::left wave
1610 c = 14 : rem color = black on blue
1620 x1 = 48 : y1 = 175
1630 x2 = 87 : y2 = 169 : gosub 80
1640 x1 = 95 : y1 = 175 : gosub 80
1650 x2 = 48 : y2 = 175 : gosub 80
1700 rem:::::::::::right wave
1710 x1 = 144 : y1 = 175
1720 x2 = 183 : y2 = 169 : gosub 80
1730 x1 = 191 : y1 = 175 : gosub 80
1740 x2 = 144 : y2 = 175 : gosub 80
1800 rem:::::::::::paint left wave
1810 c = 14 : rem color black on blue
1820 x0 = 48 : y0 = 169
1830 w = 47 : h = 6
1840 pc = .3 : gosub 90
1900 rem:::::::::::paint right wave
1910 x0 = 144 : y0 = 169
1920 w = 47 : h = 6
1930 pc = .3 : gosub 90
2000 rem:::::::::::paint left land
2010 c = 94 : rem color green on blue
2020 x0 = 0 : y0 = 160
2030 w = 40 : h = 15
2040 pc = 1 : gosub 90
2100 rem:::::::::::paint right land
2110 x0 = 237 : y0 = 152
2120 w = 82 : h = 23
2130 pc = 1 : gosub 90
3000 rem:::::::::::shade lighthouse
3010 c = 241
3020 x1 = 16 : x2 = 16 : y1 = 136 : y2 = 167 : gosub 80
3030 x1 = 17 : x2 = 17 : gosub 80
3040 x1 = 18 : x2 = 18 : gosub 80
3050 poke 18090,11
4000 rem:::::::::::draw border
4010 c = 94 : rem color = green on blue
4020 x1 = 0 : y1 = 159
4030 x2 = 0 : y2 = 0 : gosub 80
4040 x1 = 319 : y1 = 0 : gosub 80
4050 x2 = 319 : y2 = 166 : gosub 80
5000 get a$
5010 if a$ = " " then 6000
5020 goto 5000
6000 gosub 30 : rem return to text mode
6010 end