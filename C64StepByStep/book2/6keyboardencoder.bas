10 print chr$(147)
20 print "type encoder"
30 get a$ : if a$="" then 30
40 if a$<"a" then 90
50 if a$>"z" then 90
60 a=asc(a$)+2
70 if a>90 then a=a-26
80 a$=chr$(a)
90 print a$;
100 goto 30