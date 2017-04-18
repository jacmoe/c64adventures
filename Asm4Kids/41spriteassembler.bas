10 print chr$(147) : r = 1
20 print "starting address as block:"
30 print "block 11: 704 - 767"
40 print "block 13: 832 - 895"
50 print "block 14: 896 - 959"
60 print "block 15: 960 - 1023"
70 for x = 1 to 39
80 print chr$(18);chr$(32); : next : print
90 input "block number";bl
100 if bl <> 11 and bl <> 13 and bl <> 14 and bl <> 15 then 90
110 sa = bl * 64
120 for x = sa to sa + 62 step 3
130 print "row";r
140 input a,b,c
150 if a <> 255 or b > 255 or c > 255 then 130
160 poke x,a : poke x + 1,b : poke x + 2,c
170 r = r + 1 : next
200 rem ****************
210 rem write to disk
220 rem ****************
230 lb = sa - int(sa/256) * 256
240 hb = int(sa/256)
250 input "enter sprite name";sn$
260 sn$ = "0:" + sn$ + str$(bl) + ",p,w"
270 open2,8,2,sn$
280 print#2, chr$(lb) + chr$(hb)
290 for v = sa to sa + 62 : sc = peek(v)
300 print#2, chr$(sc)
310 next v
320 close2