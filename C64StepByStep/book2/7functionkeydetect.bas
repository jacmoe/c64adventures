10 print chr$(147)
20 get a$ : if a$="" then 20
30 a=asc(a$)
40 if a=133 then print "f1" : goto 20
50 if a=137 then print "f2" : goto 20
60 if a=134 then print "f3" : goto 20
70 if a=138 then print "f4" : goto 20
80 if a=135 then print "f5" : goto 20
90 if a=139 then print "f6" : goto 20
100 if a=136 then print "f7" : goto 20
110 if a=140 then print "f8" : goto 20
120 print "not a function" : goto 20