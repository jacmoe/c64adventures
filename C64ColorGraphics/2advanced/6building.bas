0 if peek(49152) <> 128 then load "m/l",8,1
1 goto 1000
10 rem:::::::graphics
11 if mu then poke 53270,216 : rem mu = multi color graphics
12 poke 53265,59 : rem 59 for graphics, 27 for text
13 poke 53272,29 : rem pixel pattern storage, 29 means patterns not stored in same location as colors
14 poke 56576,198 : rem which bank used for pixel patterns and color - 198: use bank 1
15 return
20 rem:::::::text
21 poke 53270,200
22 poke 53265,27
23 poke 53272,21
24 poke 56576,199
25 return
30 rem:::::::clear hires/multi
31 sys 49164,c
32 xl = 0 : xh = 319 : yl = 0 : yh = 199
33 return
40 rem:::::::plot a point
41 sys 49502,x,y,c,mu
42 return
50 rem:::::::plot a line
51 sys 49502,x1,y1 to x2,y2,c,mu
52 return
60 rem:::::::paint a shape
61 x = p%(pp,0) : y = p%(pp,1) : if x < 0 or y < 0 or x > 319 or y > 199 then return
62 sys 49748,x,y,c,mu
63 return
70 rem:::::::clip a shape
71 s1 = 0 : s2 = 0
72 if x1 < xl then s1 = 1
73 if x1 > xh then s1 = 2
74 if y1 > yh then s1 = s1 + 4
75 if y1 < yl then s1 = s1 + 8
76 if x2 < xl then s2 = 1
77 if x2 > xh then s2 = 2
78 if y2 > yh then s2 = s2 + 4
79 if y2 < yl then s2 = s2 + 8
80 if s1 = 0 and s2 = 0 then 50
81 if s1 and s2 then return
82 s = s1 : if s = 0 then s = s2
83 if s and 1 then y = y1 + (y2 - y1) * (xl - x1)/(x2 - x1) : x = xl : goto 87
84 if s and 2 then y = y1 + (y2 - y1) * (xh - x1)/(x2 - x1) : x = xh : goto 87
85 if s and 4 then x = x1 + (x2 - x1) * (yh - y1)/(y2 - y1) : y = yh : goto 87
86 if s and 8 then x = x1 + (x2 - x1) * (yl - y1)/(y2 - y1) : y = yl
87 if s = s1 then x1 = x : y1 = y : goto 71
88 x2 = x : y2 = y : goto 71
90 rem:::::::draw a shape
92 for j = 0 to nl
93 e1% = l%(j,0) : e2% = l%(j,1)
94 x1 = p%(e1%,0) : y1 = p%(e1%,1)
95 x2 = p%(e2%,0) : y2 = p%(e2%,1)
96 gosub 70
97 next j
98 return
170 rem:::::::zap!
171 gosub 20 : print "do you know what you are doing?" : end
172 a = 256 : b = 2049 : c = 1003
173 if peek(b + 2) + a * peek(b + 3) >= c then 176
174 b = peek(b) + a * peek(b + 1) : on abs(b <> 0) goto 173 : end
175 a = 256 : b = peek(251) + a * peek(252)
176 if peek(b + 1) = 0 then end
177 print chr$(147) peek(b + 2) + a * peek(b + 3) : print "goto 175"
178 poke 251, b - int(b/a) * a : poke 252,b/a
179 poke 631,19 : poke 632,13 : poke 633,13 : poke 198,3 : end
800 rem:::::::retrieve a shape
801 restore
802 read s$, nd, nl
803 for i = 0 to nd
804 read p%(i,0), p%(i,1) : p%(i,2) = 1
805 next i
806 for i = 0 to nl
807 read l%(i,0), l%(i,1)
808 next i
809 on abs(s$ <> se$) goto 802 : return
1000 rem::::::::::::::::::::::::
1001 rem      main routine
1002 rem::::::::::::::::::::::::
1003 rem:     shape library    :
1004 rem::::::::::::::::::::::::
1008 data "building", 85, 59
1010 data   0,  64, 144,  64, 144,   8
1012 data 263,   8, 263,  80, 319,  80
1014 data 319, 175,   0, 175,   0, 168
1016 data 319, 168,   8, 168,   8, 128
1018 data  39, 128,  39, 168,  48, 168
1020 data  48, 128,  79, 128,  79, 168
1022 data  88, 168,  88, 128, 119, 128
1024 data 119, 168, 152, 168, 152, 120
1026 data 191, 120, 191, 168, 216, 168
1028 data 216, 120, 255, 120, 255, 168
1030 data 264, 168, 264, 128, 279, 128
1032 data 279, 168, 296, 168, 296, 128
1034 data 311, 128, 311, 168,   8, 111
1036 data   8,  80,  31,  80,  31, 111
1038 data  48, 111,  48,  80,  71,  80
1040 data  71, 111,  88, 111,  88,  80
1042 data 111,  80, 111, 111, 160, 103
1044 data 160,  72, 191,  72, 191, 103
1046 data 216, 103, 216,  72, 247,  72
1048 data 247, 103, 160,  63, 160,  32
1050 data 191,  32, 191,  63, 216,  63
1052 data 216,  32, 247,  32, 247,  63
1054 data 136,  63, 136,  16                                                                                                                                                                                            
1056 data 160, 198, 160, 172,  24, 152
1058 data  60, 152, 100, 152, 172, 152
1060 data 235, 152, 271, 152, 304, 152
1062 data  20,  96,  60,  96, 100,  96
1064 data 175,  88, 232,  88, 175,  44
1066 data 232,  44, 139,  40, 202,  24
1070 data  0,  1,  1,  2,  2,  3,  3,  4
1072 data  4,  5,  5,  6,  6,  7,  7,  0
1074 data  8,  9, 10, 11, 11, 12, 12, 13
1076 data 14, 15, 15, 16, 16, 17, 18, 19
1078 data 19, 20, 20, 21, 22, 23, 23, 24
1080 data 24, 25, 26, 27, 27, 28, 28, 29
1082 data 30, 31, 31, 32, 32, 33, 34, 35
1084 data 35, 36, 36, 37, 38, 39, 39, 40
1086 data 40, 41, 41, 38, 42, 43, 43, 44
1088 data 44, 45, 45, 42, 46, 47, 47, 48
1090 data 48, 49, 49, 46, 50, 51, 51, 52
1092 data 52, 53, 53, 50, 54, 55, 55, 56
1094 data 56, 57, 57, 54, 58, 59, 59, 60 
1096 data 60, 61, 61, 58, 62, 63, 63, 64
1098 data 64, 65, 65, 62, 66, 67, 67,  2
2000 gosub 10 : c = 14 : gosub 30
2100 rem:::::::draw building
2105 dim p%(99,2), l%(99,1)
2110 se$ = "building" : gosub 800
2120 print chr$(5) : c = 1 : gosub 90
2200 rem:::::::paint building
2210 pp = 68 : c = 11 : gosub 60
2220 pp = 69 : c = 12 : gosub 60
2230 pp = 70 : c = 6 : gosub 60
2240 pp = 71 : gosub 60
2250 pp = 72 : c = 5 : gosub 60
2260 pp = 73 : c = 9 : gosub 60
2270 pp = 74 : gosub 60
2280 pp = 75 : c = 6 : gosub 60
2290 pp = 76 : c = 0 : gosub 60
2300 pp = 77: gosub 60
2310 pp = 78 : c = 4 : gosub 60
2320 pp = 79 : gosub 60
2330 pp = 80 : c = 0 : gosub 60
2340 pp = 81 : c = 9 : gosub 60
2350 pp = 82 : c = 6 : gosub 60
2360 pp = 83 : c = 0 : gosub 60
2370 pp = 84 : c = 12 : gosub 60
2380 pp = 85 : c = 15 : gosub 60
6000 get a$
6010 if a$ = " " then goto 6030
6020 goto 6000
6030 print chr$(5) chr$(147) : gosub 20 : end