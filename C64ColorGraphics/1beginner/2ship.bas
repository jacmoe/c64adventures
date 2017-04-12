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
110 rem:::::::::::draw a shape
111 for j = 0 to nl
112 e1 = l%(0,j) : e2 = l%(1,j)
113 x1 = e%(0,e1) + x0 : y1 = e%(1,e1) + y0
114 x2 = e%(0,e2) + x0 : y2 = e%(1,e2) + y0
115 gosub 80
116 next j
117 return
1000 rem:::::::::::main
1010 gosub 20 : rem graphics
1020 dim e%(1,99), l%(1,99)
1100 rem:::::::::::ship endpoints
1110 for i = 0 to 16
1120 read e%(0,i), e%(1,i)
1130 next i
1140 data 114,108,93,125,89,125
1150 data 93,135,84,150,78,150
1160 data 56,132,54,135,92,127
1170 data 90,130,18,144,17,141
1180 data 4,144,7,150,6,149
1190 data 88,132,92,137
1200 rem:::::::::::ship lines
1210 for i = 0 to 13
1220 read l%(0,i), l%(1,i)
1230 next i
1240 data 0,1,0,2,1,3,1,5
1250 data 2,6,3,4,3,9,6,7
1260 data 8,10,9,14,10,11,11,12
1270 data 12,13,15,16
1300 rem:::::::::::draw ship
1310 c = 14
1320 nl = 13 : x0 = 114 : y0 = 26
1330 gosub 110
1400 rem:::::::::::front sail endpoints
1410 for i = 0 to 42
1420 read e%(o,i), e%(1,i)
1430 next i
1440 data 96,7,91,28,92,29
1450 data 86,17,105,29,78,22
1460 data 108,38,75,30,69,39
1470 data 67,38,112,62,111,54
1480 data 108,60,86,48,88,50
1490 data 85,51,88,52,66,40
1500 data 122,72,62,54,42,75
1510 data 39,72,117,105,113,103
1520 data 122,90,76,89,81,90
1530 data 75,94,79,96,60,88
1540 data 115,111,60,109,57,120
1550 data 55,119,81,126,93,130
1560 data 115,135,110,134,117,126
1570 data 70,123,76,124,68,129
1580 data 74,128
1600 rem:::::::::::front sail lines
1610 for i = 0 to 27
1620 read l%(0,i), l%(1,i)
1630 next i
1640 data 0,1,0,2,3,4,5,6
1650 data 5,7,6,11,7,8,9,10
1660 data 11,12,13,15,14,16,17,18
1670 data 17,19,18,24,19,20,21,22
1680 data 23,24,25,27,26,28,29,30
1690 data 29,31,30,38,31,32,33,34
1695 data 35,36,37,38,39,41,40,42
1700 rem:::::::::::draw front sail
1710 c = 14
1720 nl = 42 : x0 = 114 : y0 = 26
1730 gosub 110
1800 rem:::::::::::rear sail endpoints
1810 for i = 0 to 40
1820 read e%(0,i), e%(1,i)
1830 next i
1840 data 78,12,75,20,73,15
1850 data 80,20,61,13,78,22
1860 data 60,18,48,25,44,22
1870 data 69,39,52,30,50,38
1880 data 39,45,37,44,60,56
1890 data 99,59,99,55,59,57
1900 data 37,48,33,69,20,84
1910 data 13,80,60,102,102,106
1920 data 100,99,28,87,30,96
1930 data 24,105,21,102,58,116
1940 data 15,81,25,141,41,111
1950 data 49,114,33,140,42,138
1960 data 54,115,39,139,48,137
1970 data 12,105,63,127
2000 rem:::::::::::rear sail endpoints
2010 for i = 0 to 25
2020 read l%(0,i), l%(1,i)
2030 next i
2040 data 0,1,2,3,4,5,4,6
2050 data 6,7,8,9,9,10,10,11
2060 data 11,12,13,14,15,16,17,18
2070 data 18,19,19,20,21,22,23,24
2080 data 25,26,26,27,28,29,30,31
2090 data 31,32,33,34,33,35,36,37
2095 data 36,38,39,40
2100 rem:::::::::::draw rear sail
2110 c = 14
2120 nl = 25 : x0 = 114 : y0 = 26
2130 gosub 110
2200 rem:::::::::::lrg seagull endpts
2210 for i = 0 to 6
2220 read e%(0,i), e%(1,i)
2230 next i
2240 data 0,6,10,0,13,2,14
2250 data 6,15,2,18,0,28,6
2300 rem:::::::::::lrg seagull lines
2310 for i = 0 to 5
2320 read l%(0,i), l%(1,i)
2330 next i
2340 data 0,1,1,2,2,3,3,4
2350 data 4,5,5,6
2400 rem:::::::::::draw lrg seagulls
2410 c = 30 : rem color = white on blue
2420 nl = 5 : x0 = 114 : y0 = 26 : gosub 110
2430 nl = 5 : x0 = 33 : y0 = 151 : gosub 110
2440 nl = 5 : x0 = 80 : y0 = 50 : gosub 110
2500 rem:::::::::::sm seagull endpts
2510 for i = 0 to 5
2520 read e%(0,i), e%(1,i)
2530 next i
2540 data 0,8,5,5,8,6,7,8,9,4,16,0
2600 rem:::::::::::sm seagull lines
2610 for i = 0 to 3
2620 read l%(0,i), l%(1,i)
2630 next i
2640 data 0,1,1,2,3,4,4,5
2700 rem:::::::::::draw sm seagull
2710 nl = 3 : x0 = 261 : y0 = 10 : gosub 110
2720 nl = 3 : x0 = 275 : y0 = 50 : gosub 110
5000 get a$
5010 if a$ = " " then 6000
5020 goto 5000
6000 gosub 30 : rem back to text mode
6010 end























