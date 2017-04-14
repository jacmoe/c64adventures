0 if peek(49152) <> 128 then load "m/l",8,1
1 goto 1000
10 rem:::::::graphics
11 if mu then poke 53270,216
12 poke 53265,59
13 poke 53272,29
14 poke 56576,198
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
1000 rem::::::::::::::::::::::::
1001 rem      main routine
1002 rem::::::::::::::::::::::::
1010 print "press any key to begin:"
1020 get a$
1030 if a$ = "g" then gosub 10
1040 if a$ = "t" then gosub 20
1050 if a$ = "c" then c = int(rnd(1) * 16) : gosub 30
1090 goto 1020