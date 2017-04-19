10 rem simple add
20 code = 49152 : rem $c000
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 24              : rem $18               - clc
100 data 169,7          : rem $a9,$07           - lda #$07
110 data 105,3          : rem $69,$03           - adc #$03
120 data 133,251        : rem $85,$fb           - sta $fb
130 data 96             : rem $60               - rts
140 rem
150 sys code
160 print "answer is :";
170 print peek(251)