10 rem double byte subtraction
20 code = 49152
30 for loop = 0 to 13
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 56              : rem $38       - sec
100 data 165,251        : rem $a5,$fb   - lda $fb
110 data 229,253        : rem $e5,$fd   - sbc $fd
120 data 133,251        : rem $85,$fb   - sta $fb
130 data 165,252        : rem $a5,$fc   - lda $fc
140 data 229,254        : rem $e5,$fe   - sbc $fe
150 data 133,252        : rem $85,$fc   - sta $fc
160 data 96             : rem $60       - rts
170 rem
180 print chr$(147)
190 input "highest number";a
200 input "lowest number";b
210 rem calculate high and low bytes
220 ah = int(a / 256)
230 al = a - (ah * 256)
240 bh = int(b / 256)
250 bl = b - (bh * 256)
260 poke 251,al : poke 252,ah
270 poke 253,bl : poke 254,bh
280 sys code
290 low = peek(251) : high = peek(252)
300 result = high * 256 + low
310 print "answer is ";
320 print result