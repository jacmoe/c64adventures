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
120 rem:::::::::::define sprite sp
121 for i = 0 to 62
122 read a
123 poke 16384 + 64 * sp + i,a
124 next i
125 poke 18424 + sp, sp
126 return
130 rem:::::::::::turn on sprite sp
131 poke 53269, peek(53269) or 2 ^ sp
132 return
140 rem:::::::::::turn off sprite sp
141 poke 53269, peek(53269) and (255 - 2 ^ sp)
142 return
150 rem:::::::::::x expand sprite sp
151 poke 53277, peek(53277) or 2 ^ sp
152 return
160 rem:::::::::::x unexpand sprite sp
161 poke 53277, peek(53277) and (255 - 2 ^ sp)
162 return
170 rem:::::::::::y expand sprite sp
171 poke 53271, peek(53271) or 2 ^ sp
172 return
180 rem:::::::::::y unexpand sprite sp
181 poke 53271, peek(53271) and (255 - 2 ^ sp)
182 return
190 rem:::::::::::sprite sp priority over shape
191 poke 53275, peek(53275) and (255 - 2 ^ sp)
192 return
200 rem:::::::::::shape priority over sprite sp
201 poke 53275, peek(53275) or 2 ^ sp
202 return
210 rem:::::::::::sprite sp to color c
211 poke 53287 + sp,c
212 return
220 rem:::::::::::place sprite sp at x,y
221 xx = x + 24 : yy = y + 50 : z% = xx / 256
222 v = xx - z% * 256 : w = 53248 + sp * 2
223 ww = 53264
224 pr = abs((peek(ww) and 2 ^ sp) <> 0)
225 vv = peek(ww) and (255 - 2 ^ sp) or (2 ^ sp * z%)
226 if pr <> z% then gosub 140
227 poke w,v : poke ww,vv : gosub 130
228 poke 53249 + sp * 2,yy
229 return
230 rem:::::::::::move sprite from x1,y1 to x2,y2
231 dx = x2 - x1 : dy = y2 - y1
232 l = abs(dx) : if abs(dy) > l then l = abs(dy)
233 if l > 0 then xi = dx/l : yi = dy/l
234 x = x1 + .5 : y = y1 + .5 : sd = sd + abs(sd = 0)
235 for i = 0 to l step sd
236 gosub 220
237 x = x + xi * sd : y = y + yi * sd
238 next i
239 return
1000 rem:::::::::::main
1010 gosub 20 : rem graphics
1100 rem:::::::::::sun sprite
1110 sp = 0 : gosub 120
1120 gosub 130
1130 gosub 150
1140 gosub 170
1150 gosub 200
1160 c = 7 : gosub 210
1170 x1 = 0 : y1 = 10 : x2 = 260 : y2 = 10 : sd = 5
1180 gosub 230
2500 rem:::::::::::sun sprite data
2510 data 0,0,0
2520 data 0,0,0
2530 data 1,255,128
2540 data 7,255,224
2550 data 15,255,240
2560 data 31,255,248
2570 data 63,255,252
2580 data 127,255,254
2590 data 255,255,255
2600 data 255,255,255
2610 data 255,255,255
2620 data 255,255,255
2630 data 255,255,255
2640 data 127,255,254
2650 data 63,255,252
2660 data 31,255,248
2670 data 15,255,240
2680 data 7,255,224
2690 data 1,255,128
3000 data 0,0,0
3010 data 0,0,0
6000 get a$
6010 if a$ = " " then 6030
6020 goto 6000
6030 gosub 30 : rem back to text mode
6035 gosub 140 : rem turn off sprite
6040 end