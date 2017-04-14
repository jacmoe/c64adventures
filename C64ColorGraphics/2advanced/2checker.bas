1 i=49152 : r = 1
2 t = 0
3 for j = i to i + 127
4 t = t - peek(j) * (j < 50509)
5 next
6 reads : if s <> t then print "error in block"r : end
7 i = i + 128 : print "block"r"is ok" : r = r + 1 : if r > 11 then end
8 goto 2
10 data 15494, 13405, 13567, 12697, 13656, 11506, 13622
11 data 14447, 13025, 15192, 8817