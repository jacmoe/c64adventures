10 print chr$(147);chr$(158)
20 poke 53280,5 : poke 53281,0
30 poke 214,20 : print
40 print tab(18);chr$(191);chr$(18);chr$(183);chr$(191)
50 print tab(17);chr$(191);chr$(18);chr$(184);" ";chr$(184);chr$(191)
60 x=7 : y=19
70 poke 214,y : print
80 print tab(19);" "
90 poke 214,6 : print
100 print tab(x);"  "
110 x=x+1 : y=y-1
120 if x>36 then x=5
130 if y<1 then y=19
140 poke 214,6 : print
150 print tab(x);chr$(153);"]>"
160 poke 214,y : print
170 print tab(19);chr$(5);"^"
180 if x=18 and y=6 or x=19 and y=6 then 200
190 goto 70
200 for t=1 to 1000 : next t : goto 10