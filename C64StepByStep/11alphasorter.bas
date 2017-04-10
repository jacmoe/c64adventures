10 print chr$(147)
20 print : input "enter word 1";a$
30 input "enter word 2";b$
40 if a$=b$ then print "they are the same string" : goto 10
50 if a$>b$ then print a$;" comes after ";b$ : goto 20
60 print a$;" comes before ";b$ : goto 20