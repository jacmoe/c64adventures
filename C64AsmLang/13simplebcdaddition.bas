10 rem simple bcd addition
20 code = 49152
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 248             : rem $f8       - sed           ; set decimal mode
100 data 24             : rem $18       - clc           ; set carry flag
110 data 169,9          : rem $a9,$09   - lda #$09      ; get first value
120 data 105,5          : rem $69,$05   - adc #$05      ; subtract a number
130 data 133,251        : rem $85,$fb   - sta $fb       ; save result
140 data 216            : rem $d8       - cld           ; clear decimal mode
150 data 96             : rem $60       - rts
160 rem
170 sys code
180 print peek(251)