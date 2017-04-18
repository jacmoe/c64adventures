10 rem commodore 64 hex loader
20 print chr$(147)              : rem clear screen
30 print spc(8)                 : rem home cursor
40 print "commodore 64 monitor"
50 print : print
60 input "assembly address";a$
70 addr = val(a$)
80 rem main program loop
90 print addr; " :$";
100 rem get high nibble of byte
110 gosub 2000
120 high = num
130 print z$;
140 rem get low nibble of byte
150 gosub 2000
160 low = num
170 print z$
180 rem calculate byte and update
190 byte = high * 16 + low
200 poke addr,byte
210 addr = addr + 1
220 goto 80
300 rem
500 rem subroutine
2000 get z$
2010 if z$ = "s" then print "stop" : end
2020 if z$ > "f" then goto 2000
2030 if z$ = "a" then num = 10 : return 
2040 if z$ = "b" then num = 11 : return
2050 if z$ = "c" then num = 12 : return
2060 if z$ = "d" then num = 13 : return
2070 if z$ = "e" then num = 14 : return
2080 if z$ = "f" then num = 15 : return
2090 if z$ = " " goto 2000
2100 num = val(z$) : return
 