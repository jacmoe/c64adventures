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
1005 dim p%(99,2), l%(99,1), r%(99,2), t(2,2), c(2,2), w(2,2)
1008 data "square", 3, 3
1010 data 16,8,31,8,31,23,16,23
1012 data 0,1,1,2,2,3,3,0
1014 data "scale shape",3,3
1016 data -31,-4,31,-4,31,4
1018 data -31,4
1020 data 0,1,1,2,2,3,3,0
2000 gosub 10 : c = 7 : gosub 30
2010 poke 53280,c
2020 se$ = "scale shape" : gosub 800
2030 gosub 110
2040 c = 6
2045 for l = 1 to 10
2050 xt = 159 : yt = 99 : gosub 140
2060 gosub 90
2070 gosub 110
2080 xs = xs * 1.2 : ys = ys * 1.2 : gosub 150
2090 next l
6000 get a$
6010 if a$ = " " then goto 6030
6020 goto 6000
6030 print chr$(6) chr$(147) : gosub 20 : end