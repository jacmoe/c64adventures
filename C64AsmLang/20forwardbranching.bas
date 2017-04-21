10 rem forward branching
20 code = 49152
30 for loop = 0 to 14
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 165,251         : rem $a5,$fb           - lda $fb       ; load byte at location $fb into accumulator
100 data 240,6          : rem $f0,$06           - beq zero      ; branch to zero if a contains 0
110 data 169,78         : rem $a9,$4e           - lda #asc"n"   ; load n into accumulator
120                       rem back
130 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print to screen
140 data 96             : rem $60               - rts
150                       rem zero
160 data 169,89         : rem $a9,$59           - lda #asc"y"   ; load y into accumulator
170 data 24             : rem $18               - clc           ; clear carry
180 data 144,247        : rem $90,$f7           - bcc back      ; forced branching: carry is clear, so jump to back
190 rem
200 sys code