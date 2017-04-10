10 print chr$(147)
20 poke 53280,12 : poke 53281,0
30 x=10 : y=7 : dx=1 : dy=-1
40 if x<3 then dx=-dx
50 if x>35 then dx=-dx
60 if y<2 then dy=-dy
70 if y>19 then dy=-dy
80 x=x+dx : y=y+dy : restore
90 poke 214,y : print : poke 211,x
100 read a$ : print a$
110 poke 214,y+1 : print : poke 211,x+1
120 read b$ : print b$
130 for t=1 to 10 : next t
140 print chr$(147) : goto 40
150 data "{red}{reverse on}{cm v}K  {reverse off}","{blue}Q Q"