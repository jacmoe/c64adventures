10 rem simple multiplication
15 rem calculates 5 times 6 by simply adding 5 six times
20 code = 49152
30 for loop = 0 to 16
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 169,0           : rem $a9,$00   - lda #$00      ; init accumulator with 0
100 data 133,251        : rem $85,$fb   - sta $fb       ; store accumulator in location 251
110 data 162,6          : rem $a2,$06   - ldx #$06      ; init x register with 6
120 data 24             : rem $18       - clc           ; clear carry flag
130                       rem loop
140 data 165,251        : rem $a5,$fb   - lda $fb       ; load value of location 251 into accumulator
150 data 105,5          : rem $69,$05   - adc #$05      ; add with carry 5 to accumulator
160 data 133,251        : rem $85,$fb   - sta $fb       ; store accumulator in location 251
170 data 202            : rem $ca       - dex           ; deincrement x register
180 data 208,247        : rem $d0,$f7   - bne loop      ; jump to loop if x is not zero
190 data 96             : rem $60       - rts
200 rem
210 sys code
220 print "result = "
230 print peek(251)