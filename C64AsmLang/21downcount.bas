10 rem down count
20 code = 49152
30 for loop = 0 to 10
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,10          : rem $a2,$0a           - ldx #10       ; load 10 into x register
100 data 169,33         : rem $a9,$21           - lda #asc"!"   ; load ascii ! into accumulator
110                       rem loop
120 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print to screen
130 data 202            : rem $ca               - dex           ; deincrement x register
140 data 208,250        : rem $d0,$fa           - bne loop      ; branch if non zero, i.e. if zero flag is set
150 data 96             : rem $60               - rts
160 rem
170 sys code