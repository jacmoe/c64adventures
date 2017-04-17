10 print chr$(147)
20 for y = 0 to 9 : rem loop 1
30 for x = 33 to 127 : rem loop 2
40 print chr$(x);
50 next x : rem branch to loop 2
60 next y : rem branch to loop 1