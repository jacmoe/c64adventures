10 print chr$(147);chr$(5) : rem clear screen and set text to white
20 v=10 : x=20 : dx=1
25 poke 53280,6 : poke 53281,12
30 poke 214,y : print : poke 211,x
40 print " ";chr$(113);" ";
50 x=x+dx
60 for t=1 to 5 : next t
70 if x<1 then dx=-dx
80 if x>36 then dx=-dx
90 goto 30
 