2000 rem :::::: helper program
2010 print chr$(147) chr$(18) spc(15) "helper"
2020 a$ = "" : input "mem/data"; a$ : if a$ = "" then end
2030 i = 0 : j = 7 : gosub 4030 : rem get addr
2040 addr = t : if t < 49152 or t > 50504 then print "error. try again." : goto 2020
2050 if len(a$) = 28 then 3070 : rem poker
2060 if len(a$) > 4 then print "error. try again." : goto 2020
2070 ck = 0
2080 for i = 0 to 7
2090 print " ";
3000 p% = peek(addr + i) : ck = ck + p%
3010 ph% = p% / 16 : pl% = p% - ph% * 16
3020 if ph% > 9 then ph% = ph% + 7
3030 if pl% > 9 then pl% = pl% + 7
3040 print chr$(ph% + 48) chr$(pl% + 48)
3050 next i : print : print "sum for this row:" ck : print
3060 goto 2020
3070 ck = 0
3080 for j = 0 to 7
3090 gosub 4030 : ck = ck + t
4000 poke ad + j,t
4010 next j : print "sum for this row:" ck : print
4020 goto 2020
4030 t = 0
4040 i = i + 1
4050 if i > len(a$) and j = 7 then return
4060 a = asc(mid$(a$, i))
4070 if a = 32 then return
4080 a = a + 48 * (a < 58)
4090 a = a + 55 * (a > 64)
5000 if a < 0 or a > 15 then print "error. try again." : goto 2020
5010 t = t * 16 + a
5020 goto 4040