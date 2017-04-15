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
1006 data "rectangle", 3, 3
1008 data 8,8,47,8,47,31,8,31
1010 data 0,1,1,2,2,3,3,0
1020 data "inv-triangles", 5,5
1022 data 30,8,30,39,16,23
1024 data 33,8,33,39,47,23
1026 data 0,1,1,2,2,0
1028 data 3,4,4,5,5,3
1030 data "butterfly",41,44
1032 data 143,71,23,7,47,119
1034 data 87,127,63,143,127,167
1036 data 151,103,143,103,63,63
1038 data 63,103,135,111,95,127
1040 data 135,127,151,87,159,191
1042 data 167,87,151,79,159,55
1044 data 167,79,143,55,151,55
1046 data 151,71,151,47,135,7
1048 data 183,7,167,47,167,55
1050 data 175,55,167,71,175,71
1052 data 295,7,271,119,231,127
1054 data 255,143,191,167,167,103
1056 data 175,103,255,63,255,103
1058 data 183,111,183,127,223,127
1060 data 0,1,1,2,2,3,3,4
1062 data 4,5,5,6,6,0,7,8
1064 data 8,1,8,9,9,2,9,7
1066 data 12,10,10,11,11,12,22,23
1068 data 20,19,19,21,21,20,16,17
1070 data 17,18,18,16,13,15,15,14
1072 data 13,14,25,24,26,27,27,28
1074 data 26,28,35,29,29,30,30,31
1076 data 32,31,32,33,34,33,35,34
1078 data 29,35,36,37,37,30,37,38
1080 data 36,38,39,41,40,41,39,40
1082 data 38,31
1090 data "split-triangle",3,4
1092 data 0,0,15,23,0,47,-15,23
1094 data 0,1,1,2,2,3,3,0
1096 data 0,2
2010 mu = 1 : gosub 10 : c = 14 : gosub 30
2020 dim p%(99,2), l%(99,1)
2030 se$ = "butterfly" : gosub 800
2035 rem:::::::set viewing area
2036 rem xl = 144 : xh = 175
2037 rem yl = 56 : yh = 79
2040 c = 0 : gosub 90
2050 x = 56 : y = 40 : c = 12 : gosub 60
2060 x = 263 : gosub 60
2070 x = 40 : y = 48 : gosub 60
2080 x = 279 : gosub 60
2090 x = 80 : y = 80 : c = 8 : gosub 60
2100 x = 239 : gosub 60
2110 x = 120 : y = 120 : gosub 60
2120 x = 199 : gosub 60
2130 x = 160 : y = 96 : c = 0 : gosub 60
2140 y = 72 : gosub 60
2150 x = 148 : y = 58 : c = 2 : gosub 60
2160 x = 170 : gosub 60
6000 get a$
6010 if a$ = " " then goto 6030
6020 goto 6000
6030 print chr$(5) chr$(147) : gosub 20 : end