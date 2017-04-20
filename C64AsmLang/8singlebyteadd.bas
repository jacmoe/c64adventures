10 rem single byte add
20 code = 49152
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 24              : rem $18               - clc
100 data 165,251        : rem $a5,$fb           - lda $fb
110 data 101,252        : rem $65,$fc           - adc $fc
120 data 133,253        : rem $85,$fd           - sta $fd
130 data 96             : rem $60               - rts
140 rem
150 print chr$(147)
160 print "single byte add demo"
170 print : print
180 input "first number";a
190 input "second number";b
200 poke 251,a : poke 252,b
210 sys code
220 print "answer is:";
230 print peek(253)