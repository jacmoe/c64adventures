10 print chr$(147)
20 for x = 0 to 249
30 poke 55296 + x,x :  poke 55546 + x,x
40 poke 55796 + x,x :  poke 56046 + x,x
60 poke 1024 + x,x :  poke 1274 + x,x
70 poke 1524 + x,x :  poke 1774 + x,x
80 next