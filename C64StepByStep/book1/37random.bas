5 rem displays a box in which random numbers are displayed
10 print chr$(147);chr$(5) : print : print
20 poke 53280,4 : poke 53281,6
30 for c=9 to 27 : poke 214,10 : print
40 print tab(c);"*" : poke 214,14
50 print : print tab(c);"*"
60 next c
70 for r=11 to 13 : poke 214,r : print
80 print tab(9);"*";tab(27);"*"
90 next r
100 poke 214,12 : print : poke 211,12
105 rem generates random numbers between 0 and 0.999999999
110 print rnd(0)
115 rem random whole numbers between 0 and 9 inclusive:
118 rem int(rnd(0)*10)
120 for t=1 to 1000 : next
130 poke 214,12 : print : poke 211,10
140 print "               ";
150 goto 100