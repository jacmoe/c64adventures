5 rem throws a dice 100 times and reports the result
10 print chr$(147) : n=0 : h=0 : t=0
20 print tab(13);"heads-tails"
30 for k=1 to 100
40 a=int(rnd(0)*2)+1 : n=n+1
50 if a=1 then coin$="heads" : goto 70
60 coin$="tails"
70 poke 214,5 : print : poke 211,10
80 print "this throw - ";coin$ : print
90 print tab(5);"heads";tab(28);"tails"
100 if a=1 then h=h+1 : goto 120
110 t=t+1
120 poke 214,9 : print : poke 211,5
130 print tab(6);h;tab(29);t : print
140 print tab(10);"total throws =";n
150 for z=1 to 500 : next
160 next k