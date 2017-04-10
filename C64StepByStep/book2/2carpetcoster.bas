10 print chr$(147) : def fnc(z)=(x*y)*z : poke 53280,0 : poke 53281,0
20 print "carpet costing program" : print : print
30 input "how many rooms to carpet";n : print
40 print "what is the cost of carpet"
50 input "per unit area";p
60 t=0 : for c=1 to n
70 print chr$(147)
80 poke 214,4 : print : poke 211,5 : poke 53280,4 : poke 53281,6
90 print chr$(176);
100 for k=1 to 20
110 print chr$(99); : next k
120 print chr$(174)
130 for k=1 to 10
140 poke 211,5 : print chr$(98);
150 poke 211,26 : print chr$(98)
160 next k
170 poke 211,5 : print chr$(173);
180 for k=1 to 20
190 print chr$(99); : next k
200 print chr$(189)
210 poke 214,9 : print : poke 211,9
220 print "n =";c
230 poke 214,2 : print : poke 211,6
240 poke 214,9 : print : poke 211,28
250 print "x ="
260 poke 211,28 : input x
270 poke 214,17 : print : poke 211,10
280 input "y =";y
290 print chr$(147) : poke 53280,0 : poke 53281,0
300 poke 214,6 : print : poke 211,8
310 print "cost per unit area";p
320 print : print tab(8);"length";x
330 print : print tab(8);"width";y
340 print : print tab(8);"cost";fnc(p)
350 t=t+fnc(p) : print : print
360 print tab(8);"total cost";t
370 for z=1 to 2000 : next z : next c