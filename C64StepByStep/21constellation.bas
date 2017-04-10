5 rem demonstation of how to use a data statement
10 poke 53280,6 : poke 53281,6 : print chr$(147);chr$(5)
20 poke 214,6 : print : poke 211,7
30 print "ursa major"
40 data 8,25,12,18,13,11,13,14,13,27,16,7,16,21
50 number=7 : rem 14/2=7
60 for n=1 to number
70 read y,x
80 poke 214,y : print : poke 211,x
90 print "*"
100 for t=1 to 300 : next t
110 next n
120 print chr$(31)