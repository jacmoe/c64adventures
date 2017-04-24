10 rem single byte mult giving 2 byte result
20 code = 49152
30 for loop = 0 to 19
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,8           : rem $a2,$08           - ldx #$08
100 data 169,0          : rem $a9,$00           - lda #$00
110                       rem again
120 data 70,252         : rem $46,$fc           - lsr $fc
130 data 144,3          : rem $90,$03           - bcc over
140 data 24             : rem $18               - clc
150 data 101,251        : rem $65,$fb           - adc $fb
160                       rem over
170 data 106            : rem $6a               - ror a
180 data 102,253        : rem $66,$fd           - ror $fd
190 data 202            : rem $ca               - dex
200 data 208,243        : rem $d0,$f3           - bne again
210 data 133,254        : rem $85,$fe           - sta $fe
220 data 96             : rem $60               - rts
230 rem
240 print chr$(147)
250 input "multiplicand";a
260 input "multiplier";b
270 poke 251,a : poke 252,b
280 sys code
290 high = peek(254) : low = peek(253)
300 result = high *  256 + low
310 print "result is";
320 print result
330 rem
340 rem 010 x 011 (2x3)
350 rem   010
360 rem x 011
370 rem -------
380 rem   010
390 rem  010
400 rem 000
410 rem -------
420 rem 00110     (6)
430 rem
440 rem shift, but ignore if the multiplier digit is 0
450 rem otherwise add together