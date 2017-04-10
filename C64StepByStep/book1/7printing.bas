10 print chr$(147) : rem clear screen
12 poke 53280,1 : poke 53281,1 : rem paint the screen white
14 print chr$(144) : rem black text
15 print "printing with space between"
18 print chr$(151);"print 1;2;3;4;5;6;7;8";chr$(144)
20 print : print 1;2;3;4;5;6;7;8 : print
25 print "printing in zones"
28 print chr$(151);"print 1,2,3,4,5,6,7,8";chr$(144)
30 print : print 1,2,3,4,5,6,7,8 : print