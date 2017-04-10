5 rem from page 73 in book 1 and 2, but does not appear to work
10 s=54272 : poke s+24,15
20 poke s+5,0 : poke s+6,240
30 poke 53280,0 : poke 53281,0
40 poke s+4,16 : print chr$(147)
50 for r=3 to 18
60 poke 214,r : print chr$(129)
70 print tab(11);chr$(18);" ";
80 print tab(26);" "
90 poke 214,3 : print : poke 211,r+8
100 print chr$(18);" "
110 poke 214,18 : print : poke 211,r+8
120 print chr$(18);" "
130 next r
140 x1=int(rnd(0)*10)+14 : y1=15
150 d1=0.9 : d2=-1
160 x2=14 : y2=int(rnd(1)*10)+6
170 d3=-1 : d4=0.8
180 poke 214,y1 : print : poke 211,x1
190 print " " : poke s+4,16
200 poke 214,y2 : print : poke 211,x2
210 poke 214,y : print : poke 211,x
220 print chr$(113)
230 if x<13 or x>25 then dx=-dx : f=1
240 if y<5 or y>16 then dy=-dy : f=1
250 if f=0 then 180
260 poke s+4,17
270 goto 180