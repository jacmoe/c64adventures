10 poke 53280,11 : poke 53281,0
20 for y=0 to 24
30 for x=0 to 39
40 poke 1024+y*40+x,81
50 poke 55296+y*40+x,x
60 next x
70 next y