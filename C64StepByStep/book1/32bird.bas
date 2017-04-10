10 s=54272 : poke s+24,15
20 poke s+5,0 : poke s+6,240
30 k=1
40 poke s+4,65 : poke s+3,8
50 poke s,0 : poke s+1,100
60 for t=1 to 60 : next
70 poke s+4,65 : for c=0 to 6
80 poke s+1,c*15+150
90 next c : poke s+4,0
100 for t=1 to 200 : next
110 k=k+1 : if k=2 then 70
120 for t=1 to 250 : next : goto 10