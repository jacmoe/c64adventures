10 rem double byte add
20 code = 49152
30 for loop = 0 to 13
40      read  byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 24              : rem $18               - clc
100 data 165,251        : rem $a5,$fb           - lda $fb
110 data 101,253        : rem $65,$fd           - adc $fd
120 data 133,251        : rem $85,$fd           - sta $fb
130 data 165,252        : rem $a5,$fc           - lda $fc
140 data 101,254        : rem $65,$fe           - adc $fe
150 data 133,252        : rem $85,$fc           - sta $fc
160 data 96             : rem $60               - rts
170 rem
180 print chr$(147)
190 print "double byte add demo"
200 print : print
210 input "first number";a
220 rem calculate high and low byte
230 ah = int(a/256)
240 al = a - (ah * 256)
250 input "second number";b
260 rem calculate high and low byte
270 bh = int(b/256)
280 bl = b - (bh * 256)
290 poke 251,al : poke 252,ah
300 poke 253,bl : poke 254,bh
310 sys code
320 low = peek(251) : high = peek(252)
330 result = high * 256 + low
340 print "answer is:";
350 print result