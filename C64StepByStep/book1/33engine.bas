10 z=1
20 s=54272 : poke s+24,10
30 poke s+5,9 : poke s+4,129
40 poke s,10 : poke s+1,20
50 for t=1 to z : next
60 poke s+5,9 : poke s+4,17
70 poke s,17 : poke s+1,37
80 poke s+4,0
90 for t=1 to 10 : next
100 z=1.2*z
110 goto 20