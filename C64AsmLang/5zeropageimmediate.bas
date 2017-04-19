10 rem zero page and immediate addressing
20 code = 49152 : rem $c000
30 for loop = 0 to 9
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,33          : rem $a2,$21           - ldx #asc"!"
100 data 164,251        : rem $86,$fb           - stx $fb
110 data 165,251        : rem $a5,$fb           - lda $fb
120 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2
130 data 96             : rem $60               - rts
140 rem
150 sys code