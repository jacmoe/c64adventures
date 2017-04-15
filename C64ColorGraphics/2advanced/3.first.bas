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
1000 rem::::::::::::::::::::::::
1001 rem      main routine
1002 rem::::::::::::::::::::::::
2000 gosub 10 : c = 15 : gosub 30
2010 for k = 0 to 99 step 3
2020 x1 = 0 : y1 = 0
2030 y2 = k : x2 = 160 - k * 1.6 : c = 2 : gosub 50
2040 y1 = 199
3000 y2 = 199 - y2 : c = 5 : gosub 50
3010 x1 = 319
3020 x2 = 319 - x2 : c = 8 : gosub 50
3030 y1 = 0
3040 y2 = 199 - y2 : c = 6 : gosub 50
4000 next k
5000 x1 = 159 : y1 = 10
5010 x2 = 305 : y2 = 100 : c = 10 : gosub 50
5020 x2 = 319 - x2 : gosub 50
5030 y1 = 199 - y1 : gosub 50
5040 x2 = 319 - x2 : gosub 50
5050 for p = 0 to 3000 : next p
6000 run