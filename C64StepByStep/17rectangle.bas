10 print chr$(147);chr$(31)
20 poke 53280,0 : poke 53281,0
30 print "{cm o*18}"
40 for y=1 to 18
50 print "{cm h}{cm g*17}{cm j}"
60 next y
70 print "{cm u*18}"
