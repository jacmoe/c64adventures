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
61 x = r%(pp,0) : y = r%(pp,1) : if x < 0 or y < 0 or x > 319 or y > 199 then return
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
91 gosub 100
92 for j = 0 to nl
93 e1% = l%(j,0) : e2% = l%(j,1)
94 x1 = r%(e1%,0) : y1 = r%(e1%,1)
95 x2 = r%(e2%,0) : y2 = r%(e2%,1)
96 gosub 70
97 next j
98 return
100 rem:::::::apply transforms
101 for s = 0 to nd : for j = 0 to 2
102 r%(s,j) = 0
103 for i = 0 to 2
104 r%(s,j) = r%(s,j) + p%(s,i) * c(i,j)
105 next i,j,s
106 return
110 rem:::::::clear c matrix
111 for i = 0 to 2 : for j = 0 to 2
112 c(i,j) = abs(i = j)
113 next j,i
114 return
120 rem:::::::clear t matrix
121 for i = 0 to 2 : for j = 0 to 2
122 t(i,j) = abs(i = j)
123 next j,i
124 return
130 rem:::::::combine matrices
131 for i = 0 to 2 : for j = 0 to 2
132 w(i,j) = c(i,j)
133 next j,i
134 for s = 0 to 2 : for j = 0 to 2
135 c(s,j) = 0
136 for i = 0 to 2
137 c(s,j) = c(s,j) + w(s,i) * t(i,j)
138 next i,j,s
139 return
140 rem:::::::translate a shape
141 gosub 120
142 t(2,0) = xt : t(2,1) = yt
143 goto 130
150 rem:::::::scale a shape
151 gosub 120
152 xs = xs - (sx = 0) : ys = ys - (ys = 0)
153 t(0,0) = xs : t(1,1) = ys
154 goto 130
160 rem:::::::rotate a shape
161 gosub 120
162 rd = ro / 360 * 2 * {pi}
163 t(0,0) = cos(rd) : t(0,1) = sin(rd) / 1.23
164 t(1,0) = -sin(rd) * 1.23 : t(1,1) = cos(rd)
165 goto 130
170 rem:::::::zap!
171 gosub 20 : print "do you know what you are doing?" : end
172 a = 256 : b = 2049 : c = 2000
173 if peek(b + 2) + a * peek(b + 3) >= c then 176
174 b = peek(b) + a * peek(b + 1) : on abs(b <> 0) goto 173 : end
175 a = 256 : b = peek(251) + a * peek(252)
176 if peek(b + 1) = 0 then end
177 print chr$(147) peek(b + 2) + a * peek(b + 3) : print "goto 175"
178 poke 251, b - int(b/a) * a : poke 252,b/a
179 poke 631,19 : poke 632,13 : poke 633,13 : poke 198,3 : end
180 rem:::::::turn on sprite sp
181 poke 53269, peek(53269) or 2 ^ sp
182 return
190 rem:::::::turn off sprite sp
191 poke 53269, peek(53269) and (255 - 2 ^ sp)
192 return
200 rem:::::::x expand sprite sp
201 poke 53277, peek(53277) or 2 ^ sp
202 return
210 rem:::::::c unexpand sprite sp
211 poke 53277, peek(53277) and (255 - 2 ^ sp)
212 return
220 rem:::::::y expand sprite sp
221 poke 53271, peek(53271) or 2 ^ sp
222 return
230 rem:::::::y unexpand sprite sp
231 poke 53271, peek(53271) and (255 - 2 ^ sp)
232 return
240 rem:::::::sp priority over shape
241 poke 53275, peek(53275) and (255 - 2 ^ sp)
242 return
250 rem:::::::shape priority over sp
251 poke 53275, peek(53275) or 2 ^ sp
252 return
260 rem:::::::set sp to color c
261 poke 53287 + sp,c
262 return
270 rem:::::::place sp at x,y
271 xx = x + 24 : yy = y + 50 : z% = xx / 256
272 v = xx - z% * 256 : w = 53248 + sp * 2
273 ww = 53264
274 pr = abs((peek(ww)and 2 ^ sp) <> 0)
275 vv = peek(ww) and (255 - 2 ^ sp) or (2 ^ sp * z%)
276 if pr <> z% then gosub 190
277 poke w,v : poke ww,vv : gosub 180
278 poke 53249 + sp * 2,yy
279 return
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
810 rem:::::::retrieve a sprite
811 gosub 800
812 for i = 0 to 31
813     poke 16384 + 64 * sp + i * 2,p%(i,0)
814     poke 16385 + 64 * sp + i * 2,p%(i,1)
815 next i
816 poke 18424 + sp,sp
817 return
1000 rem::::::::::::::::::::::::
1001 rem      main routine
1002 rem::::::::::::::::::::::::
1003 rem:     shape library    :
1004 rem::::::::::::::::::::::::
1005 dim p%(99,2), l%(99,1), r%(99,2), t(2,2), c(2,2), w(2,2)
1008 data "craft1",31,0
1010 data 0,0,0
1012 data 0,0,0
1014 data 0,16,0
1016 data 0,56,0
1018 data 0,56,0
1020 data 0,56,0
1022 data 0,56,0
1024 data 0,56,0
1026 data 1,187,0
1028 data 3,255,128
1030 data 3,255,128
1032 data 15,255,224
1034 data 252,124,126
1036 data 252,56,126
1038 data 128,56,2
1040 data 128,56,2
1042 data 0,56,0
1044 data 0,56,0
1046 data 0,124,0
1048 data 0,146,0
1050 data 0,146,0
1052 data .,.,.
2000 gosub 10 : c = 11 : gosub 30
2010 poke 53280,c
2020 sp = 0 : rem high sp priority
2030 se$ = "craft1" : gosub 810
2040 gosub 180 : rem turn on
2050 gosub 200 : rem widen
2060 gosub 220 : rem highten
2070 gosub 240 : rem sp over shapes
2080 c = 7 : gosub 260 : rem color
2090 x = 147 : y = 89 : gosub 270 : rem place
6000 get a$
6010 if a$ = " " then gosub 20 : end
6020 goto 6000