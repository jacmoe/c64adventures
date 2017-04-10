5 rem uses ti and ti$ to get and set the clock
10 print chr$(147) : poke 53280,0 : poke 53281,0
20 poke 214,5 : print : poke 211,6
30 print "test your reflexes against"
40 print : print tab(10);
50 print "the reaction tester"
60 for t=1 to 1500 : next t
70 a$=chr$(int(rnd(0)*26)+65)
80 poke 214,10 : print : poke 211,10
90 print "find this key: ";
100 for t=1 to 500 : next t
110 print a$ : ti$="000000"
120 get r$ : if r$="" then 120
130 if r$<>a$ then 120
140 poke 214,14 : print : poke 211,8
150 print "you took";int(ti/0.6)/100;
160 print "seconds"
170 for t=1 to 3000 : next t
180 goto 10