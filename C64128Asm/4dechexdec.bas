10 rem decimal to hex and hex to decimal conversion program
20 dim hex$(8)
30 print chr$(147)
40 print : print "what type of conversion do you want?"
50 print : print "   (a) decimal  to hexadecimal"
60 print "   (b) hexadecimal to decimal"
70 print : print "type 'a' or 'b'" : print : input a$
80 if a$ = "b" then 270
90 if a$ <> "a" then 40
100 print chr$(147) : print : print "this program will translate to decimal"
110 print "numbers from 0 to 99999999" : print "into hexadecimal numbers"
120 print : print "type decimal number (or 'hex' for hex)" : input a$
130 for l = 1 to 8 : hex$(l) = "" : next l
140 if a$ = "hex" then 270
150 for l = 1 to 8 : t$ = right$(a$, l)
155 if asc(t$) < 48 or asc(t$) > 57 then 120
156 next l
160 if len(a$) < 1 or len(a$) > 8 then 120
170 n = val(a$)
180 i = 8
190 tmp = n : n = int(n / 16)
200 tmp = tmp - n * 16
210 if tmp < 10 then hex$(i) = right$(str$(tmp), 1) : goto 230
220 hex$(i) = chr$(tmp - 10 + asc("a"))
230 if n <> 0 then i = i - 1 : goto 190
240 print "hex: ";
250 for l = 1 to 8 : print hex$(l); : next l : print
260 goto 120
270 print chr$(147) : print : print "this program will convert hexadecimal"
280 print "numbers from 0 to ffffffff" : print "into decimal numbers"
290 print : print "type hex number (or 'dcx' for decimal):" : input a$
300 if a$ = "dcx" then 100
310 if len(a$) > 8 then 290
320 n = 0
330 for l = 1 to len(a$)
340     hex$(l) = mid$(a$, l, 1)
350     if hex$(l) < "9" then n = n * 16 + val(hex$(l)) : goto 390
360     if hex$(l) < "a" then 290
370     if hex$(l) > "f" then 290
380     n = n * 16 + asc(hex$(l)) - asc("a") + 10
390 next l
400 print "dec: ";n : print
410 goto 290
420 end