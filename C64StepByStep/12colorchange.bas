10 print chr$(147)
20 for c=1 to 15
30 poke 53280,c : poke 53281,c
40 for k=1 to 300
50 next k
60 next c
70 c=0 : o$="black" : gosub 1000
80 c=1 : o$="white" : gosub 1000
90 c=2 : o$="red" : gosub 1000
100 c=3 : o$="cyan" : gosub 1000
110 c=4 : o$="purple" : gosub 1000
120 c=5 : o$="green" : gosub 1000
130 c=6 : o$="blue" : gosub 1000
140 c=7 : o$="yellow" : gosub 1000
150 c=8 : o$="orange" : gosub 1000
160 c=9 : o$="brown" : gosub 1000
170 c=10 : o$="light red" : gosub 1000
180 c=11 : o$="dark gray" : gosub 1000
190 c=12 : o$="medium gray" : gosub 1000
200 c=13 : o$="light green" : gosub 1000
210 c=14 : o$="light blue" : gosub 1000
220 c=15 : o$="light gray" : gosub 1000
999 end
1000 poke 53280,c
1010 for w=1 to 300 : next w
1020 print o$
1999 return