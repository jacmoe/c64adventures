10 for n=1 to 5
20 print chr$(147)
30 print : print tab(8);"temperature conversion"
40 poke 214,10 : print : input "give me a fahrenheit temperature";temp
50 poke 214,18 : print : poke 211,5
60 print temp;"fahrenheit = ";int((temp-32)*5/9+0.5);"centigrade"
70 for a=1 to 5000
80 next a
90 next n