5 rem converts star distance from lightyears to miles
6 rem uses a function
10 print chr$(147) : poke 53280,0 : poke 53281,0
20 poke 214,5 : print
30 print tab(8);"star distance program"
40 print tab(8);"{cm i*21}"
50 def fnc(l)=l*5.88
60 print : print : print
70 print "enter star's distance in light years" : print : print tab(15);
80 input l
90 print : print : print
100 print "the star is ";fnc(l);" thousand billion"
110 print : print tab(10);"miles from earth"