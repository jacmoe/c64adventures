5 rem plots ramdom graphics to the screen
10 print chr$(147);chr$(5)
20 poke 53280,5 : poke 53281,0
30 for n=1 to 1000
40 col=rnd(0)*15
50 x=int(rnd(0)*40)
60 y=int(rnd(0)*23)
70 poke 1024+y*40+x,90+rnd(1)*2 : poke 55296+y*40+x,col
80 next n