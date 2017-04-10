100 s=54272 : poke s+24,15 : rem turn the volume up!
110 poke s+5,0 : poke s+6,249
120 poke s+4,129
130 for c=0 to 8
140 poke s,0 : poke s+1,44-c*4 : rem frequency change while looping
150 for t=1 to 30 : next
160 next c
170 poke s+4,128