10 rem commodore's real-time "jiffy" clock
20 rem is a 3-byte binary counter
30 rem incremented by one sixty times a second
40 poke 162,0 : rem location 162 changes sixty times a second
50 poke 161,0 : rem location 161 changes whenever 162 overflows from 255
60 rem location 160 is incremented whenever 161 overflows
65 print "what is your name";
70 input name$ : print
75 rem peek what's in locations 162 and 161
80 t=int((peek(162)+peek(161)*256)/60)
90 print "your answer took";t;"seconds"