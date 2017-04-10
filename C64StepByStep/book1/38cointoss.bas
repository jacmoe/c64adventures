5 rem simuates tossed coins
10 print chr$(147)
20 print "heads-tails"
30 print : print
35 rem a is a whole random number between 1 and 2 inclusive
40 a=int(rnd(0)*2)+1
50 if a=1 then coin$="heads" : goto 70
60 coin$="tails"
70 print coin$,
80 for q=1 to 200 : next
90 goto 40