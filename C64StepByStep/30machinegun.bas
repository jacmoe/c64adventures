10 s=54272 : poke s+24,15 : rem turn up the volume!
20 for k=1 to 10
30 poke s+4,129 : rem random noise on
40 poke s+5,6 : poke s+6,89 : rem envelope: rise quickly, decay fast
50 poke s,0 : poke s+1,50
60 for t=1 to 65 : next
70 poke s+4,128 : rem random noise off
80 next k