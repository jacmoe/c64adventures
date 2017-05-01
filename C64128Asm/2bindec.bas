10 rem binary to decimal conversion program
20 dim bit(8), bits$(8)
30 print chr$(147)
40 print : print "      binary-decimal conversion"
50 print : print "enter an 8-bit binary number:" : print : input a$
60 if len(a$) <> 8 then 50
70 for l = 8 to 1 step -1
80      bit$(l) = mid$(a$, l, 1)
90      if bit$(l) <> "0" and bit$(l) <> "1" then 50
100 next l
110 for l = 1 to 8
120     bit(l) = val(bit$(l))
130 next l
140 ans = 0
150 m = 256
160 for l = 1 to 8
170     m = m / 2 : ans = ans + bit(l) * m
180 next l
190 print "decimal:";ans
200 goto 50