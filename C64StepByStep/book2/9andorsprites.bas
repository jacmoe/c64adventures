5 rem using and and or with sprites
10 print chr$(147); : poke 53280,6
20 poke 53281,2 : for c=0 to 62
30 read byte
40 poke 832+c,byte
50 next c : v=53248 : poke v+16,0
60 for c=0 to 7
70 poke 2040+c,13
80 poke v+39+c,7
90 poke v+2*c+1,90
100 hx=int((32*c+54)/256)
110 poke v+2*c,(32*c+54)-(hx*256)
120 poke v+16,peek(v+16) or (2^c*hx)
130 poke v+21,peek(v+21) or 2^c
140 next c : print chr$(158);
150 poke 214,10 : print : poke 211,1
160 for c=0 to 7
170 print tab(c*4+4);c;
180 next c : print
190 poke 214,15 : print : poke 211,3
200 print "0/1   ";
210 poke 211,6 : input a
220 poke 214,18 : print : poke 211,3
230 print "0-7"; : poke 211,6 : input s
240 poke 214,18 : print : poke 211,3
250 print "                              "
260 if a=1 then 290
270 poke v+21,peek(v+21) and (255-2^s)
280 goto 190
290 poke v+21,peek(v+21) or 2^s
300 goto 190
800 data 3,0,192,2,129,0,0,66,0
810 data 0,126,0,96,255,6,145,153,137
820 data 11,153,208,7,255,224,3,231,192
830 data 3,231,192,99,231,198,147,255,201
840 data 11,126,208,7,0,224,3,255,192
850 data 3,255,192,0,255,0,0,195,0
860 data 0,195,0,4,195,32,7,195,224