10 rem integer to fp
20 code = 49152
30 for loop = 0 to 17
40      read byte
50      poke loop + code,byte
60 next loop
70 rem
80 rem m/c data
90 data 169,1           : rem $a9,$01           - lda #1        ; high byte into a
100 data 160,35         : rem $a0,$23           - ldy #$23      ; low byte into y
110 data 32,145,179     : rem $20,$91,$b3       - jsr $b391     ; call conversion routine
120 data 162,6          : rem $a2,$06           - ldx #6        ; init x to 6
125                       rem again
130 data 181,96         : rem $b5,$60           - lda $60,x     ; extract value from fac#1
140 data 157,52,3       : rem $9d,$34,$03       - sta $0334,x   ; store the value
150 data 202            : rem $ca               - dex           ; deincrement x
160 data 208,248        : rem $d0,$f8           - bne again     ; if x is not zero, extract another number
170 data 96             : rem $60               - rts
180 rem
190 print chr$(147)
200 sys code
210 print "fac#1 = ";
220 for x = 1 to 6
230     print peek(820 + x);" ";
240 next x
250 rem
260 rem The integer value to be converted is $0123, and the high
270 rem and low bytes are placed in the appropriate registers (lines 90 and 100)
280 rem before the conversion routine is called (line 110)
290 rem The floating point value is extracted from fac#1, so that it can be
300 rem peeked by the basic loop.
310 rem
320 rem
330 rem Result is:
340 rem fac#1 = 137     145     128     0       0       0
350 rem
360 rem Exponent = 9    (137 - 128)
370 rem Two bytes, in binary:
380 rem 1101 0001       1000 0000
390 rem 145             128
400 rem
410 rem Moving decimal point 9 places to the right gives:
420 rem
430 rem 0000    0001    0010    0011
440 rem $01             $23
450 rem
460 rem $0123 was the original value, so conversion works!