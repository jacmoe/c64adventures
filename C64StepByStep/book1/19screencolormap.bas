10 print chr$(147) : rem clear screen
15 poke 53280,0 : poke 53281,0
20 x=0 : y=0 : c=81 : d=11 : gosub 1000
30 x=0 : y=1 : c=81 : d=11 : gosub 1000
40 x=1 : y=1 : c=81 : d=8 : gosub 1000
50 x=1 : y=2 : c=81 : d=8 : gosub 1000
60 x=2 : y=2 : c=81 : d=8 : gosub 1000
70 x=2 : y=3 : c=81 : d=2 : gosub 1000
80 x=2 : y=4 : c=81 : d=2 : gosub 1000
85 rem position cursor at 0,6
90 poke 211,0 : poke 214,6
999 end
1000 rem plots to screen memory
1005 rem screen memory starts at 1024
1006 rem there is 25 rows
1008 rem each row is 40 columns wide
1010 poke 1024+y*40+x,c
2000 rem plots to colour memory
2010 rem colour memory starts at 55296
2015 rem 25 rows, 40 columns
2020 poke 55296+y*40+x,d
2999 return 