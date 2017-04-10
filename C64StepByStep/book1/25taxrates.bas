10 print chr$(147)
20 print : input "a=";a
30 print
40 for c=1 to 6
50 read t
60 print a,"+";t"% =";a+a*t/100
70 next c
80 restore
90 goto 20
100 data 10,12.5,15,17.5,20,25