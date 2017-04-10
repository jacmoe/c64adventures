10 print chr$(147)
20 input "(0-38)    x=";x
30 input "(0-24)    y=";y
40 print chr$(147)
50 poke 214,y : rem address 214 holds the cursor y position
55 print
56 poke 211,x : rem address 211 holds the cursor x position
60 print "x"