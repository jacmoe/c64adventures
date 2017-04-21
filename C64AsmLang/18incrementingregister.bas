10 rem incrementing a register
20 code = 49152
30 for loop = 0 to 16
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 169,65          : rem $a9,$41           - lda #asc"a"   ; place ascii a in accumulator
100 data 170            : rem $aa               - tax           ; save it in x register
110 data 232            : rem $e8               - inx           ; increment x to give code for 'b'
120 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print 'a' to screen
130 data 138            : rem $8a               - txa           ; transfer ascii code for 'b' to accumulator
140 data 232            : rem $e8               - inx           ; increment x to give code for 'c'
150 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print 'b' to screen
160 data 138            : rem $8a               - txa           ; transfer ascii code for 'c' into accumulator
170 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print 'c' to screen
180 data 96             : rem $60               - rts           ; back to basic
190 rem
200 sys code