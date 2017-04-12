1 goto 500
2 rem this code has a bug in shape paint code
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
41 sys 49165,c
44 return
50 rem:::::::::::paint background
51 sys 49157
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
71 sys 49321,x,y,c
74 return
80 rem:::::::::::plot a line
81 sys 49321,x1,y1 to x2,y2,c
89 return
90 rem:::::::::::paint a shape
91 sys 49551,x0,y0,w,h,c,pc
99 return
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
240 rem:::::::::::draw a rectangle
241 x1 = x0 + w : y1 = y0
242 x2 = x0 : y2 = y0 : gosub 80
243 x1 = x0 : y1 = y0 + h : gosub 80
244 x2 = x0 + w : y2 = y0 + h : gosub 80
245 x1 = x0 + w : y1 = y0 : gosub 80
246 return
250 rem:::::::::::draw/paint rectangle
251 gosub 240
252 goto 90
260 rem:::::::::::draw a polygon
261 k = 2 * {pi} / t - .0001
262 for j = 0 to 2 * {pi} step k
263 w = r * sin(j) * 1.2345
264 h = r * cos(j) * sc
265 if j = 0 then x1 = x0 + w: y1 = y0 + h
266 x2 = x0 + w : y2 = y0 + h : gosub 80
267 x1 = x2 : y1 = y2
268 next j
269 return
270 rem:::::::::::draw/paint polygon
271 gosub 260
272 x0 = x0 - r * 1.2345
273 y0 = y0 - r * sc
274 h = r * 2 * sc
275 w = r * 2 * 1.2345
276 goto 90
280 rem:::::::::::draw a circle
281 t = 30
282 goto 260
499 rem:::::::::::startup section
500 for i = 49152 to 49189
501 read a : poke i,a : t = t + a
502 next i
503 if t <> 5205 then print "error in 500-516" : stop
504 t = 0
510 rem:::::::::::clear and paint
511 data 134,32,0,0,0,169,0
512 data 160,96,162,32,208,8,32
513 data 241,183,138,160,68,162,4
514 data 132,252,160,0,132,251,145
515 data 251,200,208,251,230,252,202
516 data 208,246,96
518 rem:::::::::::eof clear and paint
520 for i = 49190 to 49263
521 read a: poke i,a : t = t + a
522 next i
523 if t <> 8819 then print "error in 520-541" : stop
524 t = 0
530 rem:::::::::::find a point
531 data 173,62,3,72,41,248,168
532 data 32,162,179,169,0,160,192
533 data 32,40,186,32,247,183,24
534 data 173,60,3,72,41,248,101
535 data 20,133,251,133,253,173,61
536 data 3,101,21,72,74,102,253
537 data 74,102,253,74,102,253,24
538 data 105,68,133,254,104,105,96
539 data 133,252,104,41,7,170,104
540 data 41,7,101,251,144,2,230
541 data 252,133,251,96
542 rem:::::::::::eof find a point
550 for i = 49264 to 49367
551 read a : poke i,a : t = t + a
552 next i
553 if t <> 10943 then print "error in 550-575" : stop
554 t = 0
560 rem:::::::::::misc routines
561 data 162,64,44,162,69,44,162
562 data 74,44,162,79,44,162,84
563 data 160,3,76,212,187,169,64
564 data 44,169,69,44,169,84,160
565 data 3,76,162,187,32,124,192
566 data 32,247,183,166,20,164,21
567 data 142,89,3,140,90,3,96
568 data 128,64,32,16,8,4,2
569 data 1,32,253,174,32,235,183
570 data 142,62,3,166,20,164,21
571 data 142,60,3,140,61,3,201
572 data 164,240,24,32,241,183,142
573 data 63,3,32,38,192,160,0
574 data 177,251,29,161,192,145,251
575 data 173,63,3,145,253,96
576 rem:::::::::::eof misc routines
580 for i = 49368 to 49444
581 read a : poke i,a : t = t + a
582 next i
583 if t <> 7925 then print "error in 580-601" : stop
584 t = 0
590 rem:::::::::::plot part 1
591 data 32,115,0,32,138,173,32
592 data 15,188,172,60,3,173,61
593 data 3,32,145,179,32,112,192
594 data 32,83,184,32,118,192,70
595 data 102,32,144,192,32,241,183
596 data 138,168,32,162,179,32,15
597 data 188,172,62,3,32,162,179
598 data 32,115,192,32,83,184,32
599 data 121,192,70,102,169,84,160
600 data 3,32,91,188,48,11,32
601 data 43,188,208,3,76,192,192
602 rem:::::::::::eof plot part 1
610 for i = 49445 to 49550
611 read a : poke i,a : t = t + a
612 next i
613 if t <> 11077 then print "error in 610-636" : stop
614 t = 0
620 rem:::::::::::plot part 2
621 data 32,144,192,32,137,192,169
622 data 74,160,3,32,15,187,32
623 data 118,192,32,137,192,169,79
624 data 160,3,32,15,187,32,121
625 data 192,32,241,183,142,63,3
626 data 32,198,192,32,131,192,169
627 data 74,160,3,32,103,184,32
628 data 43,188,48,52,32,112,192
629 data 32,247,183,165,20,166,21
630 data 141,60,3,142,61,3,32
631 data 134,192,169,79,160,3,32
632 data 103,184,32,43,188,48,21
633 data 32,115,192,32,247,183,165
634 data 20,141,62,3,206,89,3
635 data 208,191,206,90,3,16,186
636 data 96
637 rem:::::::::::eof plot part 2
640 for i = 49551 to 49658
641 read a : poke i,a : t = t + a
642 next i
643 if t <> 9829 then print "error in 640-666" : stop
644 t = 0
650 rem:::::::::::paint a shape part 1
651 data 32,89,194,141,60,3,140
652 data 61,3,142,66,3,32,89
653 data 194,141,64,3,140,65,3
654 data 142,67,3,32,241,183,142
655 data 63,3,32,253,174,32,138
656 data 173,32,118,192,169,0,141
657 data 72,3,141,73,3,173,66
658 data 3,141,69,3,173,67,3
659 data 141,68,3,173,69,3,141
660 data 62,3,32,38,192,160,0
661 data 177,251,61,161,192,208,52
662 data 173,73,3,240,34,169,0
663 data 141,73,3,173,72,3,208
664 data 16,173,69,3,141,70,3
665 data 169,1,141,71,3,141,72
666 data 3,208,8
667 rem:::::::::::eof paint a shape part 1
670 for i = 49659 to 49763
671 read a : poke i,a : t = t + a
672 next i
673 if t <> 11207 then print "error in 670-695" : stop
674 t = 0 : rem FIXME:is this needed?
680 rem:::::::::::paint a shape part 2
681 data 32,59,194,169,0,141,72
682 data 3,238,69,3,238,71,3
683 data 206,68,3,208,188,240,21
684 data 169,1,141,73,3,238,69
685 data 3,206,68,3,208,173,173
686 data 72,3,240,3,32,59,194
687 data 238,60,3,208,3,238,61
688 data 3,206,64,3,208,132,206
689 data 65,3,48,3,76,182,193
690 data 96,173,70,3,141,62,3
691 data 32,190,224,169,74,160,3
692 data 32,91,188,16,3,32,198
693 data 192,238,62,3,206,71,3
694 data 208,233,96,32,253,174,32
695 data 235,183,165,20,164,21,96
696 rem:::::::::::eof paint a shape part 2
700 rem:::::::::::::::::::::::::::::::::::
701 rem:::::::::::end of toolkit
702 rem:::::::::::::::::::::::::::::::::::
1000 rem:::::::::::main
1010 gosub 20 : rem graphics
1020 c = 14 : gosub 40 : rem colors
1030 gosub 50 : rem background
1200 rem:::::::::::rectangle test
1210 x0 = 10 : y0 = 100
1220 h = 30 : w = 70
1230 c = 30 : gosub 240
1300 rem:::::::::::paint rectangle test
1310 x0 = 50 : y0 = 25
1320 w = 15 : h = 10
1330 c = 46 : pc = 1
1340 gosub 250
1400 rem:::::::::::draw polygon test
1410 x0 = 100 : y0 = 75
1420 r = 20 : t = 5
1430 sc = 1 : c = 62
1440 gosub 260
1500 rem:::::::::::paint polygon test
1510 x0 = 50 : y0 = 50
1530 r = 10 : t = 6
1540 sc = 1 : pc = 1 : c = 78
1550 gosub 270
1600 rem:::::::::::draw circle test
1610 x0 = 100 : y0 = 100
1620 r = 15 : c = 110
1630 sc = 1
1640 gosub 280
6000 get a$
6010 if a$ = " " then 6030
6020 goto 6000
6030 gosub 30 : rem back to text mode
6035 gosub 140 : rem turn off sprite
6040 end