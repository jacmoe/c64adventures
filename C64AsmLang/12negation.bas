10 rem two's complement converter
15 rem using sbc
20 code = 49152
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 56              : rem $38       - sec           ; set carry flag
100 data 169,0          : rem $a9,$00   - lda #0        ; load a with 0
110 data 229,251        : rem $e5,$fb   - sbc $fb       ; subtract contents of $fb from i
120 data 133,252        : rem $85,$fc   - sta $fc       ; save result in $fc
130 data 96             : rem $60       - rts
140 rem
150 input "number to be converted";a
160 if a > 255 then print "eror" : goto 160
170 poke  251,a
180 sys code
190 print "the two's complement value is: $";
200 print peek(252)