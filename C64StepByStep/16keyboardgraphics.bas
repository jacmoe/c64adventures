10 print chr$(147) : poke 53280,12 : poke 53281,2
20 c=1 : print chr$(5)
30 for k=1 to 20 : for d=1 to 40
40 if c=1 then print "{cm e}"; : goto 60
50 print "{cm r}";
60 c=1-c
70 next d
80 c=1-c
90 next k