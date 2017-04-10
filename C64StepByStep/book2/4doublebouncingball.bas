5 rem two bouncing balls - does not work either - page 73 (book 1 and 2)
10 s=54272 : poke s+24,15
20 poke s+1,115 : poke s,88
30 poke s+5,0 : poke s+6,240
40 poke 53280,0 : poke 53281,0
50 print chr$(147)
60 for r=3 to 18
70 poke 214,r : print chr$(129)
80 print tab(11);chr$(18);" ";
90 print tab(26);" "
100 poke 214,3 : print : poke 211,r+8
110 print chr$(18);" "
120 poke 214,18 : print : poke 211,r+8
130 print chr$(18);" "
140 next r
150 print chr$(159)
160 x=15 : y=15
170 dx=1.2 : dy=-1
180 poke 214,y : print : poke 211,x
190 poke s+4,16
200 x=x+dx : y=y+dy : f=0
210 print " "
220 x1=x1+d1 : y1=y1+d2 : f=0
230 x2=x2+d3 : y2=y2+d4
240 poke 214,y1 : print : poke 211,x1
250 print chr$(156);chr$(113)
260 poke 214,y2 : print : poke 211,x2
270 print chr$(159);chr$(113)
280 if x1<13 or x1>25 then d1=-d1 : f=1
290 if y1<5 or y1>16 then d2=-d2 : f=1
300 if x2<13 or x2>24 then d3=-d3 : f=2
310 if x2<5 or y2>17 then d4=-d4 : f=2
320 if x2<=x1+1 and x2>=x1-1 and y2<=y1+1 and y2>=y1-1 then f=3
330 if f=0 then 180
340 if f=1 then poke s+1,115 : poke s,88 : goto 370
350 if f=3 then poke s+1,55 : poke s,80 : goto 370
360 poke s+1,85 : poke s,88
370 poke s+4,17 : if f=3 then 10
380 goto 180