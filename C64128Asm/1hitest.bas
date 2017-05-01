10 rem hi test program - basic version
20 data 169,72,32,210,255,169,73,32,210,255,96
30 for l = 49152 to 49162
40      read x : poke l,x
50 next l
60 sys 49152