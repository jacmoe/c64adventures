10 rem ascii string output routine
20 code = 49152
30 for loop = 0 to 26
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 104             : rem $68               - pla
100 data 133,251        : rem $85,$fb           - sta $fb
120 data 104            : rem $68               - pla
130 data 133,252        : rem $85,$fc           - sta $fc
140                       rem repeat
150 data 160,0          : rem $a0,$00           - ldy #$00
160 data 230,251        : rem $e6,$fb           - inc $fb
170 data 208,2          : rem $d0,$02           - bne clear
180 data 230,252        : rem $e6,$fc           - inc $fc
190                       rem clear
200 data 177,251        : rem $b1,$fb           - lda ($fb),y
210 data 48,6           : rem $30,$06           - bmi finish
220 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2
230 data 76,6,192       : rem $4c,$06,$c0       - jmp repeat
240                       rem finish
250 data 108,251,0      : rem $6c,$fb,$00       - jmp ($fb)
260 rem
270 rem demo routine
280 rem located at $c200
290 demo = 49664
300 for loop = 0 to 22
310     read byte
320     poke demo + loop,byte
330 next loop
340 rem
350 data 169,147        : rem $a9,$93           - lda #$93
360 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2
370 data 32,0,192       : rem $20,$00,$c0       - jsr output
380 rem now store ascii codes for printing
390 data 67,79,77,77,79,68,79,82,69,32,54,52,13
400 rem   c, o, m, m, o, d, o, r, e, , 6, 4, <cr>
410 data 234            : rem $ea               - nop
420 data 96             : rem $60               - rts
430 sys demo